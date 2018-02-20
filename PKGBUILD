# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Based on python-instant-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=mshr
pkgname=python-${_base}
pkgdesc="Mesh generation component of FEniCS (stable)."
pkgver=2017.2.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics')
conflicts=('python-mshr-git')
depends=('dolfin' 'mpfr')
makedepends=('git')
options=(!emptydirs)
source=("${_base}::git+https://bitbucket.org/fenics-project/${_base}.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
	cd ${_base}
	[ -d build ] && rm -rf build
	mkdir build
	cd build

	local py_interp=`python -c "import os,sys; print(os.path.realpath(sys.executable))"`

	cmake .. \
		-DCMAKE_INSTALL_PREFIX="${pkg}"/usr \
		-DPYTHON_EXECUTABLE="${py_interp}" \
		-DCMAKE_SKIP_BUILD_RPATH=TRUE \
		-DCMAKE_SKIP_RPATH=TRUE \
		-DCMAKE_BUILD_TYPE="Release"

	make
}

package() {
	cd ${_base}/build
	make install DESTDIR="${pkgdir}"
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
