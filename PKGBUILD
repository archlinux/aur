# Maintainer: <asamk@gmx.de>

pkgname=libsignal-client
_pkgname=libsignal
_libname=libsignal_jni
pkgver=0.19.3
pkgrel=1
pkgdesc='Library for the Signal Protocol.'
url="https://github.com/signalapp/${_pkgname}"
makedepends=('cargo' 'gradle' 'git' 'zip' 'protobuf' 'cmake' 'clang')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/refs/tags/v$pkgver.tar.gz"
)

sha512sums=('be280f6d4d133cbf4aaa3af5b1298b460c777ee695569c10c23ad95074830bb46b34082ddfe04f4c936bf3b1f716a205fc518463cf60a38db835d9383c630925')

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
