# Maintainer: The one with the braid <info@braid.business>

pkgname=fwallet
_name=fwallet
_appid=business.braid.f_wallet
pkgver=1.1.9
pkgrel=2
pkgdesc="A beautiful cross-platform wallet application."
# Flutter officially supports amd64 and AArch64
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheOneWithTheBraid/f_wallet"
license=('EUPL1.2')
depends=(
  'gtk3'
  'jsoncpp'
  # flutter_secure_storage
  'libsecret'
  # path_provider
  'xdg-user-dirs'
)
makedepends=(
  # the Flutter tool
  'flutter-tool'
  # the Flutter linux files
  'flutter-target-linux'
  # used for packaging
  'cmake'
)
# prevent conflicts with binary or release packages
provides=("$_name")
conflicts=("$_name")
# declare the source from git
source=(
  "${_name}-v${pkgver}.tar.gz::https://gitlab.com/TheOneWithTheBraid/f_wallet/-/archive/v${pkgver}/f_wallet-v${pkgver}.tar.gz"
)
# this is a git build, we do not want to pin to a version
sha256sums=('8e9e124bbe2d4cad5127acbf223b446071f8fa0d52cd9650501ec7b6a55a6b6e')

# ensure we have the proper Dart architecture name for the current CARCH
case "${CARCH}" in
  "x86_64")
    export _dartarch="x64"
    ;;
  "aarch64")
    export _dartarch="arm64"
    # fix incompatible C(XX)FLAGS on Arch Linux on ARM
    CXXFLAGS="${CXXFLAGS/-fstack-protector-strong/}"
    CXXFLAGS="${CXXFLAGS/-fstack-clash-protection/}"

    CFLAGS="${CFLAGS/-fstack-protector-strong/}"
    CFLAGS="${CFLAGS/-fstack-clash-protection/}"
    ;;
esac

prepare() {
  # override pub cache
  export PUB_CACHE="${srcdir}/pub_cache"

  # enter the source directory
  cd "${srcdir}/f_wallet-v${pkgver}"

  # ensure a clean CMakeCache
  if [ -f "build/linux/${_dartarch}/release/CMakeCache.txt" ]; then
    rm "build/linux/${_dartarch}/release/CMakeCache.txt"
  fi

  # download dart dependencies without lockfile update or retry with
  flutter pub get --enforce-lockfile || flutter pub get
  # generate localization files
  flutter gen-l10n
}

build() {
  # override pub cache
  export PUB_CACHE="${srcdir}/pub_cache"

  # enter the source directory
  cd "${srcdir}/f_wallet-v${pkgver}"

  # build in release mode without running pub
  flutter build linux --no-pub --release --dart-define=FWALLET_IS_STABLE=true --dart-define=FWALLET_VERSION="v${pkgver}"
}

package() {
  # enter the output directory of the Flutter build
  cd "${srcdir}/f_wallet-v${pkgver}/build/linux/$_dartarch/release"

  # configure the installation directory using cmake
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr/lib/${_name} .
  # install the Flutter project using cmake
  cmake -P cmake_install.cmake

  # link executable into PATH
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_name}/f_wallet" "${pkgdir}/usr/bin/f_wallet"

  # install desktop file, metainfo, license and icons
  install -Dm 644 "${srcdir}/f_wallet-v${pkgver}/linux/${_appid}.desktop" "${pkgdir}/usr/share/applications/${_appid}.desktop"
  install -Dm 644 "${srcdir}/f_wallet-v${pkgver}/linux/${_appid}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${_appid}.metainfo.xml"
  install -Dm644 "${srcdir}/f_wallet-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
  install -Dm 644 "${srcdir}/f_wallet-v${pkgver}/assets/logo/logo-circle.svg" "${pkgdir}/usr/share/pixmaps/${_appid}.svg"
  install -Dm 644 "${srcdir}/f_wallet-v${pkgver}/assets/logo/logo-circle.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appid}.svg"
}

# vim: set sw=2 ts=2 et:
