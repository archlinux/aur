pkgname=lib32-rav1e
pkgver=0.6.6
pkgrel=1
pkgdesc='An AV1 encoder focused on speed and safety. (32-bits)'
arch=('x86_64')
url='https://github.com/xiph/rav1e'
license=('BSD')
depends=(
  'lib32-gcc-libs'
  'lib32-glibc'
  "rav1e=${pkgver}"
)
makedepends=(
  'cargo-c'
  'git'
  'nasm'
  'rust'
  'lib32-rust-libs'
  'lib32-libgit2'
)
provides=('librav1e.so')
_tag=7c9db10494c2fffa98a572027d756e55bf754036
source=(
  "git+https://github.com/xiph/rav1e.git#tag=${_tag}"
  "Cargo-rav1e-${pkgver}.lock::https://github.com/xiph/rav1e/releases/download/v${pkgver}/Cargo.lock"
)
b2sums=(
  'SKIP'
  'c7d1f548e9cd194c98685827b178f923d7cb1b4e4c20c4cab4779bc1e56a59b84655731cd0e8e60dfb9d3a3dad6f9bd25aee903601f7a2c5214285584b1a3977'
)

pkgver() {
  cd rav1e
  git describe --tags | sed 's/^v//'
}

prepare() {

  cp -f "Cargo-rav1e-${pkgver}.lock" rav1e/Cargo.lock
  cargo fetch \
    --locked \
    --manifest-path rav1e/Cargo.toml
}

build() {
  export LDFLAGS+=' -lgit2'
  cargo build --target i686-unknown-linux-gnu \
    --release \
    --frozen \
    --no-default-features \
    --features binaries,asm,threading,signal_support \
    --manifest-path rav1e/Cargo.toml
  cargo cbuild --target i686-unknown-linux-gnu\
    --release \
    --frozen \
    --no-default-features \
    --features binaries,asm,threading,signal_support \
    --prefix=/usr \
    --manifest-path rav1e/Cargo.toml \
    --libdir /usr/lib32
}

check() {
  cargo test --target i686-unknown-linux-gnu \
    --release \
    --frozen \
    --manifest-path rav1e/Cargo.toml
}

package() {
  depends+=('lib32-libgit2' 'libgit2.so')
  cd rav1e
  cargo install --target i686-unknown-linux-gnu \
    --frozen \
    --offline \
    --no-default-features \
    --features binaries,asm,threading,signal_support \
    --no-track \
    --path . \
    --root "${pkgdir}"/usr
  cargo cinstall --target i686-unknown-linux-gnu \
    --release \
    --frozen \
    --no-default-features \
    --features binaries,asm,threading,signal_support \
    --prefix /usr \
    --destdir "${pkgdir}" \
    --libdir /usr/lib32

  rm -fr "${pkgdir}/usr/include"
  (cd "${pkgdir}/usr/bin"; mv rav1e rav1e-32)

  install -Dm 644 LICENSE PATENTS -t "${pkgdir}/usr/share/licenses/${pkgname}/"

}
