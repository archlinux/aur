# Maintainer: Bastian Löher <b.loeher@gsi.de>
# Note: This repository contains code fragments and patches from the fairroot
# fairsoft group (https://github.com/FairRootGroup/FairSoft)
pkgname=geant3
pkgver_mid=2
pkgver_low=1
pkgver=${pkgver_mid}.${pkgver_low}
gittag=v${pkgver_mid}-${pkgver_low}
pkgrel=1
pkgdesc="Monte Carlo GEometry ANd Tracking Version 3"
arch=('x86_64')
url="https://root.cern.ch/download-vmc"
license=('GPL')
groups=()
makedepends=('gcc-fortran')
depends=('root')
provides=()
conflicts=()
replaces=()
backup=()
options=('emptydirs' 'strip' 'staticlibs' 'libtool')
install=
changelog=
source=("${pkgname}::git+http://root.cern.ch/git/${pkgname}.git#tag=${gittag}"
	'gcalor.F.gz'
	'gdalet.F.gz'
	'gdalitzcbm.F.gz'
	'gdecay.F.gz'
	'geant3_geane.patch'
	'geant3_root6.patch'
	'geant3_structs.patch'
	'Geant3_CMake.patch'
)
noextract=()
md5sums=('SKIP'
         '1d424f336f14f7b956b4ff88b6609ad6'
         '780850d26765e43733e1f1451bd24d16'
         '79441f41a967cb484e1470777067caa7'
         'd22549981df7d18a015f9913602eeb72'
         'f0df4447afd26fba12213732f1a3784f'
         '856d3a197ddf34d1d9e1a3b64fdb3bf1'
         'a88e74f73ebc85c51256fba99d7551cd'
         'c7dec3af4c0b3cd1d1522f99be432525')

# Do not compress the package for installation
# PKGEXT='.pkg.tar'
# Compress using lightweight gzip
PKGEXT='.pkg.tar.gz'

prepare() {
	cd "${pkgname}"
	cp ../gdecay.F gphys
	cp ../gdalet.F gphys
	cp ../gdalitzcbm.F gphys
	mkdir -p gcalor
	cp ../gcalor.F gcalor
	rm added/dummies_gcalor.c
	patch -p0 -i ../geant3_geane.patch
	patch -p0 -i ../Geant3_CMake.patch
	patch -p0 -i ../geant3_structs.patch
	patch -p0 -i ../geant3_root6.patch
}

build() {
	cd "${pkgname}"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
	      -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="--std=c++14 -O2 -g -DNDEBUG" \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DROOT_DIR=/usr \
	      ..

	make
}

package() {
	cd "${pkgname}/build"
	mkdir -p /usr/include/
	make install
}
