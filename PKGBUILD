# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=pleaser
_binary=please
pkgver=0.5.1
pkgrel=0
pkgdesc="please, a sudo like program with regex support written in rust, get involved!"
url="https://gitlab.com/edneville/please"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('244f594f54038a00fef60759e6b18efd1fccce31ce8d5f84a0cee285eef3297156a70cff42a87c6a5e5200daadc6544e43f47589daa204b844605e0de1e068c9')
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

