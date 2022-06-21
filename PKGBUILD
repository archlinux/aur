# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)

pkgname=python-ripser
_pkg="${pkgname#python-}"
pkgver=0.6.1
pkgrel=1
pkgdesc="Homology Library for Python"
arch=('x86_64')
url="https://github.com/scikit-tda/ripser.py"
license=('MIT')
depends=('python-numpy' 'python-scipy' 'python-scikit-learn' 'python-persim')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/r/$_pkg/$_pkg-$pkgver.tar.gz"
        'setup.py.patch'
        'header.patch')
sha256sums=('335112a0f94532ccbe686db7826ee8d0714b32f65891abf92c0a02f3cb0fc5fd'
            '5d6538cf07d897cfead808048682266bcf2a9199f2ddda9becd4919221612195'
            'cd5b619ce29859d26890e9256f3e883c463c1196c3e9a172b7de264584990a4a')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < header.patch
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
