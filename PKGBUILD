# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=lalsuite-git
pkgver=r56231.42fcf346d4
pkgrel=5
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite."
arch=('any')
url="https://wiki.ligo.org/DASWG/LALSuite"
license=('unknown')
groups=()
depends=('python2' 'python2-numpy' 'gsl' 'fftw' 'hdf5' 'libxml2' 'swig' 'libframe' 'metaio')
makedepends=('git')
checkdepends=('python2-h5py' 'python2-healpy-git' 'healpix' 'python2-shapely' 'python2-lscsoft-glue-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('lalsuite::git+https://github.com/lscsoft/lalsuite.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    sed -i '/^#!.*python/ s/python/python2/' $(grep -ril '^#!.*python' $PWD)
    export PYTHON=/usr/bin/python2
    export CHEALPIX=/usr/lib/libchealpix.so
    #export CFITSIO=/usr/lib/libcfitsio.so
	./00boot
    ./configure --prefix=${pkgdir}/usr CFLAGS='-O3 -Wno-error'
	make -j
}

#check() {
#	cd "$srcdir/${pkgname%-git}"
#	make -k check
#}

package() {
	cd "$srcdir/${pkgname%-git}"
	make install
}
