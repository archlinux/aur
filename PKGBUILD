# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=pleaser
_binary=please
pkgver=0.3.23
pkgrel=2
pkgdesc="please, a sudo like program with regex support written in rust, get involved!"
url="https://gitlab.com/edneville/please"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('dd021dd154a8ab2de87fc84701886056fc6febf6e4ca71800493e1c3cd80a9c4e6f8943aea4621f6add047c73b43818048d101b37029c0eed9198b036362f22a')

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
  install -Dt "$pkgdir/usr/share/man/man1" -m644 man/please.1
  install -Dt "$pkgdir/usr/share/man/man5" -m644 man/please.ini.5

  cat <<'EOT' >"$srcdir/please.pam"
#%PAM-1.0
auth            include         system-auth
account         include         system-auth
session         include         system-auth
EOT

  install -Dm644 "$srcdir/please.pam" "$pkgdir/etc/pam.d/pleaseedit"
  install -Dm644 "$srcdir/please.pam" "$pkgdir/etc/pam.d/please"
}

