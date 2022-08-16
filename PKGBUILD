# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)

pkgname=python-ripser
_pkg="${pkgname#python-}"
pkgver=0.6.4
pkgrel=1
pkgdesc="Homology Library for Python"
arch=('x86_64')
url="https://github.com/scikit-tda/ripser.py"
license=('MIT')
depends=('python-numpy' 'python-scipy' 'python-scikit-learn' 'python-persim')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/r/$_pkg/$_pkg-$pkgver.tar.gz"
        'setup.py.patch')
sha256sums=('7a9b3e9420869c50df85e9a446c912b8af81621e62ca1af8f9492c6335b7e594'
            '5d6538cf07d897cfead808048682266bcf2a9199f2ddda9becd4919221612195')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < setup.py.patch
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
