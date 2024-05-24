# Maintainer: The one with the braid <info@braid.business>
# thanks to nyanpasu64 for pointing out the wrong install path

pkgname=fluffychat-git
_name=fluffychat
_appid=chat.fluffy.fluffychat
pkgver=rc1.20.0.2.r74.g8da714b0
pkgrel=1
pkgdesc="Open. Nonprofit. Cute. Easy to use (matrix) messenger. Secure and decentralized."
# Flutter officially supports amd64 and AArch64
arch=('x86_64' 'aarch64')
url="https://fluffychat.im/"
license=('AGPL3')
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
  "git+https://github.com/krille-chan/fluffychat.git"
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

  # ensure a clean CMakeCache
  if [ -f "build/linux/${_dartarch}/release/CMakeCache.txt" ]; then
    rm "build/linux/${_dartarch}/release/CMakeCache.txt"
  fi

  # download dart dependencies without lockfile update or retry with
  flutter pub get --enforce-lockfile || flutter pub get
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

  # install desktop file, metainfo, license and icons
  install -Dm 644 "${srcdir}/${_name}/assets/favicon.png" "${pkgdir}/usr/share/pixmaps/${_appid}.png"
  install -Dm 644 "${srcdir}/${_name}/assets/favicon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appid}.png"
  install -Dm644 "${srcdir}/${_name}/LICENSE" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
  install -dm 755 "${pkgdir}/usr/share/applications"
  cat > ${pkgdir}/usr/share/applications/${_appid}.desktop << EOF
[Desktop Entry]
Type=Application
Version=${pkgver}
Name=FluffyChat
Comment=${pkgdesc}
Exec=${_name}
Icon=${_appid}
SingleMainWindow=true
StartupWMClass=${_appid}
Terminal=false
StartupNotify=false
Categories=Network;InstantMessaging;Chat;MatrixClient
X-Purism-FormFactor=Workstation;Mobile;
EOF

}

# vim: set sw=2 ts=2 et:
