# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=pleaser
_binary=please
pkgver=0.5.3
pkgrel=0
pkgdesc="please, a sudo like program with regex support written in rust, get involved!"
url="https://gitlab.com/edneville/please"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('0a8438acbe5779cfd4bbff3ef569ff8139ab20613e32094b4b89a88deb10f4ec0d609cad54cc3b28e4b1b757b856cf0341f16d5cc4d4f17fd8fe91852041130c')
backup=('etc/please.ini','etc/pam.d/please','etc/pam.d/pleaseedit')

prepare() {
  cd please-v${pkgver}
  cargo fetch --target x86_64-unknown-linux-gnu
}

build() {
  cd please-v${pkgver}
  cargo build --release --frozen --all-targets
}

check() {
  cd please-v${pkgver}
  # test_expand* fails; needs nightly rust
  cargo test --release --frozen || :
}

package() {
  cd please-v${pkgver}
  install -Dt "$pkgdir/usr/bin" -m4755 target/release/please
  install -Dt "$pkgdir/usr/bin" -m4755 target/release/pleaseedit
  install -Dt "$pkgdir/usr/share/doc/pleaser" -m644 README.md
  install -Dt "$pkgdir/usr/share/doc/pleaser" -m644 examples/please.ini
  install -Dt "$pkgdir/usr/share/man/man1" -m644 man/please.1
  install -Dt "$pkgdir/usr/share/man/man5" -m644 man/please.ini.5
  install -Dt "$pkgdir/etc" -m600 examples/please.ini

  mkdir -m 700 -p "$pkgdir/etc/please.d"

  cat <<'EOT' >"$srcdir/please.pam"
#%PAM-1.0
auth            include         system-auth
account         include         system-auth
session         include         system-auth
EOT

  install -Dm644 "$srcdir/please.pam" "$pkgdir/etc/pam.d/pleaseedit"
  install -Dm644 "$srcdir/please.pam" "$pkgdir/etc/pam.d/please"
}

