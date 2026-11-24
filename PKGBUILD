# Maintainer: Paulo Fino <somepaulo>
pkgname=akhenaten-git
pkgver=0.2.9.ra0.29.r211.g790ee246a
pkgrel=2
epoch=1
pkgdesc='Open source engine for Pharaoh and Cleopatra'
arch=('x86_64')
url='https://github.com/dalerank/Akhenaten'
license=('AGPL-3.0-only' 'MIT')
depends=('curl' 'freetype2' 'harfbuzz' 'libglvnd' 'libpng' 'sdl2'
         'sdl2_mixer' 'zlib' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'ninja' 'pkgconf' 'stb')
optdepends=('innoextract: extract a GOG/Inno Setup Pharaoh installer'
            '7zip: extract InstallShield installer archives'
            'unshield: extract InstallShield CAB archives')
provides=('akhenaten')
conflicts=('akhenaten')
options=('!debug')
source=("${pkgname}::git+${url}.git#branch=master"
        'imgui::git+https://github.com/ocornut/imgui.git#tag=v1.92.2'
        'system-deps.patch')
sha256sums=('SKIP'
            'SKIP'
            '2173a93c433a729914d786b47fcfac526de7f9ad99e022997cfcd06707f20343')

pkgver() {
  cd "${srcdir}/${pkgname}"
  local major minor patch ra_tag ra_subject ra_major ra_minor
  major=$(sed -n 's/^#define GAME_VERSION_MAJOR //p' src/core/version.h)
  minor=$(sed -n 's/^#define GAME_VERSION_MINOR //p' src/core/version.h)
  patch=$(sed -n 's/^#define GAME_VERSION_REVSN //p' src/core/version.h)
  ra_tag=$(git describe --tags --match 'ra[0-9]*' --abbrev=0) || return 1
  ra_subject=$(git for-each-ref --format='%(contents:subject)' "refs/tags/${ra_tag}") || return 1
  if [[ ! $ra_subject =~ ^RA[[:space:]]+([0-9]+)\.([0-9]+)$ ]]; then
    printf 'Unexpected RA release title for %s: %s\n' "$ra_tag" "$ra_subject" >&2
    return 1
  fi
  ra_major=${BASH_REMATCH[1]}
  ra_minor=${BASH_REMATCH[2]}
  printf '%s.%s.%s.ra%s.%s.r%s.g%s' "$major" "$minor" "$patch" \
    "$ra_major" "$ra_minor" "$(git rev-list --count "${ra_tag}..HEAD")" \
    "$(git rev-parse --short=9 HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch --fuzz=0 -Np1 -i "${srcdir}/system-deps.patch"
}

build() {
  local _color=ON
  if [[ -n ${NO_COLOR:-} ]]; then
    _color=OFF
  elif [[ -t 1 ]]; then
    export NINJA_STATUS=$'\e[1;36m[%f/%t]\e[0m '
  fi

  cmake -S "${srcdir}/${pkgname}" -B "${srcdir}/build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_COLOR_DIAGNOSTICS="${_color}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAKHENATEN_IMGUI_SOURCE_DIR="${srcdir}/imgui" \
    -DAKHENATEN_SYSTEM_PACKAGE=ON \
    -DOPTION_ENABLE_TRACY=OFF \
    -DAKHENATEN_UPDATER=OFF \
    -DOPTION_ENABLE_INNOEXTRACT=OFF \
    -DOPTION_ENABLE_VIDEO_RECORDING=OFF \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON
  cmake --build "${srcdir}/build" --target akhenaten
}

package() {
  local appdir="${pkgdir}/usr/lib/akhenaten"
  install -Dm755 "${srcdir}/build/akhenaten" "${appdir}/akhenaten"
  install -dm755 "${appdir}/data"
  cp -a "${srcdir}/${pkgname}/data/." "${appdir}/data/"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/akhenaten" <<'EOF'
#!/bin/sh
exec /usr/lib/akhenaten/akhenaten "$@"
EOF

  install -Dm644 "${srcdir}/${pkgname}/res/akhenaten.desktop" \
    "${pkgdir}/usr/share/applications/io.github.dalerank.Akhenaten.desktop"
  install -Dm644 "${srcdir}/${pkgname}/res/akhenaten_256.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.github.dalerank.Akhenaten.png"
  install -Dm644 "${srcdir}/${pkgname}/res/metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/io.github.dalerank.Akhenaten.metainfo.xml"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 "${srcdir}/imgui/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/imgui-LICENSE.txt"
}
