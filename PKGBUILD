# Maintainer: Fantix King <fantix.king@gmail.com>
pkgname=python-edgedb
pkgver=1.6.0
pkgrel=2
pkgdesc="EdgeDB Python driver"
arch=('x86_64')
url="https://github.com/edgedb/edgedb-python"
license=('Apache')
depends=('python>=3.7')
makedepends=('python-build' 'python-installer' 'python-setuptools>=42' 'python-wheel' 'cython0')
_pgproto="1720f8af63725d79454884cfa787202a50eb5430"
source=("https://github.com/edgedb/edgedb-python/archive/refs/tags/v${pkgver}.zip"
	"https://github.com/MagicStack/py-pgproto/archive/${_pgproto}.zip")
sha256sums=('73bd261a5a042f6d5e75480e0c7ca4a84810ff633575f181257e36d9fae3b4d2'
            '365c610cdcea2b064f9dc445e0f3a1b0d19db94a680d89ef868768878c97ecf2')
prepare() {
	cd "edgedb-python-$pkgver"
	rmdir "edgedb/pgproto/"
	ln -s "$srcdir/py-pgproto-$_pgproto" "edgedb/pgproto"
}

build() {
	cd "edgedb-python-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "edgedb-python-$pkgver"
}

package() {
	local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

	cd "edgedb-python-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	rm -frv "$pkgdir/$_site_packages/tests"
}
