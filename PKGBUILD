# Author: Achilleas Koutsou <achilleas@koutsou.net>

pkgname=rpm-sequoia
pkgver=1.5.0
pkgrel=4
pkgdesc="An OpenPGP backend for rpm using Sequoia PGP"
arch=('x86_64')
url='https://sequoia-pgp.org'
license=('GPL2')
depends=()
makedepends=(cargo rust clang pkg-config nettle)
conflicts=()
options=()
provides=()

source=(https://github.com/rpm-software-management/rpm-sequoia/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('02e272a689b7215e12838afb57209aa004909b661f23527455b2fd0ea4400527')

prepare() {
  cd "${srcdir}/rpm-sequoia-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/rpm-sequoia-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  PREFIX=/usr LIBDIR="\${prefix}/lib" cargo build --frozen --release
  cargo test --release
}

package() {
  cd "${srcdir}/rpm-sequoia-${pkgver}"

  install -Dm644 target/release/librpm_sequoia.so "${pkgdir}/usr/lib/librpm_sequoia.so.1"

  # unversioned symlink
  ln -s librpm_sequoia.so.1 "${pkgdir}/usr/lib/librpm_sequoia.so"

  # install pkg-config
  install -Dm644 target/release/rpm-sequoia.pc "${pkgdir}/usr/lib/pkgconfig/rpm-sequoia.pc"
}
