# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontship-git
pkgver=0.6.2.r8.gb2f4c97
pkgrel=1
pkgdesc='A font development toolkit and collaborative work flow'
arch=('any')
url="https://github.com/theleagueof/${pkgname%-git}"
license=('AGPL3')
depends=('diffutils'
         'entr'
         'font-v'
         'gftools'
         'git'
         'libarchive'
         'libgit2'
         'make'
         'python'
         'python-babelfont'
         'python-brotli' # fonttools optdepends
         'python-cffsubr' # ufo2ft optdepends
         'python-fontmake'
         'python-fonttools'
         'python-fs' # fonttools optdepends
         'python-lxml' # fonttools optdepends
         'python-skia-pathops' # ufo2ft optdepends
         'python-ufo2ft>=2.19.1'
         'python-ufonormalizer'
         'python-unicodedata2' # fonttools optdepends
         'python-vttlib'
         'python-zopfli' # fonttools optdepends
         'sfdnormalize'
         'sfnt2woff-zopfli'
         'ttfautohint'
         'woff2'
         'zsh')
makedepends=('cargo' 'rust')
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --abbrev=7 --match 'v*.*.*' --tags |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    ./bootstrap.sh
    cargo fetch --locked
}

build() {
    cd "${pkgname%-git}"
    ./configure --prefix="/usr"
    make
}

package() {
    cd "${pkgname%-git}"
    make DESTDIR="$pkgdir" install
}
