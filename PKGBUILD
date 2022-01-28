# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jacob Alexander <haata at kiibohd com>

pkgname=('germinate' 'python-germinate')
pkgver=2.38
pkgrel=1
pkgdesc='Expands dependencies in a list of seed packages'
arch=('any')
url="https://tracker.debian.org/pkg/germinate"
license=('GPL')
makedepends=('python-setuptools' 'python-apt')
source=("$pkgname-$pkgver.tar.xz::https://deb.debian.org/debian/pool/main/g/$pkgname/${pkgname}_$pkgver.tar.xz")
sha256sums=('e998ba09fb90fddc6816b37931377906e013ef0b80a47766aba651e43180e800')

prepare() {
	cd work
	sed -i \
		-e '/packages=/c\packages=find_packages(exclude=["*tests*"]),' \
		setup.py
}

build() {
	cd work
	python setup.py build
}

package_germinate() {
	depends=('perl')

	cd work
	install -Dm644 debhelper/germinate.pm -t "$pkgdir/usr/share/perl5/vendor_perl/Debhelper/Sequence/"
}

package_python-germinate() {
	depends+=('germinate' 'python-apt' 'python-six')

	export PYTHONHASHSEED=0
	cd work
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

