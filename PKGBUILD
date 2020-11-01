# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.

# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=pleaser
pkgver=0.3.3+28+gb8d9027
pkgrel=1
pkgdesc="please, sudo like program with regex support written in rust"
url="https://gitlab.com/edneville/please"
arch=(x86_64)
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
_commit=b8d9027c05115259dd15783256c33ad4c43b0ca4
source=("git+https://gitlab.com/edneville/please.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd please
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd please
  cargo fetch --target x86_64-unknown-linux-gnu
}

build() {
  cd please
  cargo build --release --frozen --all-targets
}

check() {
  cd please
  # test_expand* fails; needs nightly rust
  cargo test --release --frozen || :
}

package() {
  cd please
  install -Dt "$pkgdir/usr/bin" -m4755 target/release/please
  install -Dt "$pkgdir/usr/bin" -m4755 target/release/pleaseedit
  install -Dt "$pkgdir/usr/share/doc/pleaser" -m644 README.md
  install -Dt "$pkgdir/usr/share/man/man1" -m644 man/please.1
  install -Dt "$pkgdir/usr/share/man/man5" -m644 man/please.ini.5
}
