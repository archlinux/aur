# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Dino Krtanjek <krtanjekdino@gmail.com>

pkgname=python-iniparse
pkgver=0.4
pkgrel=2
pkgdesc="Better INI parser library for Python"
arch=('any')
license=('custom:MIT')
url="https://pypi.python.org/pypi/iniparse"
depends=('python' 'python-six')
checkdepends=('python-tests')
source=("https://pypi.python.org/packages/source/i/iniparse/iniparse-$pkgver.tar.gz"
        "http://src.fedoraproject.org/rpms/$pkgname/raw/master/f/$pkgname-python3-compat.patch")
md5sums=('5e573e9e9733d97623881ce9bbe5eca6'
         'e0eaf5cc93b73983aab71be56613ae7b')

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
