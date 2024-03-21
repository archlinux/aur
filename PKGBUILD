# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Ashwin Vishnu <9155111+ashwinvis@users.noreply.github.com>
# Contributor: Ashwin Vishnu <ashwinvis+gh@protonmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=pandoc-crossref-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.3.17.0e.r1.g060a049
_pandoc_type=version
_pandoc_ver=3.1.12.3
_pandoc_commit=b1e2e452deb36e050c0b81c4c2351d5a829d2977
pkgrel=1
pkgdesc="Pandoc filter for cross-references (static build)"
url="https://github.com/lierdakil/pandoc-crossref"
license=("GPL2")
arch=('x86_64')
conflicts=("pandoc-crossref")
provides=("$_pkgname=${pkgver%%.r*}")
replaces=('pandoc-crossref-bin' 'pandoc-crossref-static' 'pandoc-crossref-lite')
depends=("pandoc=$_pandoc_ver")
makedepends=('stack' 'pandoc' 'yq')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_bumpVer() {
    yq -i --yaml-output --arg pkg "$1" --arg ver "$2" \
        "$(cat <<'EOF'
        (."extra-deps".[]
        | strings
        | select(match("^\($pkg)-[0-9.]+")))
        |= $pkg + "-" + $ver
EOF
)" stack.yaml
}

prepare() {
    cd "$pkgname"
    stack config set resolver lts-22.13 # ghc-9.6.4

    _bumpVer commonmark            0.2.6
    _bumpVer commonmark-extensions 0.2.5.4
    _bumpVer djot                  0.1.1.3
    _bumpVer pandoc                3.1.12.3
    _bumpVer pandoc-cli            3.1.12.3
    _bumpVer skylighting           0.14.1.1
    _bumpVer skylighting-core      0.14.1.1
    _bumpVer texmath               0.12.8.7
    _bumpVer toml-parser           2.0.0.0
    _bumpVer typst                 0.5.0.2
    _bumpVer zip-archive           0.4.3.1

    # if pandoc updates break the golden tests, cf
    # https://github.com/lierdakil/pandoc-crossref/pull/403#issuecomment-1732434519
    # for how to bump
    verPat='\([0-9]\+\.\)\{1,3\}[0-9]\+'
    sedscript=''
    case "$_pandoc_type" in
    stock) return;;
    commit)
        sedscript+="/ pandoc-$verPat/{"
        sedscript+='s#pandoc.*#github: jgm/pandoc#;'
        sedscript+="a\  commit: $_pandoc_commit"$'\n'
        sedscript+='}'
        ;;
    version)
        sedscript+="s/ pandoc-$verPat/ pandoc-$_pandoc_ver/;"
        sedscript+="s/ pandoc-cli-$verPat/ pandoc-cli-$_pandoc_ver/;"
        ;;
    esac
    sed -i "$sedscript" stack.yaml
    _pandoc_bound=$(awk -F. '/[0-9]+\./{$NF++;print}' OFS=. <<<"${_pandoc_ver}")
    sed -i "/, pandoc /s#<.*#<$_pandoc_bound#" \
        pandoc-crossref.cabal package.yaml
}

check() {
    cd "$pkgname"

    stack test
}

build() {
    cd "$pkgname"

    stack setup
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
