# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=python-simpleeval
_name=${pkgname#python-}
pkgver=0.9.12
pkgrel=1
pkgdesc="A simple, safe single expression evaluator library."
arch=(any)
url="https://github.com/danthedeckie/simpleeval"
license=(MIT)
depends=(
	python
)
makedepends=(
	python-setuptools
)
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/danthedeckie/simpleeval/${pkgver}/LICENCE"
)
sha256sums=('3e0be507486d4e21cf9d08847c7e57dd61a1603950399985f7c5a0be7fd33e36'
            '91efc982fa45add893fa80ec3ab1524f31e50a1386adba1424ddcf432359850a')

prepare() {
	cd "${_name}-${pkgver}"
	# don't try to install missing dependencies, error instead
	cat >> setup.cfg <<EOF
[easy_install]
find_links = file:///dev/null
index_url = file:///dev/null
EOF
    cat >> setup.py <<EOF
from setuptools import setup
setup()
EOF
}

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 "${srcdir}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
