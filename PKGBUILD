# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontship-git
pkgver=0.8.2.r0.g273527b
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
         'jq'
         'libarchive'
         'libgit2'
         'make'
         'psautohint'
         'python'
         'python-babelfont'
         'python-brotli' # fonttools optdepends
         'python-cffsubr' # ufo2ft optdepends
         'python-fontmake'
         'python-fonttools'
         'python-fs' # fonttools optdepends
         'python-lxml' # fonttools optdepends
         'python-pcpp'
         'python-skia-pathops' # ufo2ft optdepends
         'python-ufo2ft>=2.19.1'
         'python-ufonormalizer'
         'python-unicodedata2' # fonttools optdepends
         'python-vttlib'
         'python-zopfli' # fonttools optdepends
         'sfd2ufo>=1.0.7'
         'sfdnormalize'
         'sfnt2woff-zopfli'
         'ttfautohint'
         'woff2'
         'zsh')
makedepends=('autoconf-archive' 'cargo' 'rust')
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

check() {
    cd "${pkgname%-git}"
    make check
}

package() {
    cd "${pkgname%-git}"
    make DESTDIR="$pkgdir" install
}
