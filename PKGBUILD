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
pkgver=8.24.0beta1
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
  'npm'
  'pnpm'
  'python'
)
optdepends=('xdg-desktop-portal: Screensharing with Wayland')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver//beta*}-beta.${pkgver##*beta}.tar.gz"
  "${_desktop_file}"
  "${pkgname}.sh"
  )
sha512sums=('615ecb17d1ceb3623af834ea5e335cc2d3c3d80d2ad6ad9a9ec72febab9d0e8b9fd928d678012d700570b6d09996f18545b90cec7805838a6ed170494525fed0'
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

  # Configure electron-builder's Linux target for the current Arch architecture.
  case "${CARCH}" in
    "aarch64") electron_arch="arm64" ;;
    *) electron_arch="x64" ;;
  esac
  node scripts/prepare_linux_build.mjs deb "${electron_arch}"

  # Install dependencies for signal-desktop
  pnpm install --frozen-lockfile
}

build() {
  cd "${_pkgname}-${pkgver//beta*}-beta.${pkgver##*beta}"

  # Build the sticker creator
  pnpm -C ./sticker-creator/ run build

  # Build Signal Desktop Beta
  pnpm run generate
  pnpm run prepare-beta-build
  # Required to avoid:
  # ? Your "node_modules" directory is out of sync with the "pnpm-lock.yaml" file. This can lead to issues during scripts execution.
  # Would you like to run "pnpm install" to update your "node_modules"? (Y/n)
  export PNPM_CONFIG_VERIFY_DEPS_BEFORE_RUN=false
  pnpm run build:esbuild:prod && pnpm run build:release -- --linux dir
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

