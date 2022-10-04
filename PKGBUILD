# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-smda
_pkg="${pkgname#python-}"
pkgver=1.9.15
pkgrel=1
pkgdesc="Recursive diassembler optimized for CFG recovery from memory dumps"
arch=('any')
url="https://github.com/danielplohmann/smda"
license=('BSD')
depends=('python-capstone' 'python-lief')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/$_pkg/$_pkg-$pkgver.tar.gz"
        'remove-datafiles.patch')
sha256sums=('ad3161a40e07bbdfdbffcbc0314bba2acf3ab9e56a14f2ac6465d73f7f201915'
            'b23093d15ee671d4b22caae61d80647181530de1d062d639f2a7cf747135d2c9')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < remove-datafiles.patch
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
	ln -s "$_site/smda-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
