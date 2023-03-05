# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>
pkgname=dektec-utilities
pkgver=23.3.5
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
_dtplay=4.16.0
_dtrecord=4.13.0
_dtinfocl=1.5.2
_sdk=2022.12.1
source=("https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdk}.tar.gz"
	"https://www.dektec.com/products/applications/DtEpc/downloads/DtEpc-${_dtepc}.zip"
	"https://www.dektec.com/products/applications/DtInfoCL/downloads/DtInfoCL_v${_dtinfocl}.zip"
	"https://www.dektec.com/products/applications/DtPlay/downloads/DtPlay_v${_dtplay}.zip"
	"https://www.dektec.com/products/applications/DtRecord/downloads/DtRecord_v${_dtrecord}.zip")
noextract=("DtPlay_v${_dtplay}.zip" "DtRecord_v${_dtrecord}.zip")
sha256sums=('6dbe78f504d7b579a809f8720d8ecc305637b98c9454f89ea4e4c7f60429d1ac'
            '4fbbfe09d55b3528a6a45bc6a2effce3ba0431d7ac141bf190423accc7c4a435'
            'd93fd5372e3ae09942a6d21c363f3eb4c527d2ae631a103df81487942dbdfbce'
            '94f01c935e16e2abb626515f6ef6433d302850efb180bb0699d5deb767b7e00b'
            '12a383160743672d8b90a97a10356b701f931d0c99daad2d1066a2eb425d22ad')

prepare() {
	cd "${srcdir}"
	unzip -o "DtEpc_Linux_v${_dtepc}.zip" 	-d Linux/
	unzip -o "DtPlay_v${_dtplay}.zip" 	-d dtplay/
	unzip -o "DtRecord_v${_dtrecord}.zip" 	-d dtrecord/
	mkdir -p "dtplay/Import/DTAPI" "dtrecord/Import/DTAPI"
	# include DTAPI (SDK) for DtPlay
	cp -f LinuxSDK/DTAPI/Include/DTAPI.h dtplay/Import/DTAPI/
	cp -f LinuxSDK/DTAPI/Lib/GCC5.1_CXX11_ABI1/* dtplay/Import/DTAPI/
	# include DTAPI (SDK) for DtRecord
	cp -f LinuxSDK/DTAPI/Include/DTAPI.h dtrecord/Import/DTAPI/
	cp -f LinuxSDK/DTAPI/Lib/GCC5.1_CXX11_ABI1/* dtrecord/Import/DTAPI/
}

build() {
	# compile DtPlay
	cd "${srcdir}/dtplay"
	make
	cp -f DtPlay ${srcdir}/Linux/
	# compile DtRecord
	cd "${srcdir}/dtrecord"
	make
	cp -f DtRecord ${srcdir}/Linux/
}

package() {
	install -Dm755 ${srcdir}/Linux/DtEpc64 		${pkgdir}/usr/bin/DtEpc
	install -Dm755 ${srcdir}/Linux/DtInfoCL64 	${pkgdir}/usr/bin/DtInfoCL
	install -Dm755 ${srcdir}/Linux/DtPlay 		${pkgdir}/usr/bin/DtPlay
	install -Dm755 ${srcdir}/Linux/DtRecord 	${pkgdir}/usr/bin/DtRecord
}
