# Maintainer: Bastian Löher <b.loeher@gsi.de>
pkgname=opengate
pkgver=9.3
pkgrel=1
pkgdesc="Open GATE - numerical simulations in medical imaging and radiotherapy"
arch=('x86_64')
url="https://github.com/OpenGATE/Gate"
license=('LGPL3')
groups=()
makedepends=('cmake' 'gcc')
depends=('root' 'geant4')
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs' 'staticlibs' 'libtool' '!strip')
install=
changelog=
source=("https://github.com/OpenGATE/Gate/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('e3e507776d9347e0903e8721ec03cd03')

# Do not compress the package for installation
# PKGEXT='.pkg.tar'
# Compress using lightweight gzip
PKGEXT='.pkg.tar.gz'

prepare() {
	# Execute cmake
	echo "You need to build geant4 with option"
	echo " -DGEANT4_BUILD_MULTITHREADED=OFF"
	echo "to properly use Gate. It does not yet"
	echo "work with Geant4 in multithreaded mode."
	cd ${srcdir}

	[ -d build ] || mkdir build
	cd build
	cmake \
		-DGATE_USE_ECAT7=OFF \
		-DGATE_USE_GPU=OFF \
		-DGATE_USE_ITK=OFF \
		-DGATE_USE_LMF=OFF \
		-DGATE_USE_OPTICAL=ON \
		-DGATE_USE_RTK=OFF \
		-DGATE_USE_STDC11=ON \
		-DGATE_USE_DAVIS=OFF \
		-DGEANT4_USE_SYSTEM_CLHEP=OFF \
		../Gate-${pkgver}
:
}

build() {
	cd ${srcdir}/build
	make -j$(nproc)
}

package() {
	cd ${srcdir}/build
	make DESTDIR="${pkgdir}/" install

	echo "Optional dependencies: lmf_v3.0 and ecat7"
	echo "Done"
}
