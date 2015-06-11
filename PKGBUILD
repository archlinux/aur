# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Dino Krtanjek <krtanjekdino@gmail.com>

pkgname=python-iniparse
pkgver=0.4
pkgrel=1
pkgdesc="Better INI parser library for Python"
arch=('any')
license=('MIT')
url="http://code.google.com/p/iniparse"
depends=('python' 'python-six')
source=("http://iniparse.googlecode.com/files/iniparse-$pkgver.tar.gz"
        "http://pkgs.fedoraproject.org/cgit/$pkgname.git/plain/$pkgname-python3-compat.patch")
sha1sums=('2b2af8a19f3e5c212c27d7c524cd748fa0b38650'
          '670a6a70633b297a9586679b7da8312fe9720698')

prepare() {
	cd "iniparse-$pkgver"
	patch -p0 < "$srcdir/"$pkgname-python3-compat.patch

	# Avoid conflict with doc files from python2-iniparse
	sed -e "s|share/doc/iniparse-|share/doc/$pkgname-|" \
	    -i setup.py
}

build() {
	cd "iniparse-$pkgver"
	python ./setup.py build
}

check() {
	cd "iniparse-$pkgver"
	python runtests.py
}

package() {
	cd "iniparse-$pkgver"
	python ./setup.py install --root="$pkgdir/" --optimize=1

	install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
	mv "$pkgdir/usr/share/doc/$pkgname-$pkgver/"LICENSE* \
	   "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: set ft=sh ts=4 sw=4 noet:
