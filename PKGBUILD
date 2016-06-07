# Maintainer: Bastian Löher <b.loeher@gsi.de>
pkgname=fairroot
pkgver=15.11d
fairsoftver=nov15p6-1
pkgrel=1
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
	'fix_return.patch'
	)
noextract=()
md5sums=('a5e2cc964e653ef086e9614b7b014e82'
         'd2d2d7b11b308120382fba7e32c5268a'
         '7eecd47253b1f005d4da59ddcfa28eed')

# Do not compress the package for installation
# PKGEXT='.pkg.tar'
# Compress using lightweight gzip
PKGEXT='.pkg.tar.gz'

prepare() {
	# Path to fairsoft installation
	export SIMPATH=/opt/fairsoft/${fairsoftver}

	cd ${srcdir}
	patch -Np0 -i ${startdir}/fix_return.patch

	cd ${srcdir}/FairRoot-v-${pkgver}

	# Execute cmake
	cd ${srcdir}
	[ -d build ] || mkdir build
	cd build
	cmake \
		-DUSE_DIFFERENT_COMPILER=TRUE \
		-DCMAKE_INSTALL_PREFIX="/opt/fairroot/v-${pkgver}" \
		../FairRoot-v-${pkgver}
:
}

build() {
	# Path to fairsoft installation
	export SIMPATH=/opt/fairsoft/${fairsoftver}
	cd ${srcdir}/build
	make -j$(nproc)
}

package() {
	cd ${srcdir}/build
	make DESTDIR="${pkgdir}/" install
}
