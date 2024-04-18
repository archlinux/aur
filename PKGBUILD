# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=pleaser
_binary=please
pkgver=0.5.5
pkgrel=0
pkgdesc="please, a sudo like program with regex support written in rust, get involved!"
url="https://gitlab.com/edneville/please"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('8d8b05a06accdbd2ed5c9afed44e0c13c66d21970f9408aa6f72d7e1f3cc920d7c3c884ac7502e64def1dccfa72828d0702aba9a5db023999a3a3eba50bca3a7')
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
  install -Dt "$pkgdir/etc/bash_completion.d" -m644 completions/bash/please
  install -Dt "$pkgdir/usr/share/zsh/functions/Completion/Unix" -m644 completions/zsh/_please

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

