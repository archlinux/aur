# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Ashwin Vishnu <9155111+ashwinvis@users.noreply.github.com>
# Contributor: Ashwin Vishnu <ashwinvis+gh@protonmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=pandoc-crossref-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.3.25.r0.g1199b70.pandoc.3.10.2
_pandoc_type=version
_pandoc_ver=3.10.2
_pandoc_lua_ver=0.5.3.1
_pandoc_commit=f2ee5dfee866aab007a33552acc6bc01810c6918
pkgrel=1
pkgdesc='Pandoc filter for cross-references (static build)'
arch=('i686' 'x86_64')
url="https://github.com/lierdakil/${_pkgname}"
license=('GPL-2.0-or-later')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
depends=('gmp' "pandoc-cli=$_pandoc_ver" 'zlib')
makedepends=('git' 'stack' 'pandoc-cli' 'yq')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

_rmDep() {
    yq -i --yaml-output --arg pkg "$1" \
        "$(cat <<'EOF'
        ."extra-deps"
        |= del(.[] | strings | select(match("^\($pkg)-[0-9.]+")))
EOF
)" stack.yaml
}

_bump() {
    _rmDep "$1"
    yq -i --yaml-output --argjson val "$2" '."extra-deps"+=[$val]' stack.yaml
}

__ver() { jq -cn '"\($pkg)-\($ver)"' --arg pkg "$1" --arg ver "$2"; }
_bumpVer() { _bump "$1" "$(__ver "$@")"; }

__repo() {
    jq -cn '
        $repo + {$commit, subdirs: $ARGS.positional}
        | with_entries(select((.value|length) > 0))
' --argjson repo "$1" --arg commit "$2" --args -- "${@:3}"
}
__kv() { jq -cn '{$key: $val}' --arg key "$1" --arg val "$2"; }
_bumpGH() { _bump "$1" "$(__repo "$(__kv github "$2")" "${@:3}")"; }

pkgver() {
  cd "$pkgname"
  git describe --tags --long --match='*[0-9]' \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    | sed "s/$/.pandoc.$_pandoc_ver/"
}

prepare() {
  cd "$pkgname"
  stack config set resolver lts-23.28 # ghc-9.8.4
  yq -i --yaml-output '. + {
    "allow-newer": true,
    "allow-newer-deps": ["pandoc-crossref"],
    "extra-deps": []
  }' stack.yaml

  # if pandoc updates break the golden tests, cf
  # https://github.com/lierdakil/pandoc-crossref/pull/403#issuecomment-1732434519
  # for how to bump
  verPat='\([0-9]\+\.\)\{1,3\}[0-9]\+'
  case "$_pandoc_type" in
  stock) if git diff --quiet -- stack.yaml; then
      echo "stack.yaml has been modified, can't use stock version selection"
      echo '(you probably need to comment out the modifications to stack.yaml'
      echo 'in prepare())'
      exit 1
    fi
    return;;
  commit)  _rmDep pandoc-cli
           _rmDep pandoc-lua-engine
           _bumpGH pandoc 'jgm/pandoc' "$_pandoc_commit" \
             '.' 'pandoc-cli' 'pandoc-lua-engine'
           ;;
  version) _bumpVer pandoc "$_pandoc_ver"
           _bumpVer pandoc-cli "$_pandoc_ver"
           _bumpVer pandoc-lua-engine "$_pandoc_lua_ver"
           ;;
  esac
  _pandoc_bound=$(awk -F. '/[0-9]+\./{$NF++;print}' OFS=. <<<"${_pandoc_ver}")
  sed -i "/pandoc.*< \?$_pandoc_ver/s#< \?[0-9.]*#<$_pandoc_bound#" \
      pandoc-crossref.cabal package.yaml

  _bumpVer asciidoc 0.1.0.4
  _bumpVer citeproc 0.13.0.1
  _bumpVer commonmark 0.3
  _bumpVer commonmark-extensions 0.2.7.1
  _bumpVer commonmark-pandoc 0.3
  _bumpVer djot 0.1.4.1
  _bumpVer doclayout 0.5.0.3
  _bumpVer emojis 0.1.5
  _bumpVer hslua 2.5.0
  _bumpVer hslua-module-doclayout 1.2.1.1
  _bumpVer hslua-module-path 1.2.0
  _bumpVer hslua-module-system 1.3.0
  _bumpVer hslua-module-text 1.2.0
  _bumpVer hslua-module-version 1.2.0.1
  _bumpVer hslua-module-zip 1.2.1
  _bumpVer hslua-objectorientation 2.5.0
  _bumpVer hslua-packaging 2.4.1
  _bumpVer hslua-typing 0.2.0
  _bumpVer pandoc-lua-marshal 0.3.2.1
  _bumpVer pandoc-types 1.23.1.2
  _bumpVer skylighting 0.14.7
  _bumpVer skylighting-core 0.14.7
  _bumpVer skylighting-format-typst 0.1
  _bumpVer texmath 0.13.2.1
  _bumpVer typst 0.11
  _bumpVer typst-symbols 0.3
}

build() {
  cd "$pkgname"

  stack build \
      --install-ghc \
      --ghc-options='-fdiagnostics-color=always' \
      --flag 'pandoc:embed_data_files' \
      --test --no-run-tests \
      --fast
  pandoc -s -t man docs/index.md -o pandoc-crossref.1
}

check() {
  cd "$pkgname"
  stack test
}

package() {
  cd "$pkgname"
  stack install --local-bin-path "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 pandoc-crossref.1 \
    "$pkgdir"/usr/share/man/man1/pandoc-crossref.1
}

# vim:set ts=2 sw=2 et
