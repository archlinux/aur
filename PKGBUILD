# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=pleaser
_binary=please
pkgver=0.3.21
pkgrel=1
pkgdesc="please, sudo like program with regex support written in rust"
url="https://gitlab.com/edneville/please"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("git+https://gitlab.com/edneville/${_binary}.git#tag=v${pkgver}")
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

  cat <<'EOT' >"please.pam"
#%PAM-1.0
auth            include         system-auth
account         include         system-auth
session         include         system-auth
EOT

  install -Dm644 "please.pam" "$pkgdir/etc/pam.d/pleaseedit"
  install -Dm644 "please.pam" "$pkgdir/etc/pam.d/please"
}

