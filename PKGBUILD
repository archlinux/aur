# Maintainer: manganeese <mangoiscute95@gmail.com>
# Contributor: Noah Heller <softwareenginer@pm.me>
_emsdk=4.0.12
pkgname=advantagescope-git
pkgver=27.0.0.ralpha.5.9.g058f8f6e
pkgrel=1
epoch=
pkgdesc="robot diagnostics, log review/analysis, and data visualization application tool"
arch=(x86_64)
url="https://github.com/Mechanical-Advantage/AdvantageScope"
license=("LicenseRef-BSD-3.0-Clause-Noninfringement")
groups=()
_electron=electron39
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
source=("git+$url.git"
        "advantagescope-git.desktop"
        "remove-version.patch")
noextract=()
b2sums=('SKIP'
        '9a501c0358f06bdea2802fa6e783cec578171fc854c030e2bd6be53640d91948a6e32feec6a098ffdbca269f31da1102d4383bc47f5fe23446e90d211a23ac14'
        '49e71a8305de082ed17af8ff82468e720325330ec778e81a915c0cd2cd0a01a011d2c2eb0ab6e307487d9abf569082628762a3fe5436055aa468f8728052d1ae')
validpgpkeys=()

prepare() {
  _ver="$(</usr/lib/${_electron}/version)"
  cd AdvantageScope
  npm pkg set homepage="https://github.com/Mechanical-Advantage/AdvantageScope"
  npm pkg set version="${pkgver/.r/+r}"
  # apply all patches
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Apply patch $src..."
    patch -Np1 < "../$src"
  done
  # allow git sources (they are depended on)
  # need to do a scriptless fetch before a normal one to make `youtube-dl-exec` work
  NPM_CONFIG_ALLOW_GIT=all npm ci --ignore-scripts
  NPM_CONFIG_ALLOW_GIT=all npm install
}

pkgver() {
  cd "AdvantageScope"
  printf "%s" "$(git describe --tags | cut -c2- | sed 's+-+.r+' | tr - .)"
}

build() {
  cd AdvantageScope
  local x86_64=x64
  npm run compile
  npm run wasm:compile
  npm run docs:build-embed
  export NODE_OPTIONS="--max-old-space-size=4096"
  npx electron-builder build --linux --"${!CARCH}" --dir $dist \
    -c.electronDist=/usr/lib/"$_electron" \
    -c.electronVersion="$_ver"
}

package() {
  local x86_64=linux-unpacked
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
