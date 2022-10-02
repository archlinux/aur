# Maintainer: <asamk@gmx.de>

pkgname=libsignal-client
_pkgname=libsignal
_libname=libsignal_jni
pkgver=0.20.0
pkgrel=1
pkgdesc='Library for the Signal Protocol.'
url="https://github.com/signalapp/${_pkgname}"
makedepends=('cargo' 'gradle' 'git' 'zip' 'protobuf' 'cmake' 'clang')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/refs/tags/v$pkgver.tar.gz"
)

sha512sums=('328531c93eb437ce7c811a9a6659327c7b3389487ef5d7db160e8df6e36521ddd8bda8274e2a6791ee64a28967cb5a627a76dea239c8b98d84ed330aa535b45c')

prepare() {
  tar xf "${_pkgname}-$pkgver.tar.gz"
  cd "${_pkgname}-${pkgver}"

  # Use the default system rust toolchain
  # rm -f rust-toolchain

  # Do not build the android library
  sed -i "s/include ':android'//" java/settings.gradle
}

build() {
  cd "${_pkgname}-${pkgver}/java"

  ./build_jni.sh desktop
  gradle --no-daemon assemble

  zip -d "client/build/libs/libsignal-client-${pkgver}.jar" "${_libname}.so"
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/share/java/${pkgname}" "${pkgdir}/usr/lib"

  install -Dm644 "java/client/build/libs/libsignal-client-${pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 "target/release/${_libname}.so" "$pkgdir/usr/lib/"
}
