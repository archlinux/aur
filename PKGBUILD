# Maintainer: Bastian Löher <b.loeher@gsi.de>
pkgname=opengate-git
pkgver=v9.3.59.ge73015dd
pkgrel=1
pkgdesc="Open GATE - numerical simulations in medical imaging and radiotherapy"
arch=('x86_64')
url="https://github.com/OpenGATE/Gate"
license=('LGPL3')
groups=()
makedepends=('cmake' 'gcc')
depends=('root' 'geant4' 'cern-vdt')
provides=('opengate')
conflicts=('opengate')
replaces=()
backup=()
options=('!emptydirs' 'staticlibs' 'libtool' '!strip')
install=
changelog=
source=(git+https://github.com/OpenGATE/Gate.git#commit=e73015dd67beae9921e931687e0bf9f4e192746b)
noextract=()
md5sums=('SKIP')

# Do not compress the package for installation
# PKGEXT='.pkg.tar'
# Compress using lightweight gzip
PKGEXT='.pkg.tar.gz'

pkgver() {
    cd Gate
    git describe --tags --long | sed 's|Release-||;s|[_-]|.|g'
}

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
		../Gate
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
