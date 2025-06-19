# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jacob Alexander <haata at kiibohd com>

pkgname=('germinate' 'python-germinate')
pkgver=2.47
pkgrel=1
pkgdesc='Expand dependencies in a list of seed packages'
arch=('any')
url="https://tracker.debian.org/pkg/germinate"
license=('GPL')
makedepends=('python-setuptools' 'python-apt')
source=("$pkgname-$pkgver.tar.xz::https://deb.debian.org/debian/pool/main/g/$pkgname/${pkgname}_$pkgver.tar.xz")
sha256sums=('979b24b2a7b8f338690e1eb2a569b4786d5e83e2922d2980a82eafbd8bc8fb29')

prepare() {
	cd germinate-$pkgver
	sed -i \
		-e '/packages=/c\packages=find_packages(exclude=["*tests*"]),' \
		setup.py
}

build() {
	cd germinate-$pkgver
	python setup.py build
}

package_germinate() {
	depends=('perl')

	cd germinate-$pkgver
	install -Dm644 debhelper/germinate.pm -t "$pkgdir/usr/share/perl5/vendor_perl/Debhelper/Sequence/"
}

package_python-germinate() {
	pkgdesc+='(Python 3 interface)'
	depends+=('germinate' 'python-apt')

	export PYTHONHASHSEED=0
	cd germinate-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

