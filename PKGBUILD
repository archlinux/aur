# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=casile-git
pkgver=0.2.0.r53.g6d5f6ce
pkgrel=1
pkgdesc='Caleb’s SILE publishing toolkit'
arch=('any')
url="https://github.com/sile-typesetter/${pkgname%-git}"
license=('AGPL3')
depends=('bc'
         'bcprov' # pdftk optdepend is required
         'cpdf'
         'entr'
         'epubcheck'
         'git'
         'imagemagick'
         'inetutils'
         'inkscape'
         'java-commons-lang' # pdftk optdepend is required
         'jq'
         'kindlegen'
         'lua-colors'
         'lua-filesystem'
         'lua-yaml'
         'm4'
         'make'
         'moreutils'
         'nodejs'
         'otf-libertinus'
         'pandoc-sile-git'
         'pcre'
         'pdftk'
         'perl-yaml'
         'perl-yaml-merge-simple'
         'podofo'
         'poppler'
         'povray'
         'python-isbnlib'
         'python-pandocfilters'
         'python-pantable'
         'python-ruamel-yaml'
         'python-usfm2osis-cw-git'
         'rsync'
         'sile-git'
         'sqlite'
         'tex-gyre-fonts'
         'texlive-core'
         'ttf-hack'
         'xcftools'
         'yarn'
         'yq'
         'zint'
         'zsh')
makedepends=('rust' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 --tags --match="v*" |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    ./bootstrap.sh
    sed -i -e '/dist_\(doc|license\)_DATA/d' Makefile.am
}

build() {
    cd "$pkgname"
    ./configure --prefix /usr
}

package () {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md CHANGELOG.md
}
