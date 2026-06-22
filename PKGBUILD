# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# GPG key: https://github.com/matwey.gpg

pkgname=python-pybeam
pkgver=0.8.1
pkgrel=2
pkgdesc="Python module to parse Erlang BEAM files"
arch=(any)
url="https://github.com/matwey/pybeam"
license=(MIT)
depends=(python-construct)
makedepends=(git python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=$pkgver?signed")
sha256sums=('2c5a40b05fe9bf646d0e7bf16482340e25b23f42aa92f4220e0ddeaf00b619ae')
validpgpkeys=(C9F3EDEBC08B81E7B914ACCDA26A952FDBCCA5B5)

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname"
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	test-env/bin/python -P -m pytest -x
}

package() {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$site_packages/pybeam-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ft=sh ts=4 sw=4 noet:
