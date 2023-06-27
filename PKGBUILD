pkgname=gumtree-tree-sitter-git
pkgver=r36.34eda51
pkgrel=1
pkgdec='A GumTree wrapper for tree-sitter parsers'
arch=('any')
url='https://github.com/GumTreeDiff/tree-sitter-parser'
license=('GPL3')
depends=(
  'python-tree-sitter'
  'python-yaml'
)
makedepends=(
  'python'
)
source=(
  "tree-sitter-parser::git+https://github.com/GumTreeDiff/tree-sitter-parser"
)
sha256sums=(
  SKIP
)

pkgver() {
  cd "$srcdir/tree-sitter-parser"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/tree-sitter-parser"
  git submodule update --init --recursive --depth 1
  touch "./file.py"
  python "./tree-sitter-parser.py" "./file.py" python > /dev/null
}

package() {
  cd "$srcdir/tree-sitter-parser"
  install -D -t "$pkgdir/usr/lib/gumtree-tree-sitter-git" "./tree-sitter-parser.py" "./rules.yml"
  install -D -t "$pkgdir/usr/lib/gumtree-tree-sitter-git/build" "./build/languages.so"
  install -D -t "$pkgdir/usr/lib/gumtree-tree-sitter-git/tree_sitter_parser" "./tree_sitter_parser/__init__.py" 
  find . -type d | grep '^./tree-sitter-.*/src' | xargs '-I{}' mkdir -p "$pkgdir/usr/lib/gumtree-tree-sitter-git/{}"
  find . -type f | grep '^./tree-sitter-.*/src/' | xargs '-I{}' cp -a --attributes-only "{}" "$pkgdir/usr/lib/gumtree-tree-sitter-git/{}"
}
