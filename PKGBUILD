#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Michal Malek <michalm@jabster.pl>

pkgname=fontmatrix
pkgver=0.6.0
pkgrel=5
pkgdesc="Font manager for Linux"
arch=('i686' 'x86_64')
url="http://fontmatrix.be"
license=('GPL')
depends=('qtwebkit' 'qt4' 'harfbuzz' 'icu')
makedepends=('mesa' 'cmake') 
source=($url/archives/$pkgname-$pkgver-Source.tar.gz
	*.patch)
prepare(){
	cd "${srcdir}/${pkgname}-${pkgver}-Source"

	patch -Np0 -i ${srcdir}/fmactivateCPP.patch
	patch -Np0 -i ${srcdir}/fmactivateH.patch
	patch -Np0 -i ${srcdir}/typotek.patch
	patch -Np0 -i ${srcdir}/fontmatrix.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}-Source"

		export QTDIR=/usr
		export QMAKESPEC=/usr/share/qt4/mkspecs/linux-g++-
	[[ ${CARCH} = x86_64 ]] && QMAKESPEC+=64 || QMAKESPEC+=32

	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DCMAKE_BUILD_TYPE=Debug -DWANT_ICU:bool=true -DWANT_HARFBUZZ:bool=true 
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}-Source/build"
		make DESTDIR="${pkgdir}" install
}

sha512sums=('20c91a17b27b1131017f3d5a264250b560b46cfa1d6939171811def530939d8e072f02c818a58e40604506a6520a30d20c27b234655329d8a16ce489e69bcf00'
            'cdc41672fb338cb9ba5077cbcae9163a870e12c1d65266f115f04563f37d04fb8caa14ca2b4e977b6cb9603d4106cceef84c91a16cc32728c9ffa107acd546f2'
            'c4bff7918a7c43ca537dc902732a5d7e084a4d0b217c14d181a3251d386f292bf41042efd77d8a384e820d11e34d60130ce0536fe62ad36ae5241603079823c2'
            '0b7cc215f6496792464ef3e948990cdb7314734656202b054993b7c4040400bf20a905d0a67c0cfc2797c0a5faeb3b03cf45bd3b8e869dcbadcc06d1f7bf7b87'
            'f218b291d3b209491f906731618752614fbe4e997242050c071e10e9201b8cb4cd0458c8a1be794140e5130da5b5f2e8d47d6bffc547c4847ddf9ef682302039')
