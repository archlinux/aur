pkgname=lib32-rav1e
pkgver=0.6.3
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
_tag=bc155a5801a0d402b16cd42ca1392168d299b70b
source=(
  "git+https://github.com/xiph/rav1e.git#tag=${_tag}"
  "Cargo-rav1e-${pkgver}.lock::https://github.com/xiph/rav1e/releases/download/v${pkgver}/Cargo.lock"
)
b2sums=('SKIP'
        '8a4c208534dcc2b6f272eb154aad5b01767b6d09c82735109646173efdda5cf4ed2d4775d437af5aa70cbc3e937d4f5c55eac4738c52441c3fdec7ee7e65ac38')

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
    --manifest-path rav1e/Cargo.toml
  cargo cbuild --target i686-unknown-linux-gnu\
    --release \
    --frozen \
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
    --no-track \
    --path . \
    --root "${pkgdir}"/usr
  cargo cinstall --target i686-unknown-linux-gnu \
    --release \
    --frozen \
    --prefix /usr \
    --destdir "${pkgdir}" \
    --libdir /usr/lib32

  rm -fr "${pkgdir}/usr/include"
  (cd "${pkgdir}/usr/bin"; mv rav1e rav1e-32)

  install -Dm 644 LICENSE PATENTS -t "${pkgdir}/usr/share/licenses/${pkgname}/"

}
