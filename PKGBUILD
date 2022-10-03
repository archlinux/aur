# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-mopidy-tidal
_pkg=Mopidy-Tidal
pkgver=0.3.1
pkgrel=1
pkgdesc='Tidal music service integration'
arch=('any')
url=https://github.com/tehkillerbee/mopidy-tidal
license=('Apache')
depends=('mopidy' 'python-pykka' 'python-tidalapi' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/M/$_pkg/$_pkg-$pkgver.tar.gz"
        "fix-playlists.patch::$url/commit/38bbd10.diff")
sha256sums=('0d378a51281c755e5d32705f11f91d4b52e473151519962ba4ef3ce8257d811b'
            '06156878a318e6df59ca2471247f2fbac59e8b5919a22f04602647c51fe54cd9')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < fix-playlists.patch
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

## tests currently fail
check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
