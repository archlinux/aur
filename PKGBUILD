# Maintainer: <asamk@gmx.de>

pkgname=libsignal-client
_pkgname=libsignal
_libname=libsignal_jni
pkgver=0.22.0
pkgrel=1
pkgdesc='Library for the Signal Protocol.'
url="https://github.com/signalapp/${_pkgname}"
depends=('gcc-libs')
makedepends=('cargo' 'gradle' 'git' 'zip' 'protobuf' 'cmake' 'clang' 'jdk17-openjdk')
options=(!lto)
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/refs/tags/v$pkgver.tar.gz"
)

sha512sums=('9483c8d302728d6caa123f1fb9a977c7cb3aea09ecd1d2cfb3b19f2f2c66f884c41e37642c89db4eeeb0d607fddf281ba27ba4bd0a90e43b972d0cbc607e1483')

prepare() {
  tar xf "${_pkgname}-$pkgver.tar.gz"
  cd "${_pkgname}-${pkgver}"

  # Use the default system rust toolchain
  # rm -f rust-toolchain

  # Do not build the android library
  sed -i "s/include ':android', ':android:benchmarks'//" java/settings.gradle
  sed -i "s/cargo build/cargo build --frozen/" java/build_jni.sh

  cargo fetch --locked --target "$(rustc -vV | awk '/^host: / {print $2}')"
}

build() {
  cd "${_pkgname}-${pkgver}/java"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  ./build_jni.sh desktop
  gradle --no-daemon assemble

  zip -d "client/build/libs/libsignal-client-${pkgver}.jar" "${_libname}.so"
}

check() {
  cd "${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/share/java/${pkgname}" "${pkgdir}/usr/lib"

  install -Dm644 "java/client/build/libs/libsignal-client-${pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 "target/release/${_libname}.so" "$pkgdir/usr/lib/"
}
