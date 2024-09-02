# Maintainer: The one with the braid <info@braid.business>
# thanks to celogeek, sseneca, dr460nf1r3, dr460nf1r3 and AverytheFurry for pointing out multiple things

pkgname=fluffychat
_name=${pkgname}
_appid=chat.fluffy.fluffychat
pkgver=1.22.1
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
source=(
  "fluffychat-v${pkgver}.tar.gz::https://github.com/krille-chan/fluffychat/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('4bf259f798f52c66eefd1a1ddca17b42f27a6e3144468eda291b558f3775d045')

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
  cd "${srcdir}/${_name}-${pkgver}"

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
  cd "${srcdir}/${_name}-${pkgver}"

  # build in release mode without running pub
  flutter build linux --no-pub --release
}

package() {  
  # enter the output directory of the Flutter build
  cd "${srcdir}/${_name}-${pkgver}/build/linux/$_dartarch/release"

  # configure the installation directory using cmake
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr/lib/${_name} .
  # install the Flutter project using cmake
  cmake -P cmake_install.cmake

  # link executable into PATH
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"

  # install desktop file, metainfo, license and icons
  install -Dm 644 "${srcdir}/${_name}-${pkgver}/assets/favicon.png" "${pkgdir}/usr/share/pixmaps/${_appid}.png"
  install -Dm 644 "${srcdir}/${_name}-${pkgver}/assets/favicon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appid}.png"
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
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
