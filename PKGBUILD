# Maintainer: Gavin Ridley <gavin dot keith dot ridley at gmail dot com>
# Maintainer: Luke Labrie-Cleary <luke dot cleary at copenhagenatomics dot com>
pkgname=openmc-git
pkgver=v0.14.0.r5.g9830efaf2
pkgrel=1
pkgdesc="The OpenMC project aims to provide a fully-featured Monte Carlo particle 
		 transport code based on modern methods."
arch=('x86_64')
url="https://github.com/openmc-dev/openmc"
license=('MIT')
install="post.install"

source=("${pkgname}::git+${url}.git" "openmc.sh")
pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
md5sums=('SKIP' 'c1afc88f84acf577a0d4fd9fb73a3412')

depends=(
	python-lxml
	python-scipy
	python-pandas
	python-matplotlib
	python-uncertainties
	python-h5py-openmpi
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
    _ccores=$(nproc)
    if [ -z "${_ccores}" ]; then
       make
    else
       make -j ${_ccores}
    fi

    # build python layer
    python -m build --wheel --no-isolation ../
}

package() {
	cd $srcdir/${pkgname}/build 
	make DESTDIR="$pkgdir/" install
	python -m installer --destdir="$pkgdir" ../dist/*.whl

	# make repository available in install location
	cp -r $srcdir/${pkgname} $pkgdir/opt/openmc

	# make non-standard paths persist
	mkdir -p $pkgdir/etc/profile.d
	cp $srcdir/openmc.sh $pkgdir/etc/profile.d
	chmod 755 $pkgdir/etc/profile.d/openmc.sh
}
