# Maintainer: <asamk@gmx.de>

pkgname=libsignal-client
_pkgname=libsignal
_libname=libsignal_jni
_java_version=17
pkgver=0.84.0
pkgrel=1
pkgdesc='Library for the Signal Protocol.'
url="https://github.com/signalapp/${_pkgname}"
depends=('gcc-libs' 'java-runtime')
checkdepends=('cargo')
makedepends=('cargo' 'gradle' 'git' 'zip' 'protobuf' 'cmake' 'clang' "java-environment=${_java_version}" 'python')
options=(!lto)
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('AGPL-3.0-only')
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/refs/tags/v$pkgver.tar.gz"
)

sha512sums=('801f657543b60c9a58caf0f33b5930a7db05d9a54bb80f067be99b3d0f434800710f4f14ec6361002736c20cdf8c4b353ff9cd6a37fe212f8729715207ad5077')

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
  export CARGO_NET_GIT_FETCH_WITH_CLI=true
  export JAVA_HOME="$(ls -d /usr/lib/jvm/java-${_java_version}-* | head -n1)"
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
