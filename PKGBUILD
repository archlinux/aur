# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Maintainer: Nick Winovich <nw2190@gmail.com>
# Maintainer: Georg S. Voelker <voelker@maibox.org>
# Based on dolfin-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com> and submitted by myles

_base=dolfin
pkgname=${_base}
pkgdesc="The C++ interface of FEniCS, providing a consistent PSE (Problem Solving Environment) for ordinary and partial differential equations (stable)."
pkgver=2019.1.0.post0
pkgrel=4
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('LGPL3')
groups=('fenics')
conflicts=('dolfin-git')
depends=('boost' 'cppunit' 'eigen' 'gl2ps' 'petsc'
         'python-ffc=2019.1.0' 'suitesparse')
optdepends=('scotch: libraries for graph, mesh and hypergraph partitioning'
            'slepc: eigenvalue problem solvers'
            'hdf5<=1.12.0-1: for reading/writing hdf5 files')
makedepends=('cmake')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/fenics-project/${_base}/downloads/${_base}-${pkgver}.tar.gz min_element.patch hdf5.patch endian.patch)
sha256sums=('61abdcdb13684ba2a3ba4afb7ea6c7907aa0896a46439d3af7e8848483d4392f'
            '80cdfc689854cc4cada1a2bdbde298a27f4456ac1495dceeac030b5a9b02b27e'
            '2e718c5586228fa2031da4b95ef9bb54266fed4c15e195ef47470fddb3a99c36'
            '19dc90d5fa8139ed3311a1df89f74093478dd578833a898e901860349da45284')

export MAKEFLAGS="-j1"

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/min_element.patch"
    patch --forward --strip=0 --input="${srcdir}/hdf5.patch"
    patch --forward --strip=1 --input="${srcdir}/endian.patch"
}

build() {
    _build_dir="${srcdir}"/build

	local py_interp=`python -c "import os,sys; print(os.path.realpath(sys.executable))"`

	[ -n "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh
	[ -n "$SLEPC_DIR" ] && source /etc/profile.d/slepc.sh

	cmake -S "${srcdir}"/"${_base}"-"${pkgver}" \
          -B "${_build_dir}" \
		  -DCMAKE_INSTALL_PREFIX="${pkg}"/usr \
          -DCMAKE_INSTALL_LIBDIR=lib \
		  -DPYTHON_EXECUTABLE="${py_interp}" \
		  -DCMAKE_SKIP_BUILD_RPATH=TRUE \
		  -DCMAKE_SKIP_RPATH=TRUE \
		  -DCMAKE_BUILD_TYPE="Release"

    cd "${_build_dir}"
	make

    # Build documentation
    # See Doxyfile
}

package() {
	cd ${srcdir}/${_base}-${pkgver}/build
	make install DESTDIR="${pkgdir}"
}
