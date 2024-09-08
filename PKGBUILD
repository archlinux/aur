# Maintainer: <asamk@gmx.de>

pkgname=libsignal-client
_pkgname=libsignal
_libname=libsignal_jni
pkgver=0.56.0
pkgrel=1
pkgdesc='Library for the Signal Protocol.'
url="https://github.com/signalapp/${_pkgname}"
depends=('gcc-libs')
checkdepends=('cargo')
makedepends=('cargo' 'gradle' 'git' 'zip' 'protobuf' 'cmake' 'clang' 'java-environment')
options=(!lto)
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('AGPL-3.0-only')
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/refs/tags/v$pkgver.tar.gz"
)

sha512sums=('72d264cb527b954df73da37b602657d63dafe320562d3b53dd3f7e44a85106730afdc25f601fa056a16fe6cb954d4d99bc2b632ee92321addf3de48ed7a10ba4')

prepare() {
  tar xf "${_pkgname}-$pkgver.tar.gz"
  cd "${_pkgname}-${pkgver}"

  # Use the default system rust toolchain
  # rm -f rust-toolchain

  sed -i 's/exit 2//' java/build_jni.sh
  sed -i "s/cargo build/cargo build --frozen/" java/build_jni.sh

  cargo fetch --locked --target "$(rustc -vV | awk '/^host: / {print $2}')"
}

build() {
  cd "${_pkgname}-${pkgver}/java"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  ./build_jni.sh desktop
  GRADLE_USER_HOME="${srcdir}/.gradle" gradle --no-daemon :client:assemble -PskipAndroid=true

  zip -d "client/build/libs/libsignal-client-${pkgver}.jar" "${_libname}*.so"
}

#check() {
#  cd "${_pkgname}-${pkgver}"
#  export RUSTUP_TOOLCHAIN=stable
#  cargo test --frozen
#}

package() {
  cd "${_pkgname}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/share/java/${pkgname}" "${pkgdir}/usr/lib"

  install -Dm644 "java/client/build/libs/libsignal-client-${pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 "target/"*"/release/${_libname}.so" "$pkgdir/usr/lib/${_libname}.so"
}
