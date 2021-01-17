# Maintainer: <asamk@gmx.de>

pkgname=libsignal-client
_libname=libsignal_jni
pkgver=0.2.2
_pkgver="java-${pkgver}"
pkgrel=1
pkgdesc='Library for the Signal Protocol.'
url="https://github.com/signalapp/${pkgname}"
makedepends=('rustup' 'cargo' 'gradle' 'git' 'zip' 'protobuf')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/signalapp/${pkgname}/archive/$_pkgver.tar.gz")

sha512sums=('0a8b48c5c8c061a10d50a6e1d7557cb4117683738ab0bd6ce730fc9bcd3440a21ba106dc16f8660b4097b8ef6bc63496926b0435b49b96045ebade2ea845c0f7')

prepare() {
  tar xf "${pkgname}-$_pkgver.tar.gz"
  cd "${pkgname}-${_pkgver}"

  # currently nightly is required ... so rustup is required a makedepends
  # # Use the default system rust toolchain
  # rm -f rust-toolchain

  # Do not build the android library
  sed -i "s/, ':android'//" java/settings.gradle
}

build() {
  cd "${pkgname}-${_pkgver}/java"

  ./build_jni.sh desktop
  gradle --no-daemon assemble

  zip -d "java/build/libs/signal-client-java-${pkgver}.jar" "${_libname}.so"
}

package() {
  cd "${pkgname}-${_pkgver}"

  install -m755 -d "${pkgdir}/usr/share/java/${pkgname}" "${pkgdir}/usr/lib"

  install -Dm644 "java/java/build/libs/signal-client-java-${pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 "target/release/${_libname}.so" "$pkgdir/usr/lib/"
}
