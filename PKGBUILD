# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-transip
_pkg="${pkgname#python-}"
pkgver=0.6.0
pkgrel=2
pkgdesc='Wrapper for the TransIP API'
arch=('any')
url="https://github.com/roaldnefs/python-transip"
license=('LGPL3' 'GPL3')
depends=('python-cryptography' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-responses')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('d9fd984db4eda4f91b99083c21ad6e00c718c734ad200a53d113fe680c871fe0')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i '/find_packages/s/()/(exclude=["*tests*"])/' setup.py
}

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname-$pkgver"
	pytest -x tests --disable-warnings
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/${pkgname/-/_}-$pkgver.dist-info/COPYING.LESSER" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-LGPL3"
	ln -sv "$_site/${pkgname/-/_}-$pkgver.dist-info/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPL3"
}
