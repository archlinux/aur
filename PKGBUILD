# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=('libceed' 'python-ceed')
pkgver=0.10.0
pkgrel=1
pkgdesc="Performance Visualization for Parallel Program"
arch=('x86_64')
license=('BSD')
url='https://github.com/ceed/libceed'
makedepends=(
	'gcc-fortran'
	'python-cffi'
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7bff5d54110e4dd0abab2cb08b1429573541512e2e4000847b0660a81fa65831')

build() {
	cd "libCEED-$pkgver"
	make
	python -m build --wheel --no-isolation
}

check() {
	cd "libCEED-$pkgver"
	make test
}

package_libceed() {
	depends=('glibc')
	provides=('libceed.so')

	cd "libCEED-$pkgver"
	make DESTDIR="$pkgdir" prefix=/usr install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-ceed() {
	depends=('libceed' 'python-cffi' 'python-numpy')

	cd "libCEED-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/libceed-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
