# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=psicode
pkgver=0.2.0
pkgrel=1
pkgdesc='Portable terminal coding agent written in C89 and Lua'
arch=('x86_64' 'aarch64')
url='https://psicode.ai'
license=('MIT')
depends=('lua' 'cjson' 'curl' 'zlib' 'libedit' 'argtable3')
makedepends=('pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/siraben/psi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d7d16374e08f54555a274d59d6678072afdaf83e5a5309f1132de79996d13e4e')

latestver() {
  gh api repos/siraben/psi/releases/latest --jq '.tag_name' | sed 's/^v//'
}

# The shipped name is psicode, not upstream's psi: the psi package in extra owns
# /usr/bin/psi, /usr/include/psi and /usr/share/psi, so those paths cannot be
# taken. Upstream's Makefile hardcodes "psi" only in its install rules, so the
# rename is path manipulation, not a source patch.
#
# Baked into the binary so the packaged boot.lua is the file that runs. The
# requires it performs still resolve against the embedded copies in the binary
# unless a caller overrides package.path, so the module tree installed beside
# it is there for that override and for reading, not because it is consulted by
# default. Upstream falls back to its embedded bootstrap when the path is
# absent, which keeps the binary working from a bare copy.
_boot_file=/usr/share/psicode/boot.lua

# Upstream prepends its own -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 ahead of
# CFLAGS, which then gets redefined by the -D_FORTIFY_SOURCE the build flags
# already carry and fails the tree-wide -Werror. Keep its other hardening
# flags, drop only the pair the build already supplies.
_hardening_cflags='-fstack-protector-strong -fPIE'

build() {
  cd "psi-${pkgver}"
  make LUA_BOOT_FILE="$_boot_file" HARDENING_CFLAGS="$_hardening_cflags"
}

check() {
  cd "psi-${pkgver}"
  ./build/psi --version
  ./build/psi --eval 'assert(type(psi) == "table")'
}

package() {
  cd "psi-${pkgver}"
  make install \
    DESTDIR="$pkgdir" \
    PREFIX=/usr \
    INCLUDEDIR=/usr/include \
    SHAREDIR=/usr/share/psicode \
    MAN1DIR=/usr/share/man/man1 \
    LUA_BOOT_FILE="$_boot_file"

  mv "$pkgdir/usr/bin/psi" "$pkgdir/usr/bin/psicode"
  mv "$pkgdir/usr/include/psi" "$pkgdir/usr/include/psicode"

  # Only the command name is rewritten; the .psi and ~/.config/psi paths the
  # page documents are upstream's real runtime locations and stay as-is.
  sed -i \
    -e 's/^\.TH PSI 1 "" "psi" "User Commands"/.TH PSICODE 1 "" "psicode" "User Commands"/' \
    -e 's/^psi \\- terminal coding agent/psicode \\- terminal coding agent/' \
    -e 's/^\.B psi$/.B psicode/' \
    -e 's/^psi is a small terminal/psicode is a small terminal/' \
    -e 's/^psi opens the inline TUI/psicode opens the inline TUI/' \
    "$pkgdir/usr/share/man/man1/psi.1"
  # The sed rules key on upstream's generated wording; a rewrite upstream must
  # not ship a page whose NAME disagrees with the installed command.
  grep -q '^\.TH PSICODE 1' "$pkgdir/usr/share/man/man1/psi.1" || {
    error "man page header no longer matches the rename rules"
    return 1
  }
  mv "$pkgdir/usr/share/man/man1/psi.1" "$pkgdir/usr/share/man/man1/psicode.1"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
