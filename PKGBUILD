# Maintainer: doublesack <doublesackI@gmail.com>
pkgname=('python-osqp')
_module='osqp-python'
pkgver=v0.7.9
pkgrel=2
pkgdesc="Python interface for OSQP (Operator Splitting QP Solver)"
url="http://github.com/oxfordcontrol/osqp-python"
depends=(
    'python-numpy'
    'python-scipy'
    'python-qdldl'
    ) 
makedepends=('python-setuptools-scm'
	     'python-oldest-supported-numpy'
	     'python-wheel'
	     'python-build'
	     'python-installer'
	     'python-pytest'
	     'cmake')
provides=('python-osqp')
conflicts=('python-osqp-git')
license=('Apache')
arch=('x86_64')
source=("git://github.com/oxfordcontrol/osqp-python.git#tag=${pkgver}"
	"git://github.com/oxfordcontrol/osqp.git"
	"git://github.com/oxfordcontrol/qdldl.git"
	"bindings.patch"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '005c08e6843ae9df1e32399aa79844097641045e468ad260f99e41064841c676')


prepare() {
	cd osqp-python
	git submodule init
	git config submodule.osqp.url ${srcdir}/osqp

	cd ../osqp/
	git config submodule.qdldl.url ${srcdir}/qdldl

	cd ../osqp-python/
	git submodule update --init --recursive
	patch --forward --strip=1 --input="${srcdir}/bindings.patch"
}
#pkgver() {
  #cd osqp-python
  #git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}
build() {
    cd osqp-python
    python -m build --wheel --no-isolation
}

package() {
    cd osqp-python
    python -m installer --destdir="$pkgdir" dist/*.whl
}

#check() {
#	cd osqp-python
#	python -m pytest --pyargs osqp.tests
#}
