# Maintainer: Gavin Ridley <gavin dot keith dot ridley at gmail dot com>
# Maintainer: Luke Labrie-Cleary <luke dot cleary at copenhagenatomics dot com>
pkgname=openmc-git
pkgver=v0.13.2.r497.g6218becb1
pkgrel=1
pkgdesc="The OpenMC project aims to provide a fully-featured Monte Carlo particle 
		 transport code based on modern methods."
arch=('x86_64')
url="https://github.com/openmc-dev/openmc"
license=('MIT')

source=("${pkgname}::git+${url}.git")
pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
md5sums=('SKIP')

depends=(
	python-lxml
	python-scipy
	python-pandas
	python-matplotlib
	python-uncertainties
	embree
	libxrender 
	libxcursor 
	libxft 
	libxinerama 
	freecad 
	glu
	openssh
	dagmc-git
	nuclear-data
	python-cad_to_openmc
)
makedepends=(
    cmake
    git
    python
    python-numpy
    python-setuptools
)

provides=("${pkgname%-pkgver}")
conflicts=(
	openmc-git
	)

build() {
    cd $srcdir/${pkgname}
    mkdir build && cd build
    cmake .. -DOPENMC_USE_DAGMC=ON \
             -DDAGMC_ROOT=/opt/DAGMC \
             -DOPENMC_USE_MPI=ON \
             -DHDF5_PREFER_PARALLEL=ON \
	     -DCMAKE_INSTALL_PREFIX=/opt/openmc
    make
}

package() {
	cd $srcdir/${pkgname}/build 
	make DESTDIR="$pkgdir/" install
	pip install ../
}
