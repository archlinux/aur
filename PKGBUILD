# Maintainer: Gavin Ridley <gavin dot keith dot ridley at gmail dot com>
# Maintainer: Luke Labrie-Cleary <luke dot cleary at copenhagenatomics dot com>
pkgname=openmc-git
pkgver=v0.13.3.r314.g7fe80e149
pkgrel=1
pkgdesc="The OpenMC project aims to provide a fully-featured Monte Carlo particle 
		 transport code based on modern methods."
arch=('x86_64')
url="https://github.com/openmc-dev/openmc"
license=('MIT')
install="post.install"

source=("${pkgname}::git+${url}.git" "set_paths.sh" "openmc.sh")
pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
md5sums=('SKIP' 'SKIP')

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
    hdf5
)
makedepends=(
    cmake
    git
    python
    python-numpy
    python-setuptools
)

provides=("${pkgname%-pkgver}")

build() {
    cd $srcdir/${pkgname}
    mkdir build && cd build
    cmake .. -DOPENMC_USE_DAGMC=ON \
             -DDAGMC_ROOT=/opt/DAGMC \
             -DOPENMC_USE_MPI=ON \
             -DHDF5_PREFER_PARALLEL=ON \
	     -DCMAKE_INSTALL_PREFIX=/opt/openmc	 
    _ccores=`cat /proc/cpuinfo |grep CPU|wc -l`
  	if [ "x$1" != "x" ]; then
		_ccores=$1
  	fi
	make -j ${_ccores}
}

package() {
	cd $srcdir/${pkgname}/build 
	make DESTDIR="$pkgdir/" install
	cp -r $srcdir/${pkgname} $pkgdir/opt/openmc
	cp $srcdir/set_paths.sh $pkgdir/opt/openmc
	cp $srcdir/openmc.sh $pkgdir/opt/openmc
}