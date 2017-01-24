# Maintainer: Allen M. <ase1590@hotmail.com>

pkgname=wxpython-phoenix-git
pkgver=r2752.g8304ec1b
pkgrel=1
pkgdesc="Python 3 implementation of the WxPython UI library"
arch=('x86_64' 'i686')
url="https://github.com/wxWidgets/Phoenix"
license=('custom:wxWindows')
depends=('python' 'wxgtk')
makedepends=('mesa' 'glu' 'git' 'libpng' 'libjpeg-turbo' 'webkitgtk2' 'libtiff' 'sdl' 'gst-plugins-base' 'libnotify' 'freeglut' 'gtk2')
source=("$pkgname::git+${url}"
		"git+https://github.com/wxWidgets/wxWidgets.git")
md5sums=('SKIP' 'SKIP')
provides=('wxpython-phoenix')
conflicts=('wxpython-phoenix-bin')

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
	python build.py dox etg --nodoc sip
}

package(){
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/"
	cd "$pkgdir/usr/bin/"
	for file in *
	do
		mv "$file" "${file%}-phoenix"
	done
	cd "$srcdir/$pkgname/ext/wxWidgets/docs"
	install -D -m644 licence.txt $pkgdir/usr/share/licenses/wxpython-phoenix/license.txt
}
