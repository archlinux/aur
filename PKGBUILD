# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=python-executor-python37
_name=executor
pkgver=20.0
pkgrel=1
pkgdesc="Programmer friendly subprocess wrapper"
arch=(any)
url="https://github.com/xolox/python-executor"
license=(MIT)
depends=(
	python
	python-coloredlogs
	python-fasteners
	python-humanfriendly
	python-property-manager
	python-six
)
makedepends=(
	python-setuptools
)
conflicts=(
	python-executor
)
provides=(
	python-executor
)
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
	async.patch
)
sha256sums=(
	454e586bad943b0c12f6b1492a405bc5bd3f22a7fe258bbb67f3898d6a3873b9
	edb6587fd8eca1d04b9bb5ff0a21e1429dabc32fb67bece42d9b0819434351c2
)

prepare() {
	cd "${_name}-${pkgver}"

	# don't try to install missing dependencies, error instead
	cat >> setup.cfg <<EOF
[easy_install]
find_links = file:///dev/null
index_url = file:///dev/null
EOF

	patch -p1 < ../async.patch
}

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
