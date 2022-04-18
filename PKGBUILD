# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)

pkgname=python-hopcroftkarp
_pkg=hopcroftkarp
pkgver=1.2.5
pkgrel=1
pkgdesc="Implementation of Hopcroftkarp's algorithm"
arch=('any')
url="https://github.com/sofiatolaosebikan/hopcroftkarp"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/h/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('28a7887db81ad995ccd36a1b5164a4c542b16d2781e8c49334dc9d141968c0e7')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i "/packages=/s/()/(exclude=['*test*'])/" setup.py
	sed -i '/from HopcroftKarp/s/HopcroftKarp/hopcroftkarp/' test/test_hopcroftkarp.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD" python -m unittest test/test_hopcroftkarp.py
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
