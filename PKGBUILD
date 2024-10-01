# Maintainer: a821
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-binary
_pkg="${pkgname#python-}"
pkgver=1.0.0
pkgrel=7
pkgdesc="Easily convert between binary and SI units"
arch=('any')
url="https://github.com/ofek/binary"
license=('MIT' 'Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-coverage')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz"
       '001-setup.py.patch')
sha256sums=('6ec010e58f7331ebc8bc9638dbe6c66d635de60d5818b0723bef4dead0ec28a6'
            'f2cd5dc99ca22d9a2fc8a20c2fd7f1f77922338c22085a73a7737ea08dfc955f')

prepare() {
	## removes tests directory from installation
	patch -p1 -d "$_pkg-$pkgver" < 001-setup.py.patch
	sed -i 's/\\ //' "$_pkg-$pkgver/binary/core.py"
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
