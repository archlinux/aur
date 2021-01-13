# Maintainer: <asamk@gmx.de>

pkgname=libsignal-client
_libname=libsignal_jni
pkgver=0.2.1
_pkgver="java-${pkgver}"
pkgrel=1
pkgdesc='Library for the Signal Protocol.'
url="https://github.com/signalapp/${pkgname}"
makedepends=('cargo' 'gradle' 'git' 'zip' 'protobuf')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/signalapp/${pkgname}/archive/$_pkgver.tar.gz")

sha512sums=('1f7b10bcc47199da1a2efd9de7ebb8d3906752bd5378073c08ae6638b9cb52529da965544213c5a97b081ce114c7497bcf077c2da02470df5d6096b14a8ce51d')

prepare() {
  tar xf "${pkgname}-$_pkgver.tar.gz"
  cd "${pkgname}-${_pkgver}"

  # Use the default system rust toolchain
  rm -f rust-toolchain

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
