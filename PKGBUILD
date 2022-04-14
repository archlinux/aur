# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-smda
pkgver=1.7.1
pkgrel=1
pkgdesc="Recursive diassembler optimized for CFG recovery from memory dumps"
arch=('any')
url="https://github.com/danielplohmann/smda"
license=('BSD')
depends=('python-capstone' 'python-lief')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/smda/smda-$pkgver.tar.gz"
        'remove-datafiles.patch')
sha256sums=('594ce990e5304064050be89dc9b5b547444c7861be279e2682f7d844e9719658'
            'b23093d15ee671d4b22caae61d80647181530de1d062d639f2a7cf747135d2c9')

prepare() {
	patch -p1 -d "smda-$pkgver" < remove-datafiles.patch
}

build() {
	cd "smda-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "smda-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/smda-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
