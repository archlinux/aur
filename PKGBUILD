# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=rabbitvcs
pkgname=${_pkgname}-git
pkgver=0.16.r78.g3181199
pkgrel=1
pkgdesc="Utilities for better client integration with popular version control systems (git)"
arch=('any')
url="http://rabbitvcs.org/"
depends=('git' 'pygtk' 'python2-pysvn' 'python2-dulwich' 'python2-gobject2' 'python2-configobj' 'python2-simplejson' 'python2-gtkspellcheck')
optdepends=('meld: graphical diff viewer')
makedepends=('python2-setuptools' 'git')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
license=('GPL')
source=("${_pkgname}::git+https://github.com/rabbitvcs/rabbitvcs.git"
        'no_update_icon_cache_from_setup.patch')
sha256sums=('SKIP'
            '5599d5e439bf51ed2777e69ef64b24491a3f83b2116b809dec5b4deeac297384')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch -uNp2 -r- -i ../no_update_icon_cache_from_setup.patch
}

build() {
	cd "${srcdir}/${_pkgname}"
	sed -i "s#env python#env python2#" setup.py
	find . -name "*.py" | xargs grep -l sys.executable | xargs sed -i 's|sys\.executable|"/usr/bin/python2"|g'
	python2 setup.py build
}

package(){
	cd "${srcdir}/${_pkgname}"
	python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
