pkgname=lib32-rav1e
pkgver=0.7.1
pkgrel=1
pkgdesc='An AV1 encoder focused on speed and safety. (32-bits)'
arch=('x86_64')
url='https://github.com/xiph/rav1e'
license=('BSD')
depends=(
  'lib32-gcc-libs'
  'lib32-glibc'
  "rav1e=${pkgver}"
  'lib32-libgit2' 'libgit2.so'
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
_tag=a8d05d0c43826a465b60dbadd0ab7f1327d75371
source=(
  "git+https://github.com/xiph/rav1e.git#tag=${_tag}"
  "Cargo-rav1e-${pkgver}.lock::https://github.com/xiph/rav1e/releases/download/v${pkgver}/Cargo.lock"
)
b2sums=(
  'SKIP'
  '7cbeaff87ca4e9db469be06cbead0c5b05af2064d6d5f12f97f5999992017b66a24bc19ed4eaf69f7d6579732f843f3e93f30d9581b8c8344728d3e3773a0f79'
)

pkgver() {
  cd rav1e
  git describe --tags | sed 's/^v//'
}

prepare() {

  export CARGO_HOME="${srcdir}/fakehome/cargo"

  cp -f "Cargo-rav1e-${pkgver}.lock" rav1e/Cargo.lock
  cargo fetch \
    --locked \
    --manifest-path rav1e/Cargo.toml
}

build() {
  export CARGO_HOME="${srcdir}/fakehome/cargo"

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
  export CARGO_HOME="${srcdir}/fakehome/cargo"

  cargo test --target i686-unknown-linux-gnu \
    --release \
    --frozen \
    --manifest-path rav1e/Cargo.toml
}

package() {
  export CARGO_HOME="${srcdir}/fakehome/cargo"

  cd rav1e
  cargo install --target i686-unknown-linux-gnu \
    --frozen \
    --offline \
    --no-default-features \
    --features binaries,asm,threading,signal_support \
    --no-track \
    --path . \
    --root "${pkgdir}/usr"
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
