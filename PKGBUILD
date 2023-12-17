# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Ashwin Vishnu <9155111+ashwinvis@users.noreply.github.com>
# Contributor: Ashwin Vishnu <ashwinvis+gh@protonmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=pandoc-crossref-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.3.17.0.r0.g2e11975
_pandoc_type=version
_pandoc_ver=3.1.11
_pandoc_commit=c3038dcd54152c4e18e49db31676b79ee7cc29b2
pkgrel=5
pkgdesc="Pandoc filter for cross-references (static build)"
url="https://github.com/lierdakil/pandoc-crossref"
license=("GPL2")
arch=('x86_64')
conflicts=("pandoc-crossref")
provides=("$_pkgname=${pkgver%%.r*}")
replaces=('pandoc-crossref-bin' 'pandoc-crossref-static' 'pandoc-crossref-lite')
depends=("pandoc=$_pandoc_ver")
makedepends=('stack' 'pandoc')
source=("$pkgname::git+$url.git" ver-bump.patch)
sha256sums=('SKIP'
            'e1b28f87f32b96f87f9d0657de2cebe18464348b5194cac281a0ecf5c35c45fd')

pkgver() {
    cd "$pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    patch --forward --strip=1 --input="${srcdir}/ver-bump.patch"
    # if pandoc updates break the golden tests, cf
    # https://github.com/lierdakil/pandoc-crossref/pull/403#issuecomment-1732434519
    # for how to bump
    sedscript=''
    case "$_pandoc_type" in
    stock) return;;
    commit)
        sedscript='/ pandoc-\([0-9]\+\.\)\{1,3\}[0-9]\+/{'
        sedscript+='s#pandoc.*#github: jgm/pandoc#;'
        sedscript+="a\  commit: $_pandoc_commit"$'\n'
        sedscript+='}'
        ;;
    version)
        sedscript="s/ pandoc-\([0-9]\+\.\)\{1,3\}[0-9]\+/ pandoc-$_pandoc_ver/"
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
