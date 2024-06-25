# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Ashwin Vishnu <9155111+ashwinvis@users.noreply.github.com>
# Contributor: Ashwin Vishnu <ashwinvis+gh@protonmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=pandoc-crossref-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.3.17.1.r2.g6307fca
_pandoc_type=version
_pandoc_ver=3.2.1
_pandoc_commit=501d7cc02d8ed694e32f26756bc433250d34b193
pkgrel=2
pkgdesc="Pandoc filter for cross-references (static build)"
url="https://github.com/lierdakil/pandoc-crossref"
license=("GPL-2.0-or-later")
arch=('x86_64')
conflicts=("pandoc-crossref")
provides=("$_pkgname=${pkgver%%.r*}")
replaces=('pandoc-crossref-bin' 'pandoc-crossref-static' 'pandoc-crossref-lite')
depends=("pandoc=$_pandoc_ver")
makedepends=('git' 'stack' 'pandoc' 'yq')
source=("$pkgname::git+$url.git")
source+=(fix-tests.patch)
sha256sums=('SKIP'
            'cf79ae03433da133706e011b21869fdc5c44786cb848837c024905953fe5b7b8')

pkgver() {
    cd "$pkgname"
    git describe --match='*[0-9]' --tags --long \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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

prepare() {
    cd "$pkgname"
    stack config set resolver lts-22.22 # ghc-9.6.5

    _bumpVer citeproc 0.8.1.1
    _bumpVer commonmark-extensions 0.2.5.5
    _bumpVer djot 0.1.2.1
    _bumpVer emojis 0.1.4.1
    _bumpVer pandoc-lua-engine 0.3
    _bumpVer skylighting 0.14.2
    _bumpVer skylighting-core 0.14.2
    _bumpVer typst 0.5.0.4

    # if pandoc updates break the golden tests, cf
    # https://github.com/lierdakil/pandoc-crossref/pull/403#issuecomment-1732434519
    # for how to bump
    verPat='\([0-9]\+\.\)\{1,3\}[0-9]\+'
    case "$_pandoc_type" in
    stock) return;;
    commit)  _rmDep pandoc-cli
             _rmDep pandoc-lua-engine
             _bumpGH pandoc 'jgm/pandoc' "$_pandoc_commit" \
                '.' 'pandoc-cli' 'pandoc-lua-engine';;
    version) _bumpVer pandoc "$_pandoc_ver"
             _bumpVer pandoc-cli "$_pandoc_ver"
        ;;
    esac
    _pandoc_bound=$(awk -F. '/[0-9]+\./{$NF++;print}' OFS=. <<<"${_pandoc_ver}")
    sed -i "/pandoc.*< \?$_pandoc_ver/s#< \?[0-9.]*#<$_pandoc_bound#" \
        pandoc-crossref.cabal package.yaml

    # See https://github.com/lierdakil/pandoc-crossref/pull/443
    # Broken golden tests due to:
    # - Graphics are now wrapped in \pandocbounded
    # jgm/pandoc@26b25a4428815b04c255e33e95ee86ca7b6ee30e
    # - Figures are now resized by \linewidth, not \textwidth
    # jgm/pandoc@7e7735bb6b41c6f76ed3a03d06f7e1fe7dca299d
    patch -p1 -i ../fix-tests.patch
}

check() {
    cd "$pkgname"

    stack test
}

build() {
    cd "$pkgname"

    stack build \
        --install-ghc \
        --ghc-options='-fdiagnostics-color=always' \
        --flag 'pandoc:embed_data_files' \
        --fast
    pandoc -s -t man docs/index.md -o pandoc-crossref.1
}

package() {
    cd "$pkgname"
    stack install --local-bin-path "$pkgdir/usr/bin"
    install -Dm644 pandoc-crossref.1 \
        "${pkgdir}"/usr/share/man/man1/pandoc-crossref.1
}
