# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

_base=dolfin
_fragment="#branch=master"
pkgname=python-${_base}-git
pkgdesc="the Python interface of FEniCS, providing a consistent PSE (Problem Solving Environment) for ordinary and partial differential equations."
pkgver=20171221
pkgrel=1
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics-git')
depends=('dolfin-git' 'python-instant-git' 'python-pkgconfig' 'python-ply' 'swig')
optdepends=('python-mpi4py: MPI library for python'
						'petsc4py: interface with PETSc from python'
						'slepc4py: interface with SLEPc from python'
						'python-matplotlib: plotting support')
makedepends=('git')
options=(!emptydirs)
source=("${_base}::git+https://bitbucket.org/fenics-project/${_base}.git${_fragment}")
md5sums=('SKIP')

export MAKEFLAGS="-j1"

pkgver() {
	cd ${_base}
	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
	[ -z "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh
	[ -z "$SLEPC_DIR" ] && source /etc/profile.d/slepc.sh

	cd ${_base}/python
	python setup.py build
}

package() {
	cd ${_base}/python
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
