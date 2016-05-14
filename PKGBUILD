# Maintainer: Bastian Löher <b.loeher@gsi.de>
pkgname=opengate
pkgver=7.2
pkgrel=1
pkgdesc="Open GATE - numerical simulations in medical imaging and radiotherapy"
arch=('x86_64')
url="https://github.com/OpenGATE/Gate"
license=('LGPL3')
groups=()
makedepends=('cmake'
	'root'
	'geant4'
	'gcc')
depends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs' 'staticlibs' 'libtool' '!strip')
install=
changelog=
source=("https://github.com/OpenGATE/Gate/archive/v${pkgver}.tar.gz"
	"root6.patch")
noextract=()
md5sums=('6b15b179ccc79065a4aef63156b3e5de'
         'c5eeef3f30223d5eeda7438b4306dad7')

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
		-DGATE_USE_OPTICAL=ON \
		-DGATE_USE_STDC11=ON \
		../Gate-${pkgver}
	patch -Np0 root6.patch
:
}

build() {
	cd ${srcdir}/build
	make -j$(nproc)
}

package() {
	cd ${srcdir}/build
	make DESTDIR="${pkgdir}/" install
}
