# Maintainer: Bastian Löher <b.loeher@gsi.de>
pkgname=fairroot
pkgver=17.03
fairsoftver=mar17-1
pkgrel=8
pkgdesc="Analysis framework based on root provided by GSI/FAIR."
arch=('x86_64')
url="http://fairroot.gsi.de"
license=('LGPL3')
groups=()
makedepends=('cmake'
	'clang'
	'bison'
	'flex'
	'gcc-fortran'
	'subversion'
	'git'
	'curl')
depends=(
	'fairsoft'
	)
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs' 'staticlibs' 'libtool' '!strip')
install=fairroot.install
changelog=
source=("https://github.com/FairRootGroup/FairRoot/archive/v-${pkgver}.tar.gz"
	'fairroot.install'
	)
noextract=()
md5sums=('77ab94317667c2d4339da992d9389e61'
         'd2d2d7b11b308120382fba7e32c5268a')

# Do not compress the package for installation
# PKGEXT='.pkg.tar'
# Compress using lightweight gzip
PKGEXT='.pkg.tar.gz'

prepare() {
	# Path to fairsoft installation
	export SIMPATH=/opt/fairsoft/${fairsoftver}

	cd ${srcdir}/FairRoot-v-${pkgver}

	# Execute cmake
	cd ${srcdir}
	[ -d build ] || mkdir build
	cd build
	sed -i "s/std=c++11/std=c++1y/" ../FairRoot-v-17.03/CMakeLists.txt
	sed -i "s/std=c++11/std=c++1y/" ../FairRoot-v-17.03/cmake/checks/CMakeLists.txt
	sed -i "s/std=c++11/std=c++1y/" ../FairRoot-v-17.03/cmake/modules/CheckCXX11Features.cmake
	cmake \
		-DUSE_DIFFERENT_COMPILER=TRUE \
		-DCMAKE_INSTALL_PREFIX="/opt/fairroot/v-${pkgver}" \
		-DROOT_DIR=${SIMPATH} \
		../FairRoot-v-${pkgver}
:
}

build() {
	# Path to fairsoft installation
	export SIMPATH=/opt/fairsoft/${fairsoftver}
	cd ${srcdir}/build
	# Make c++14 mandatory
	make -j$(nproc)
}

package() {
	cd ${srcdir}/build
	make DESTDIR="${pkgdir}/" install
}
