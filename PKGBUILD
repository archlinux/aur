# Maintainer: <asamk@gmx.de>

pkgname=libsignal-client
_pkgname=libsignal
_libname=libsignal_jni
pkgver=0.30.0
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

sha512sums=('cca37d481081c44ddd838f6a4b4f9ee468fc79f5966af62c797e9a9a692a985d5e6d0c988ff2401c515f7ded5df90248be6ca38bb77cd6f9be01fbb1f0a3fcf5')

prepare() {
  tar xf "${_pkgname}-$pkgver.tar.gz"
  cd "${_pkgname}-${pkgver}"

  # Use the default system rust toolchain
  # rm -f rust-toolchain

  sed -i "s/cargo build/cargo build --frozen/" java/build_jni.sh

  cargo fetch --locked --target "$(rustc -vV | awk '/^host: / {print $2}')"
}

build() {
  cd "${_pkgname}-${pkgver}/java"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  ./build_jni.sh desktop
  gradle --no-daemon assemble -PskipAndroid=true

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
