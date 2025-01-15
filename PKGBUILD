# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>
# PKGBUILD modified from kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Jean Lucas <jean@4ray.co>
# This package is just an adaptation of the signal-desktop package
# that is in the official repos in order to provide a beta version
# of signal that does not use precompiled binaries.

pkgname=signal-desktop-beta
_pkgname=Signal-Desktop
_sticker_creator="sticker-creator"
_desktop_file='signalbeta.desktop'
pkgver=7.39.0beta1
pkgrel=1
pkgdesc='Signal Private Messenger for Linux - Beta version.'
license=('GPL3')
conflicts=('signal-desktop-beta-bin')
arch=('x86_64' 'aarch64')
url="https://signal.org"
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
  'nodejs'
  'npm'
  'python'
)
optdepends=('xdg-desktop-portal: Screensharing with Wayland')
makedepends_aarch64=('fpm')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver//beta*}-beta.${pkgver##*beta}.tar.gz"
  "${_desktop_file}"
  )
sha512sums=('bca3e2013b7945585d616ea8212d31280e0e8317890dc90d2003bd357c42495a3e506cc0cde30432eb371ca76bdfffdf0215a72460bddca10e8a6162984b2153'
            '5ae001faedff440776f4a62235c294454a951f4cc412665a21cd958bdf4a0223c89f741f2786d93727c7acf49a8a98d75156c6e14ba1f01da261fba373ef675a')

prepare() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  # git-lfs hook needs to be installed for one of the dependencies
  git lfs install

  # Allow higher Node versions
  sed 's#"node": "#&>=#' -i package.json

  # Install dependencies for sticker-creator
  npm --prefix ./sticker-creator/ install

  # Install dependencies for signal-desktop
  npm install --ignore-engines
}

build() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  # Build the sticker creator
  USE_SYSTEM_FPM=$([ $(uname -m) == "aarch64" ] && echo true || echo false) bash -c 'npm --prefix ./sticker-creator/ run build'

  # Build Signal Desktop Beta
  npm run generate
  npm run prepare-beta-build
  USE_SYSTEM_FPM=$([ $(uname -m) == "aarch64" ] && echo true || echo false) bash -c 'npm run build:esbuild:prod && npm run build:release -- --linux dir'
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

  install -Dm 644 "../${_desktop_file}" -t "${pkgdir}/usr/share/applications"
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 "build/icons/png/${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
}

