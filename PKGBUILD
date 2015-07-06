# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=pyqso
_authorname=ctjacobs
pkgver=0.2
pkgrel=1
pkgdesc="Ham Radio QSO logging tool."
arch=('any')
url="http://christianjacobs.uk/pyqso/"
license=('GPL3')
depends=('gtk3' 'sqlite3' 'python2-gobject' 'desktop-file-utils')
makedepends=(
#'python-sphinx'	# for building docs
)
optdepends=('hamlibs: rig control'
	    'hamradio-menus: XDG compliant menuing'
	    'python2-numpy: Greyline Toolkit'
	    'python2-mpltools-git: Greyline Tools')
install=$pkgname.install
source=(https://github.com/${_authorname}/$pkgname/archive/v${pkgver}.tar.gz
	diff.setup.py
	$pkgname.desktop
)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	patch -p0 < ../diff.setup.py
	sed -i 's:icons:share\/pyqso\/icons:g' bin/pyqso

	# python2 fix
	for file in $(find . -name '*.py' -print); do
		sed -i -e "s|^#!.*/usr/bin/python|#!/usr/bin/python2|" \
		-e "s|^#!.*/usr/bin/env *python|#!/usr/bin/env python2|" ${file}
	done
}

build () {
	cd "$srcdir/$pkgname-$pkgver"

#	make docs
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python2 setup.py install --root="$pkgdir/" --optimize=1

	install -Dm644 icons/log_14x14.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

#	mkdir -p $pkgdir/usr/share/$pkgname/docs/html/{_images,_modules/pyqso,_sources,_static}
#	cp -a docs/build/html/* $pkgdir/usr/share/$pkgname/docs/html/.
}
md5sums=('a46cddc39517123a62d2d6224869f42c'
         '30e60f23bc1b853c3936febd1a77668e'
         'db5223623f0a745b15798e18c1f5fc0d')
sha256sums=('94c08ada94ab69a882c2af7725d7a67f4c02f9de8f7dc54fc473f11699e91d89'
            'f8dd5bd66a23b106ce04091a721c3eb8c81a2c8efc9873dbdfa856d69a54145f'
            'b724c3782338cd546f78719137802384364522e398fb6c5a633442d25a2afb17')
