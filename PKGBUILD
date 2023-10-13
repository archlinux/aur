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
    _ccores=`cat /proc/cpuinfo |grep CPU|wc -l`
  	if [ "x$1" != "x" ]; then
		_ccores=$1
  	fi
	make -j ${_ccores}
}

package() {
	cd $srcdir/${pkgname}/build 
	make DESTDIR="$pkgdir/" install
	pip install --break-system-packages ../
	cp -r $srcdir/${pkgname} $pkgdir/opt/openmc
	cp set_paths.sh $pkgdir/opt/openmc

	# installed to opt, inform user how to set paths
	_path_msg="$'\n'INFO: OpenMC and its dependencies were installed to the 
			   non-standard location /opt. Run bash 
			   ~/opt/openmc/set_paths.sh before attempting to
			   use openmc$'\n'"
}
