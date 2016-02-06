# Maintainer: Dusan Saiko <dusan.saiko ..at.. gmail ..dot.. com>
pkgname=toga2
pkgver=3.0
pkgrel=3
pkgdesc="Toga II: Fruit chess engine derivative (including opening book and egbb)"
arch=('i686' 'x86_64')
url="http://chessprogramming.wikispaces.com/Toga"
license=('GPL' 'BSD')
depends=('gcc-libs')
makedepends=('unzip')

#info: egbb-3.0.zip has approximatelly 220 MB
source=(
    "${pkgname}-${pkgver}.zip::http://www.computerchess.info/tdbb/phpBB3/download/file.php?id=1402"
    "egbbdll.zip::http://sites.google.com/site/dshawul/egbbdll_new.zip?attredirects=0"
    "http://cl.ly/3x333m0G173F/download/stockfish-231-book.zip"
    "http://www.hijex.com/abs/toga2/egbb-3.0.zip" #mirrored from: "http://www.olympuschess.com/bitbases/egbb-3.0.zip"
    "toga2.patch"
    "egbbdll.patch"
    "license-toga2.txt"
    "license-scorpio-bitbases.txt"
    "license-stockfish.txt"
)

md5sums=('24656863a79e2765ec7ec778bbee3005'
         '5e0865f7690a666feb3d7a8c24dce4f5'
         '9e51c2e57d8b55bbc588150033e4b133'
         '7356d517f428a0fc85f58058248494ea'
         'fe4ecbe4edba72ae2ea439bfb75cf94a'
         'c17842d6f1359f7737a7b6133ce34510'
         '393a5ca445f6965873eca0259a17f833'
         '627ba1a024f0ba7ad8c990dee1c33353'
         '3c34afdc3adf82d2448f12715a255122')


#would extract source files into root, will be unzipped later on into subfolder
noextract=("egbbdll.zip")

prepare() {
	cd "${srcdir}"
	#RENAME EXTRACTED FOLDER
	mv toga-30-ja-release "${pkgname}-${pkgver}"
	cd "${pkgname}-${pkgver}"
	#APPLY PATCH
	patch -s -p0 < "${srcdir}/toga2.patch"
	
	#UNZIP EGBBDLL INTO SUBDIRECTORY
	cd "${srcdir}"
	unzip egbbdll.zip -d egbbdll
	#PATCH EGBBDLL
	patch -s -p0 < "${srcdir}/egbbdll.patch"
}

build() {
	#GET ARCHITECTURE
	if [[ "${CARCH}" == "i686" ]];
	then
	    _arch=x86-32
	elif grep popcnt /proc/cpuinfo 2>&1
	then
	    _arch=x86-64-modern
	else
	    _arch=x86-64
	fi

	#BUILD TOGA2
	cd "${srcdir}/${pkgname}-${pkgver}/src"
	make ARCH=$_arch
	
	#BUILD EGBBDLL
	cd "${srcdir}/egbbdll"
	make ARCH=$_arch
}

package()
{
	install -D 	-m755 "${srcdir}/${pkgname}-${pkgver}/src/toga2"	"${pkgdir}/usr/bin/toga2"
	install -D 	-m755 "${srcdir}/egbbdll/egbbso.so"					"${pkgdir}/usr/share/toga2/egbb/egbbso.so"
	install -D 	-m644 Book.bin										"${pkgdir}/usr/share/toga2/performance.bin"
	install -D 	-m644 "${srcdir}/license-toga2.txt"					"${pkgdir}/usr/share/licenses/toga2/license-toga2.txt"
	install -D 	-m644 "${srcdir}/license-scorpio-bitbases.txt"		"${pkgdir}/usr/share/licenses/toga2/license-scorpio-bitbases.txt"
	install -D 	-m644 "${srcdir}/license-stockfish.txt"				"${pkgdir}/usr/share/licenses/toga2/license-stockfish.txt"
	
	cd "${srcdir}/egbb"
	install 	-m644 * 											"${pkgdir}/usr/share/toga2/egbb/"
}
