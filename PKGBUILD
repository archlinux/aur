# Maintainer: <asamk@gmx.de>

pkgname=libsignal-client
_pkgname=libsignal
_libname=libsignal_jni
pkgver=0.81.0
pkgrel=1
pkgdesc='Library for the Signal Protocol.'
url="https://github.com/signalapp/${_pkgname}"
depends=('gcc-libs')
checkdepends=('cargo')
makedepends=('cargo' 'gradle' 'git' 'zip' 'protobuf' 'cmake' 'clang' 'java-environment=17' 'python')
options=(!lto)
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('AGPL-3.0-only')
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/refs/tags/v$pkgver.tar.gz"
)

sha512sums=('8d0c4253baa53f6805670a7306a2a57cab41aaaa8db0438009b1450d07383429f241f752f7c3b212974d24a57edaf12273fd9596816447f7bb695688e2e8a691')

prepare() {
  tar xf "${_pkgname}-$pkgver.tar.gz"
  cd "${_pkgname}-${pkgver}"

  # Use the default system rust toolchain
  # rm -f rust-toolchain

  sed -i 's/exit 2/suffix=""/' java/build_jni.sh
  sed -i 's/-Xmx4g//' java/gradle.properties
  sed -i "s/cargo build/cargo build --frozen/" java/build_jni.sh

  cargo fetch --locked --target "$(rustc -vV | awk '/^host: / {print $2}')"
}

build() {
  cd "${_pkgname}-${pkgver}/java"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  ./build_jni.sh desktop
  GRADLE_USER_HOME="${srcdir}/.gradle" ./gradlew --no-daemon :client:assemble -PskipAndroid=true

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
