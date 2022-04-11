# Maintainer: <asamk@gmx.de>

pkgname=libsignal-client
_pkgname=libsignal
_libname=libsignal_jni
pkgver=0.15.0
pkgrel=1
pkgdesc='Library for the Signal Protocol.'
url="https://github.com/signalapp/${_pkgname}"
makedepends=('cargo' 'gradle' 'git' 'zip' 'protobuf')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/refs/tags/v$pkgver.tar.gz"
)

sha512sums=('eb02b7db9ecc3d537953108431add89bfc5e7377c182c0246f1dff6655c092b861dce78f744ebb14bc6aa3972b3945d8b741273c98dabd5436d50f70d5b228c5')

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
