# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=python-soundcard
_pkg=SoundCard
pkgver=0.4.5
pkgrel=1
pkgdesc='Play and record audio without resorting to CPython extensions'
arch=('any')
url='https://github.com/bastibe/soundcard'
license=('BSD')
depends=('pulse-native-provider' 'python-cffi' 'python-numpy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
#source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('e9dc860187689e67620d8f0320842f634d6bd755b2972d71fdc1fb5c67c91398')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
