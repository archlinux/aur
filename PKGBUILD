# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: LinRs <LinRs@users.noreply.github.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-pyfr
pkgver=1.12.2
_commit=fb710d27b9627a27d4b3946246548414a9d18e4a
pkgrel=1
pkgdesc="Framework for solving advection-diffusion type problems on streaming architectures"
arch=('x86_64')
url='https://github.com/pyfr/pyfr'
license=('BSD')
depends=(
	'python>=3.8'
	'python-appdirs>=1.4.0'
	'python-gimmik>=2.0'
	'python-h5py-openmpi>=2.6'
	'python-numpy>=1.20'
	'python-pytools>=2016.2.1'
	'python-mako>=1.0.0'
	'python-mpi4py>=3.0')
optdepends=(
	'metis>=5.0: needed for running PyFR in parallel'
	'scotch>=6.0: needed for running PyFR in parallel'
	'python-pymic: needed for Xeon Phi MIC backend'
	'python-pycuda>=2015.1: needed for CUDA backend'
	'cuda>=4.2: needed for CUDA backend'
	'python-pyopencl: needed for OpenCL backend'
	'clblas: needed for OpenCL backend'
	'cblas: needed for OpenMP backend'
	'openblas: alternative blas for OpenMP backend'
	'cgns>=3.3: for importing CGNS meshes')
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+$url#commit=$_commit?signed"
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
	python setup.py build
	## FIXME: sphinxcontrib-contentui and sphinxcontrib-fancybox are not in the AUR
	# cd doc
	# make man
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
