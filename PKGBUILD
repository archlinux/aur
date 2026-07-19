# Maintainer: Markus Maiwald <markus@maiwald.work>

pkgname=tree-sitter-janus
pkgver=0.1.1
pkgrel=1
pkgdesc='Janus grammar for tree-sitter (Sober/Neovim language intelligence)'
arch=('x86_64' 'aarch64')
url='https://git.sovereign-society.org/janus/tree-sitter-janus'
license=('LSL-1.0')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('tree-sitter-cli')
optdepends=(
  'tree-sitter: core library'
  'sober-bin: repository governance that loads this grammar'
  'neovim: editor highlighting via /usr/lib/tree_sitter/janus.so'
)
provides=("lib$pkgname.so")
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('822067bb936e1fdd4e2184be4e2b2d16eda78ebd859c84475e9d47e0c034414f')

prepare() {
  cd "$pkgname"

  # parser.c is not shipped in the tarball (gitignored upstream); regenerate
  # from the committed grammar.json with the distro tree-sitter-cli (ABI 15
  # via tree-sitter.json).
  tree-sitter generate src/grammar.json
}

build() {
  cd "$pkgname"
  make PREFIX=/usr PARSER_URL="$url"
}

check() {
  cd "$pkgname"
  tree-sitter test
}

package() {
  # Arch/Neovim grammar symlink layout (Sober also loads /usr/lib/libtree-sitter-janus.so)
  install -d "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/lib$pkgname.so" \
    "$pkgdir/usr/lib/tree_sitter/janus.so"

  cd "$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  if [[ -f LICENSE_SOVEREIGN.md ]]; then
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE_SOVEREIGN.md
  fi

  install -d "$pkgdir/usr/share/tree-sitter/queries/janus"
  install -Dm644 -t "$pkgdir/usr/share/tree-sitter/queries/janus" queries/*.scm
}
