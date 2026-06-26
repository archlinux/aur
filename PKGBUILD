

pkgname=jaq-git
pkgver=3.1.0.15.gb3365b2a
pkgver() {
  cd jaq
  git describe --long --tags | sed -e "s/v//" -e 's/-alpha-/.r/' -e 's/\-/\./g'
}
pkgrel=1
pkgdesc='A jq clone'
url=https://github.com/01mf02/jaq
arch=('x86_64')
license=(MIT)
depends=(gcc-libs glibc)
makedepends=(rust jotdown)
conflicts=(jaq jq)
provides=(jaq jq)
source=("git+${url}.git")
b2sums=('SKIP')

build() {
  cd jaq
  test $RUSTC_BOOTSTRAP = 1 && test -e /usr/lib/rustlib/src/rust/library/Cargo.toml && _cargoflags="-Zbuild-std=std,panic_abort"
  RUSTFLAGS+=" -Cpanic=abort"
  cargo build --release $_cargoflags
  make -C docs jaq.1
}

package() {
  unset optdepends
  cd jaq
  install -Dm 755 target/release/jaq -t "$pkgdir"/usr/bin
  install -Dm 755 docs/jaq.1 -t "$pkgdir"/usr/share/man/man1
  ln -sf jaq "$pkgdir"/usr/bin/jq
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
