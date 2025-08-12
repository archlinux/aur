# Maintainer: The one with the braid <info@braid.business>

pkgname=polycule
_name=polycule
_appid=business.braid.polycule
pkgver=0.3.0
pkgrel=1
pkgdesc="A geeky and efficient [matrix] client for power users."
# Flutter officially supports amd64 and AArch64
arch=('x86_64' 'aarch64')
url="https://gitlab.com/polycule_client/polycule"
license=('EUPL-1.2')
depends=(
  'gtk3'
  'jsoncpp'
  # flutter_secure_storage
  'libsecret'
  # path_provider
  'xdg-user-dirs'
  # sqlcipher_flutter_libs
  'openssl'
  # media_kit
  'mpv'
  'mimalloc'
  # flutter_local_notifications
  'libnotify'
  'dbus'
)
makedepends=(
  'git'
  # the Flutter tool
  'flutter-tool'
  # the Flutter linux files
  'flutter-target-linux'
  # required for Flutter rust bridge
  'flutter-intellij-patch'
  # used for packaging
  'cmake'
  'rustup'
)
# prevent conflicts with binary or release packages
provides=("$_name=${pkgver}")
conflicts=("$_name")
source=(
  "${_name}-v${pkgver}.tar.gz::https://gitlab.com/polycule_client/polycule/-/archive/v${pkgver}/polycule-v${pkgver}.tar.gz"
)
sha256sums=('6546d4ff261dc3eedf0ab0665085b5cae38232ac915265d351b6cb6155f6a02f')

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
  cd "${srcdir}/${_name}-v${pkgver}"

  # ensure a clean CMakeCache
  if [ -f "build/linux/${_dartarch}/release/CMakeCache.txt" ]; then
    rm "build/linux/${_dartarch}/release/CMakeCache.txt"
  fi

  # download dart dependencies without lockfile update or retry with
  flutter --suppress-analytics pub get --enforce-lockfile || flutter --suppress-analytics pub get
}

build() {
  # override pub cache
  export PUB_CACHE="${srcdir}/pub_cache"

  # enter the source directory
  cd "${srcdir}/${_name}-v${pkgver}"

  # build in release mode without running pub
  flutter --suppress-analytics build linux --no-pub --release --dart-define=POLYCULE_IS_STABLE=true --dart-define=POLYCULE_VERSION=v${pkgver} --dart-define=no_default_http_client=true
}

package() {
  # enter the output directory of the Flutter build
  cd "${srcdir}/${_name}-v${pkgver}/build/linux/$_dartarch/release"

  # configure the installation directory using cmake
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr/lib/${_name} .
  # install the Flutter project using cmake
  cmake -P cmake_install.cmake

  # link executable into PATH
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"

  for font in "${srcdir}/${_name}-v${pkgver}/assets/fonts/"* ; do
    install -Dm 644 "${font}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${font}")".txt
  done

  # install desktop file, metainfo, license and icons
  install -Dm 644 "${srcdir}/${_name}-v${pkgver}/linux/${_appid}.desktop" "${pkgdir}/usr/share/applications/${_appid}.desktop"
  install -Dm 644 "${srcdir}/${_name}-v${pkgver}/linux/${_appid}-daemon.desktop" "${pkgdir}/etc/xdg/autostart/${_appid}-daemon.desktop"
  install -Dm 644 "${srcdir}/${_name}-v${pkgver}/linux/${_appid}.service" "${pkgdir}/usr/share/dbus-1/services/${_appid}.service"
  install -Dm 644 "${srcdir}/${_name}-v${pkgver}/linux/${_appid}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${_appid}.metainfo.xml"
  install -Dm 644 "${srcdir}/${_name}-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -s "/usr/lib/polycule/data/flutter_assets/NOTICES.Z" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICES.Z"
  install -Dm 644 "${srcdir}/${_name}-v${pkgver}/assets/logo/logo-circle.svg" "${pkgdir}/usr/share/pixmaps/${_appid}.svg"
  install -Dm 644 "${srcdir}/${_name}-v${pkgver}/assets/logo/logo-circle.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appid}.svg"
}

# vim: set sw=2 ts=2 et:
