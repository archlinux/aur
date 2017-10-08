# Maintainer: David Mehren <david.mehren@udo.edu>
pkgname=sdaps-git
pkgver=r927.d91e982
pkgrel=1
pkgdesc="Scripts for data acquisition with paper based surveys"
arch=('any')
url="https://github.com/sdaps/sdaps"
license=('GPL3' 'LPPLv1.3c+')
depends=('python2-cairo' 'texlive-latexextra' 'texlive-pictures' 'zbar' 'python2-reportlab' 'pdftk' 'python2-pdftools')
makedepends=('git' 'python2-distutils-extra' 'libtiff')
optdepends=('opencv: Import of other image formats (convert, add --convert)'
            'python2-gobject: Import of other image formats (convert, add --convert)'
            'python2-poppler: Import of other image formats (convert, add --convert)'
            'hdf5: Import of other image formats (convert, add --convert)'
            'python2-numpy: Import of other image formats (convert, add --convert)'
)
checkdepends=('opencv' 'python2-gobject' 'python2-poppler' 'hdf5' 'python2-numpy' 'texlive-science')
source=('git+https://github.com/sdaps/sdaps.git'
        'git+https://github.com/sdaps/sdaps-class.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/sdaps"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/sdaps"
    git submodule init
    git config submodule.sdaps-class.url $srcdir/sdaps-class
    git submodule update
}

build() {
    cd "$srcdir/sdaps"
    python2 setup.py build
}

check() {
    cd "$srcdir/sdaps/test"
    ./run-test-locally.sh
}

package() {
	cd "$srcdir/sdaps"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
