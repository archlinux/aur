# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jacob Alexander <haata at kiibohd com>

pkgname=('germinate' 'python-germinate')
pkgver=2.46
pkgrel=1
pkgdesc='Expands dependencies in a list of seed packages'
arch=('any')
url="https://tracker.debian.org/pkg/germinate"
license=('GPL')
makedepends=('python-setuptools' 'python-apt')
source=("$pkgname-$pkgver.tar.xz::https://deb.debian.org/debian/pool/main/g/$pkgname/${pkgname}_$pkgver.tar.xz")
sha256sums=('688eec9a2a0dac10557e375b611879a310eb37394084021ccca01079603293f3')

prepare() {
	cd germinate-2.46
	sed -i \
		-e '/packages=/c\packages=find_packages(exclude=["*tests*"]),' \
		setup.py
}

build() {
	cd germinate-2.46
	python setup.py build
}

package_germinate() {
	depends=('perl')

	cd germinate-2.46
	install -Dm644 debhelper/germinate.pm -t "$pkgdir/usr/share/perl5/vendor_perl/Debhelper/Sequence/"
}

package_python-germinate() {
	depends+=('germinate' 'python-apt' 'python-six')

	export PYTHONHASHSEED=0
	cd germinate-2.46
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

