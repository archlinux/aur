# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Jean Lucas <jean@4ray.co>
# This package is just an adaptation of the signal-desktop package
# that is in the official repos in order to provide a beta version
# of signal that does not use precompiled binaries.
# AUR Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=signal-desktop-beta
_pkgname=Signal-Desktop
pkgver=6.41.0beta1
pkgrel=1
pkgdesc='Signal Private Messenger for Linux - Beta version.'
license=('GPL3')
conflicts=('signal-desktop-beta-bin')
arch=('x86_64' 'aarch64')
url="https://signal.org"
depends=('gtk3' 'hicolor-icon-theme' 'libasound.so' 'libatk-bridge-2.0.so' 'libcairo.so' 'libdbus-1.so'
        'libexpat.so' 'libgio-2.0.so' 'libpango-1.0.so' 'libxkbcommon.so' 'libxss')
# We need libxcrypt-compat for it to build: https://github.com/electron-userland/electron-builder-binaries/issues/47
makedepends=('yarn' 'git' 'nodejs' 'npm' 'python' 'git-lfs' 'libxcrypt-compat' 'node-gyp')
optdepends=('xdg-desktop-portal: Screensharing with Wayland')
makedepends_aarch64=('fpm')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver//beta*}-beta.${pkgver##*beta}.tar.gz"
  "${pkgname}.desktop"
  "signal-desktop-wrapper.sh"
  )
sha512sums=('5ca407899788a3557dbcccd6028af1af6fb59c190a75614d6c9c03e8744627d1775e6e79b58b7deca470d67c2658361531fb8be2181c3f349d9fb351c1d4a3ae'
            '7b25b98de8db36af1a9da49cd214d6ced45f123f098e5665b563e462b979e67d9d570fce8fbee89776a95dc5108696da64bfbe0bd1eaf748360dfcb333483dbb'
            '457c1bd044f4e17810a7f1b284ca38809a0c1f8fed4bdb52184a169e2996e683c4c96c1cc86a013feb7b8833557245397decdcec01dbc82bb2b12b0d80424e25')

prepare() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  git lfs install

  # Allow higher Node versions
  sed 's#"node": "#&>=#' -i package.json

  yarn install --ignore-engines
}

build() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  # temporary fix for openssl3
  export NODE_OPTIONS=--openssl-legacy-provider

  yarn generate
  yarn prepare-beta-build
  USE_SYSTEM_FPM=$([ $(uname -m) == "aarch64" ] && echo true || echo false) bash -c 'yarn build:esbuild:prod && yarn build:release'
}

package() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  install -d "${pkgdir}/usr/"{lib,bin}

  case "${CARCH}" in
    "aarch64") folder="linux-arm64-unpacked" ;;
    *) folder="linux-unpacked" ;;
  esac
  cp -a release/${folder} "${pkgdir}/usr/lib/${pkgname}"

  ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/"

  chmod u+s "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"

  install -Dm 644 "../${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 "build/icons/png/${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
}

