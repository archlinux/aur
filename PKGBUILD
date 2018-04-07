# Maintainer: Allen M. <ase1590@hotmail.com>

pkgname=wxpython-phoenix-git
pkgver=r3413.f04d103b
pkgrel=3
pkgdesc="Python 3 implementation of the WxPython UI library"
arch=('x86_64' 'i686')
url="https://github.com/wxWidgets/Phoenix"
license=('custom:wxWindows')
depends=('python')
makedepends=('mesa' 'glu' 'git' 'libpng' 'libjpeg-turbo' 'libtiff' 'sdl' 'gst-plugins-base' 'libnotify' 'freeglut' 'gtk3' 'webkit2gtk' 'python-requests')
source=("$pkgname::git+${url}"
		"git+https://github.com/wxWidgets/wxWidgets.git")
md5sums=('SKIP' 'SKIP')
provides=('wxpython-phoenix')
conflicts=('wxpython-phoenix-bin' 'python-wxpython')

pkgver() {
	cd "$srcdir/$pkgname"
	printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.ext/wxWidgets.url "$srcdir/wxWidgets"
	git submodule update
}

build(){
	cd "$srcdir/$pkgname"
	python build.py clean
	python build.py dox etg --nodoc sip build --gtk3
}

package(){
	cd "$srcdir/$pkgname"
	python setup.py install --skip-build --root="$pkgdir/"
	cd "$pkgdir/usr/bin/"
	for file in *
	do
		mv "$file" "${file%}-phoenix"
	done
	cd "$srcdir/$pkgname/ext/wxWidgets/docs"
	install -D -m644 licence.txt $pkgdir/usr/share/licenses/wxpython-phoenix/license.txt
}
