# Maintainer: <asamk@gmx.de>

pkgname=libsignal-client
_pkgname=libsignal
_libname=libsignal_jni
_java_version=17
pkgver=0.87.4
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
    "boring::git+https://github.com/signalapp/boring"
    "curve25519-dalek::git+https://github.com/signalapp/curve25519-dalek"
    "SparsePostQuantumRatchet.git::git+https://github.com/signalapp/SparsePostQuantumRatchet.git"
)

sha512sums=('8750e79b31ae26e20809d83721a225a59409c0b1f7a082fa888181f9a45c4359ee6f7938e031fe3707d3b8ff7e23d94891fb460fee67297f475b444604cd6eb5'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  tar xf "${_pkgname}-$pkgver.tar.gz"
  cd "${_pkgname}-${pkgver}"

  # Use the default system rust toolchain
  # rm -f rust-toolchain

  sed -i 's/exit 2/suffix=""/' java/build_jni.sh
  sed -i 's/-Xmx4g//' java/gradle.properties
  sed -i "s/echo_then_run cargo build/__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS=nightly cargo build --frozen -Zgit=shallow-deps -Zgitoxide/" java/build_jni.sh
  sed -i "s/cargo fetch//" java/build_jni.sh

  for repo in boring curve25519-dalek SparsePostQuantumRatchet.git; do
    sed -i "s|https://github.com/signalapp/${repo}|file://${srcdir}/${repo}|g" Cargo.toml Cargo.lock
  done

  export RUSTUP_TOOLCHAIN=stable
  __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS=nightly cargo fetch --locked --target "$(rustc -vV | awk '/^host: / {print $2}')" -Zgit=shallow-deps -Zgitoxide
}

build() {
  cd "${_pkgname}-${pkgver}/java"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
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
