# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: LinRs <LinRs@users.noreply.github.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-pyfr
pkgver=1.15.0
_commit=d2a401a
pkgrel=1
pkgdesc="Framework for solving advection-diffusion type problems on streaming architectures"
arch=('any')
url='https://github.com/pyfr/pyfr'
license=('BSD')
depends=(
	'python>=3.9'
	'python-appdirs'
	'python-gimmik'
	'python-h5py-openmpi'
	'python-numpy'
	'python-pytools'
	'python-mako'
	'python-mpi4py'
	'python-setuptools')
optdepends=(
	'metis: needed for running PyFR in parallel'
	'scotch: needed for running PyFR in parallel'
	'python-pymic: needed for Xeon Phi MIC backend'
	'python-pycuda: needed for CUDA backend'
	'cuda: needed for CUDA backend'
	'python-pyopencl: needed for OpenCL backend'
	'clblas: needed for OpenCL backend'
	'cblas: needed for OpenMP backend'
	'openblas: alternative blas for OpenMP backend'
	'cgns: for importing CGNS meshes')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname::git+$url#commit=${_commit}?signed"
        '001-remove-tests.patch')
sha256sums=('SKIP'
            '97d817a571eed6f659b9970acf45edd3c9d12d8370d0fe3d998f10cec710b10b')
validpgpkeys=('AEEA6F51A3521732B684C1049E70614148A0FA1F')

PURGE_TARGETS=(usr/__main__.py)

prepare() {
	patch -p1 -d "$pkgname" < 001-remove-tests.patch
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
	## FIXME: sphinxcontrib-contentui and sphinxcontrib-fancybox are not in the AUR
	# cd doc
	# make man
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/pyfr-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
