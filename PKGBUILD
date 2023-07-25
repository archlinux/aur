# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=dektec-utilities
pkgver=23.7.25
pkgrel=1
pkgdesc="DekTec utilities DtEpc, DtPlay, DtRecord and DtInfoCL"
arch=('x86_64')
url="https://www.dektec.com/downloads/utilities/"
license=('unknown')
depends=()
makedepends=('unzip')
provides=('dektec-utilities')
conflicts=('dektec-utilities')
_dtepc=2.13.1
_dtplay=4.17.0
_dtrecord=4.14.0
_dtinfocl=1.5.2
_sdk=2023.06.0
source=(
	"https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdk}.tar.gz"
	"https://www.dektec.com/products/applications/DtEpc/downloads/DtEpc-${_dtepc}.zip"
	"https://www.dektec.com/products/applications/DtInfoCL/downloads/DtInfoCL_v${_dtinfocl}.zip"
	"https://www.dektec.com/products/applications/DtPlay/downloads/DtPlay_v${_dtplay}.zip"
	"https://www.dektec.com/products/applications/DtRecord/downloads/DtRecord_v${_dtrecord}.zip"
	)
noextract=("DtPlay_v${_dtplay}.zip" "DtRecord_v${_dtrecord}.zip")
sha256sums=('a69a9c7cb7962768bd0a81c943df78f20e1184e56dd0a029cc1b9486844edd3b'
            '4fbbfe09d55b3528a6a45bc6a2effce3ba0431d7ac141bf190423accc7c4a435'
            'd93fd5372e3ae09942a6d21c363f3eb4c527d2ae631a103df81487942dbdfbce'
            '86a5372637dbe8e5a01a876e944f7548b4e62ad75885f933fcdf8714a8752dc1'
            'c33f4fa33c718e4a40f8d758d8cb9f293565b169f6820b5d970ab1f2b3609360')

prepare() {
	cd "${srcdir}"
	unzip -o "DtEpc_Linux_v${_dtepc}.zip" 	-d Linux/
	unzip -o "DtPlay_v${_dtplay}.zip" 	-d dtplay/
	unzip -o "DtRecord_v${_dtrecord}.zip" 	-d dtrecord/
	mkdir -p "dtplay/Import/DTAPI" "dtrecord/Import/DTAPI"
	# include DTAPI (SDK) for DtPlay
	cp LinuxSDK/DTAPI/Include/DTAPI.h dtplay/Import/DTAPI/
	cp LinuxSDK/DTAPI/Lib/GCC7.5.0/* dtplay/Import/DTAPI/
	# include DTAPI (SDK) for DtRecord
	cp LinuxSDK/DTAPI/Include/DTAPI.h dtrecord/Import/DTAPI/
	cp LinuxSDK/DTAPI/Lib/GCC7.5.0/* dtrecord/Import/DTAPI/
}

build() {
	# compile DtPlay
	cd "${srcdir}/dtplay"
	make
	cp DtPlay ${srcdir}/Linux/
	# compile DtRecord
	cd "${srcdir}/dtrecord"
	make
	cp DtRecord ${srcdir}/Linux/
}

package() {
	install -Dvm755 ${srcdir}/Linux/DtEpc64 	${pkgdir}/usr/bin/DtEpc
	install -Dvm755 ${srcdir}/Linux/DtInfoCL64 	${pkgdir}/usr/bin/DtInfoCL
	install -Dvm755 ${srcdir}/Linux/DtPlay 		${pkgdir}/usr/bin/DtPlay
	install -Dvm755 ${srcdir}/Linux/DtRecord 	${pkgdir}/usr/bin/DtRecord
}
