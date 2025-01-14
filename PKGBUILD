# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: garionion <garionion at entr0py.de>
# Contributor: The one with the braid <info@braid.business>
# thanks to celogeek, sseneca, dr460nf1r3, dr460nf1r3 and AverytheFurry for pointing out multiple things

pkgname=simple-live-app
_pkgname=dart_simple_live
_appname=simple_live_app
pkgver=1.7.6
pkgrel=1
pkgdesc='An app for watching live'
arch=('x86_64' 'aarch64')
url='https://github.com/xiaoyaocz/dart_simple_live'
license=('GPL-3.0-only')
_flutterchannel=stable
_flutterversion=3.24.5
depends=('xdg-user-dirs' 'gtk3' 'mpv')
makedepends=('ninja' 'cmake' 'clang' 'git' 'patchelf')
source=(
    "flutter-${_flutterversion}.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/${_flutterchannel}/linux/flutter_linux_${_flutterversion}-${_flutterchannel}.tar.xz"
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/xiaoyaocz/dart_simple_live/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('a7c82f551a9eae018e078f6bb186171e5a77920d35a3d75a61d9a593d0a9e4ae'
            'b7baf050ef362098a528354e63073ee15b5cf5b3c51832c37c8e35baabea71bb')
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
  export PATH="${srcdir}/flutter/bin:$PATH"
  flutter config --no-analytics
  flutter config --enable-linux-desktop
  cd ${_pkgname}-${pkgver}/simple_live_app
  sed -i "s/use_header_bar = TRUE/use_header_bar = FALSE/g" linux/my_application.cc
  rm -rf pub-cache
  mkdir pub-cache
  export PUB_CACHE="${srcdir}/${_pkgname}-${pkgver}/${_appname}/pub-cache"
  flutter clean
  flutter pub get
}

build() {
  export PATH="${srcdir}/flutter/bin:$PATH"
  export PUB_CACHE="${srcdir}/${_pkgname}-${pkgver}/${_appname}/pub-cache"
  cd ${_pkgname}-${pkgver}/${_appname}
  flutter build linux --no-pub
}

package() {  
  # enter the output directory of the Flutter build
  cd "${srcdir}/${_pkgname}-${pkgver}/simple_live_app/build/linux/$_dartarch/release"

  # configure the installation directory using cmake
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr/lib/${_pkgname} .
  # install the Flutter project using cmake
  cmake -P cmake_install.cmake
  for f in ${pkgdir}/usr/lib/${_pkgname}/lib/*.so; do patchelf --shrink-rpath --allowed-rpath-prefixes '$ORIGIN' "$f"; done
  for f in ${pkgdir}/usr/lib/${_pkgname}/lib/*.so; do if [ -z "$(patchelf --print-rpath $f)" ]; then patchelf --remove-rpath "$f"; fi; done
  # link executable into PATH
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/${_appname}" "${pkgdir}/usr/bin/${_pkgname}"  # icon
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/logo.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # desktop entry
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > ${pkgdir}/usr/share/applications/${_pkgname}.desktop << EOF
[Desktop Entry]
Type=Application
Version=${pkgver}
Name=Simple Live App
Comment=A Live Player
Exec=${_pkgname}
Icon=${_pkgname}
Terminal=false
EOF
}

# vim: set sw=2 ts=2 et:
