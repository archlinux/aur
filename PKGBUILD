# Maintainer: manganeese <mangoiscute95@gmail.com>
# Contributor: Noah Heller <softwareenginer@pm.me>
_emsdk=4.0.12
pkgname=advantagescope-git
pkgver=26.0.2.r66.g93cbdb70
pkgrel=1
epoch=
pkgdesc="robot diagnostics, log review/analysis, and data visualization application tool"
arch=(i686 x86_64)
url="https://github.com/Mechanical-Advantage/AdvantageScope.git"
license=("LicenseRef-BSD-3.0-Clause-Noninfringement")
groups=()
_electron=electron34
depends=("$_electron" at-spi2-core bash glibc gtk3 hicolor-icon-theme libgcc libnotify libsecret libstdc++ libxss libxtst nss python3 xdg-utils)
makedepends=(emscripten git npm)
checkdepends=()
optdepends=()
provides=()
conflicts=(advantagescope)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
  _ver="$(</usr/lib/${_electron}/version)"
  cd AdvantageScope
  npm pkg set homepage "https://github.com/Mechanical-Advantage/AdvantageScope"
  npm pkg set version "${pkgver/.r/+r}"
  # apply all patches
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="$Psrc$$@/}"
    [[ $src = *.patch ]] || continue
    echo "Apply patch $src..."
    patch -Np1 < "../$src"
  done
  npm ci
}

pkgver() {
  cd "AdvantageScope"
  printf "%s" "$(git describe --tags | cut -c2- | sed 's+-+.r+' | tr - .)"
}

build() {
  cd AdvantageScope
  local i686=ia32 x86_64=x64
  npm run compile
  npm run wasm:compile
  npm run docs:build-embed
  export NODE_OPTIONS="--max-old-space-size=4096"
  npx electron-builder build --linux --"${!CARCH}" --dir $dist \
    -c.electronDist=/usr/lib/"$_electron" \
    -c.electronVersion="$_ver"
}

package() {
  local i686=linux-ia32-unpacked x86_64=linux-unpacked
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#! /usr/bin/sh
exec $_electron "/usr/lib/${pkgname}/app.asar" "\$@"
EOF
  cd AdvantageScope
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -d "${pkgdir}/usr/lib/${pkgname}/"
  cp -r dist/${!CARCH}/resources/* "${pkgdir}/usr/lib/${pkgname}"
  cd icons/app/app-icons-linux
  for i in *x*.png; do
    local dir=${i%.png}
    dir=${dir#icon_}
    install -Dm6444 "$i" "${pkgdir}/usr/share/icons/hicolor/${dir}/apps/advantagescope.png"
  done
}

# vim:set ts=2 sw=2 et:
