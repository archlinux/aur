# Maintainer: David Mehren <david.mehren@udo.edu>
pkgname=sdaps-git
pkgver=r986.90b1a26
pkgrel=1
pkgdesc="Scripts for data acquisition with paper based surveys"
arch=('any')
url="https://github.com/sdaps/sdaps"
license=('GPL3' 'LPPLv1.3c+')
depends=('python-cairo' 'texlive-latexextra' 'texlive-pictures' 'zbar' 'python-reportlab' 'pdftk')
makedepends=('git' 'python-distutils-extra' 'libtiff')
optdepends=('opencv: Import of other image formats (convert, add --convert)'
            'poppler-glib: Import of other image formats (convert, add --convert)'
            'hdf5: Import of other image formats (convert, add --convert)'
            'gtkglext: Import of other image formats (convert, add --convert)'
            'python-numpy: Import of other image formats (convert, add --convert)'
            'python-gobject: Import of other image formats (convert, add --convert)'
)
checkdepends=('opencv'
              'poppler-glib'
              'hdf5'
              'gtkglext'
              'python-gobject'
              'python-numpy'
              'texlive-science' 
)
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
	python setup.py build
}

check() {
	cd "$srcdir/sdaps/test"
	./run-test-locally.sh
}

package() {
	cd "$srcdir/sdaps"
	python setup.py install --root="$pkgdir/" --optimize=1
	mkdir -p $pkgdir/usr/share/texmf/tex/latex/sdaps
	cp $pkgdir/usr/share/sdaps/tex/* $pkgdir/usr/share/texmf/tex/latex/sdaps
}
