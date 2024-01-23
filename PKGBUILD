# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=srsly
pkgname=python-${_pkgname}
pkgver=2.4.8
pkgrel=2
pkgdesc='Modern high-performance serialization utilities for Python'
arch=(x86_64 aarch64)
url='https://github.com/explosion/srsly'
license=(MIT)
depends=(
	cython
	python-catalogue
	python-pytest
	python-pytest-timeout
	python-pytz
	python-mock
	python-numpy
)
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('f4f028118cc437fd84e4ed45e0c0279032c9be21b8fba9836df37c19f78572d23920bcaefed42e5d77ab68b38589bcb16c9a834d43b9cd5fbbe6702c32b5f6ff')

prepare() {
	cd "${_pkgname}-${pkgver}"
	sed -i 's/ctypedef unsigned long long uint64_t/from libc.stdint cimport uint64_t/' srsly/msgpack/_unpacker.pyx
	sed -i 's/,<0.30.0//' setup.cfg
	sed -i 's/,<0.30.0//' pyproject.toml
	sed -i 's/,<0.30.0//' requirements.txt
}

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
