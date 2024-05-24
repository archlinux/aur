# Maintainer: The one with the braid <info@braid.business>

pkgname=polycule-git
_name=polycule
_appid=business.braid.polycule
pkgver=1ac50db
pkgrel=1
pkgdesc="A simple and beautiful matrix client written in Flutter."
# Flutter officially supports amd64 and AArch64
arch=('x86_64' 'aarch64')
url="https://gitlab.com/polycule_client/polycule"
license=('EUPL1.2')
depends=(
  'gtk3'
  'jsoncpp'
  # flutter_secure_storage
  'libsecret'
  # path_provider
  'xdg-user-dirs'
  # for e2ee
  'libolm'
  # flutter_file_picker - see https://github.com/miguelpruivo/flutter_file_picker/blob/master/lib/src/linux/file_picker_linux.dart#L115
  'zenity'
  # sqlite encryption
  'openssl'
)
makedepends=(
  'git'
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
  "git+https://gitlab.com/polycule_client/${_name}.git"
)
# this is a git build, we do not want to pin to a version
sha256sums=('SKIP')

# ensure we have the proper Dart architecture name for the current CARCH
case "${CARCH}" in
  "x86_64")
    export _dartarch="x64"
    ;;
  "aarch64")
    export _dartarch="arm64"
    ;;
  esac

pkgver() {
    cd "${srcdir}/${_name}"
    git describe --tags --always --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # override pub cache
  export PUB_CACHE="${srcdir}/pub_cache"

  # enter the source directory
  cd "${srcdir}/${_name}"

  # overriding CMake flags for aarch64 in order to ensure build
  # is not failing
  if [[ "$(uname -m)" == "aarch64" ]]; then
    export CXXFLAGS="${CXXFLAGS/-fstack-protector-strong/ }"
    export CXXFLAGS="${CXXFLAGS/-fstack-clash-protection/ }"

    export CFLAGS="${CFLAGS/-fstack-protector-strong/ }"
    export CFLAGS="${CFLAGS/-fstack-clash-protection/ }"
  fi
  
  # download dart dependencies without lockfile update
  flutter pub get --enforce-lockfile
}

build() {
  # override pub cache
  export PUB_CACHE="${srcdir}/pub_cache"

  # enter the source directory
  cd "${srcdir}/${_name}"

  # build in release mode without running pub
  flutter build linux --no-pub --release
}

package() {
  # enter the output directory of the Flutter build
  cd "${srcdir}/${_name}/build/linux/$_dartarch/release"

  # configure the installation directory using cmake
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr/lib/${_name} .
  # install the Flutter project using cmake
  cmake -P cmake_install.cmake

  # link executable into PATH
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"

  # install desktop file, metainfo and icons
  install -Dm 644 "${srcdir}/${_name}/linux/${_appid}.desktop" "${pkgdir}/usr/share/applications/${_appid}.desktop"
  install -Dm 644 "${srcdir}/${_name}/linux/${_appid}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${_appid}.metainfo.xml"
  install -Dm 644 "${srcdir}/${_name}/assets/logo/logo-circle.svg" "${pkgdir}/usr/share/pixmaps/${_appid}.svg"
  install -Dm 644 "${srcdir}/${_name}/assets/logo/logo-circle.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appid}.svg"
}

# vim: set sw=2 ts=2 et:
