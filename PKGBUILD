# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>
# PKGBUILD modified from kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Jean Lucas <jean@4ray.co>
# This package is just an adaptation of the signal-desktop package
# that is in the official repos in order to provide a beta version
# of signal that does not use precompiled binaries.

pkgname=signal-desktop-beta
_pkgname=Signal-Desktop
_sticker_creator="sticker-creator"
_desktop_file='signal beta.desktop'
pkgver=8.15.0beta1
pkgrel=1
pkgdesc='Signal Private Messenger for Linux - Beta version.'
license=('GPL3')
conflicts=('signal-desktop-beta-bin')
arch=('x86_64' 'aarch64')
url="https://signal.org"
install=$pkgname.install
depends=(
  'gcc-libs'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libasound.so'
  'libatk-bridge-2.0.so'
  'libcairo.so'
  'libcups'
  'libdbus-1.so'
  'libdrm'
  'libexpat.so'
  'libgio-2.0.so'
  'libpango-1.0.so'
  'libpulse'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon.so'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
)
# We need libxcrypt-compat for it to build: https://github.com/electron-userland/electron-builder-binaries/issues/47
makedepends=(
  'git'
  'git-lfs'
  'libxcrypt-compat'
  'node-gyp'
  'nodejs-lts-krypton'
  'python'
  'pnpm'
)
optdepends=('xdg-desktop-portal: Screensharing with Wayland')
makedepends_aarch64=('fpm')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver//beta*}-beta.${pkgver##*beta}.tar.gz"
  "${_desktop_file}"
  "${pkgname}.sh"
  )
sha512sums=('2419129c32a88a87ada05a8dbbdf72fd3c5272c4f87875720fbd2356d41e0a7edef96de990f808fe8f1aab8e98810d54c463e8253dc8ae8b009ae793fc71960b'
            '5032201efb1089e2e8f78cf5cc06d458f2b068900a4de74b7c2ef87a0a0e7779cc681df7b95ce2d9af131ef9ea148f3621ee1fa2a9812982cdecc7aba9eeb87c'
            'b3d8e56d0524711e13f5ef3770b49c5723ad3d7e50855ae578ea63f653b5e64edd7a9e68b56ba35c0240959f091195ece3580fc8550240ef40b00d0ad7fb97e8')

prepare() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  # git-lfs hook needs to be installed for one of the dependencies
  export GIT_CONFIG_GLOBAL="$HOME/.gitconfig"
  git lfs install

  # Allow higher Node versions
  sed 's#"node": "#&>=#' -i package.json

  # Install dependencies for sticker-creator
  pnpm install -C ./sticker-creator/

  # Install dependencies for signal-desktop
  pnpm install
}

build() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  # Build the sticker creator
  USE_SYSTEM_FPM=$([ $(uname -m) == "aarch64" ] && echo true || echo false) bash -c 'pnpm -C ./sticker-creator/ run build'

  # Build Signal Desktop Beta
  pnpm run generate
  pnpm run prepare-beta-build
  USE_SYSTEM_FPM=$([ $(uname -m) == "aarch64" ] && echo true || echo false) bash -c 'pnpm run build:esbuild:prod && pnpm run build:release -- --linux dir'
}

package() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  install -d "${pkgdir}/usr/"{lib,bin}

  case "${CARCH}" in
    "aarch64") folder="linux-arm64-unpacked" ;;
    *) folder="linux-unpacked" ;;
  esac

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cp -a release/${folder} "${pkgdir}/usr/lib/${pkgname}"

  chmod u+s "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"

  install -Dm 644 "../${_desktop_file}" -t "${pkgdir}/usr/share/applications"
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 "build/icons/png/${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
}

