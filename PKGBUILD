# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Ashwin Vishnu <9155111+ashwinvis@users.noreply.github.com>
# Contributor: Ashwin Vishnu <ashwinvis+gh@protonmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=pandoc-crossref-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.3.18.0.r0.g6cff8a6
_pandoc_type=version
_pandoc_ver=3.5
_pandoc_lua_ver=0.3.3
_pandoc_commit=31e4fabbb29d302eb972d25ce4aa10dd26bfbadc
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
    git describe --match='*[0-9]' --tags --long \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    stack config set resolver lts-22.22 # ghc-9.6.5

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
             _bumpVer pandoc-lua-engine "$_pandoc_lua_ver"
        ;;
    esac
    _pandoc_bound=$(awk -F. '/[0-9]+\./{$NF++;print}' OFS=. <<<"${_pandoc_ver}")
    sed -i "/pandoc.*< \?$_pandoc_ver/s#< \?[0-9.]*#<$_pandoc_bound#" \
        pandoc-crossref.cabal package.yaml

    _bumpVer commonmark 0.2.6.1
    _bumpVer commonmark-pandoc 0.2.2.2
    _bumpVer djot 0.1.2.2
    _bumpVer hslua-module-doclayout 1.2.0
    _bumpVer pandoc-lua-marshal 0.2.9
    _bumpVer texmath 0.12.8.11
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

check() {
    cd "$pkgname"

    stack test
}

package() {
    cd "$pkgname"
    stack install --local-bin-path "$pkgdir/usr/bin"
    install -Dm644 pandoc-crossref.1 \
        "${pkgdir}"/usr/share/man/man1/pandoc-crossref.1
}
