# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>
# PKGBUILD modified from kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Jean Lucas <jean@4ray.co>
# This package is just an adaptation of the signal-desktop package
# that is in the official repos in order to provide a beta version
# of signal that does not use precompiled binaries.

pkgname=signal-desktop-beta
_pkgname=Signal-Desktop
_sticker_creator="sticker-creator"
pkgver=7.3.0beta1
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
  )
sha512sums=('2cc980b47d68870917d72597943fe31ae7f0fdfa33cd3ae65fa48d7ef49a60dd81e4c19953bcbd0abb3772b90516ef61f6c3569b0ed8e67754edb258820a72bf'
            'b2959b4232c730f662ff542c48837dcbd4923b571e12138ec68df4585904149adc1b7e8be46ee46485b47386a517b2065cd7381c766858fd6c3fd61166c4c800')

prepare() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  git lfs install

  # Allow higher Node versions
  sed 's#"node": "#&>=#' -i package.json

  cd ${_sticker_creator}
  yarn install

  cd ..
  yarn install --ignore-engines
}

build() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  # temporary fix for openssl3
  export NODE_OPTIONS=--openssl-legacy-provider

  cd ${_sticker_creator}
  USE_SYSTEM_FPM=$([ $(uname -m) == "aarch64" ] && echo true || echo false) bash -c 'yarn build'

  cd ..
  yarn generate
  yarn prepare-beta-build
  USE_SYSTEM_FPM=$([ $(uname -m) == "aarch64" ] && echo true || echo false) bash -c 'yarn build:esbuild:prod && yarn build:release --linux dir'
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

