# Maintainer: Adrián Pérez de Castro <adrian@perezdecastro.org>
pkgdesc='Portable MSX/MSX2/MSX2+ emulator'
pkgname=fmsx
pkgver=5.7
pkgrel=1
_dlname="fMSX${pkgver//./}"
url=http://fms.komkon.org/fMSX
license=(custom)
arch=(i686 x86_64)
depends=(libxext bash zlib pulseaudio)
makedepends=(sed)
source=(fmsx.sh
        "${url}/${_dlname}.zip"
        "${url}/src/CMOS.ROM"
        "${url}/src/MSX.ROM"
        "${url}/src/MSX2.ROM"
        "${url}/src/MSX2EXT.ROM"
        "${url}/src/MSX2P.ROM"
        "${url}/src/MSX2PEXT.ROM"
        "${url}/src/FMPAC.ROM"
        "${url}/src/DISK.ROM"
        "${url}/src/MSXDOS2.ROM"
        "${url}/src/PAINTER.ROM"
        "${url}/src/KANJI.ROM"
        "https://github.com/libretro/fmsx-libretro/raw/master/fMSX/ROMs/RS232.ROM")
sha512sums=('1c7b7485525e5798cde0fa4e82153f294ce88c358d4c0366a6266f837b2b3e5ce8540b0f5daf1d67b11e1afcf82912df8379e3a0cbe93854f0d86cb7d54d7d36'
            'e836fffe9692cc8d17716d78c97d558efc7eab2c8bc07dcf91426582b43bee08065689c02c085bad2b25b1184ac7eae04d643d9c78740e463ef3eb88fe7ca656'
            '617bee88a0088c25928e4b906bf7acc8ffa1847e3f7dc006117f579ad3c760e33a43d30f5b9b41ada20689c8f2f65ce5bd95a3de9662153d3deb615bff13163b'
            'f8a447906272f69cd545ed439623845cacee4ee98b8ed3fae264a26e35ef006b125b51a2c4e54e8371d53cffe730dac720b2a8d0eccdad0c3c7befdc31864f6c'
            'dc95ef9c17a28319d815780cae359b8a88b3edd5c5d582a16a916e256eb90d79b02f3240b91d2048e9d750239051473f924b807ae2583a65695fb1e18e317a54'
            'c270ee701b19a92c769c9334ff4e843492e7596ee09818b39062f3fcf96da547afe0fc83866493080113fbda20dde08589e3f7aa2ad73bae451b911c773f6850'
            'f50ec41aea4c31b82cde3b342a3c3d741ab37fd82bbe2e8f59af94bb26aee8bc925e410cad855cca60048cc82ac3edd3e790861b2f883344e615ee910b1dd18e'
            '9a4c0759705bac6fa2dbded841fb72b9b8b5dc86fcebe8b6d08e324251515fe2fa148492a584fd30359749f249065fa0a1e8bcdeea38791f8bf5c9128af643a7'
            'ebe3b67c6beddf20a06c4214b03ecc97ed760b67ae21b612b6f44e79bb8dfd7bba8e7035ea89ea5aeef587ebfd4cf2937436abe7b25f1e3c8e3b7cbae246f337'
            'b25e803a355f5bb0958efe1b01d489dbf4d64d9e3dc2a8d144cc937ae194eff7883b4d2225908f4c7e4aa177d276f82ef42cb0fb4adaee58c6186fb6383e7d73'
            'a4bbde8dc0e7d99d93a4fbbeca7dee933fdcb0b355909a593e2b41c7715991464382e76685ed542f8a5725d7ab59e491e3e73c0c5ee6b09f892c1131c73d039f'
            'c0aff91898b0f825e7e499bdb4fa58d5a34acfb96d81a2789b86b77f2acbdadcf9dd9427fd35edef85c2efdfd3d572c10eb3674495b288b315386e8d819f3a9e'
            '5eefeacefbee2a55de5a2c2b020d52f2fe389a3b18a07bc399faa0a2aab6c07959d365e08b67945a3ae29c46b1f69566a91b392a7bde1db18298de259688a373'
            '502c64f0dd0ab7f6213281eeeb222be1471f6aebc6da558d28d06a831064cab4e810175e19796e26e8f1da1e84c93593cc4ffdb8eaae75708408aadb54940744')

prepare () {
    cd "${srcdir}"
    sed -e '1,/\*\*\*\*\//p' -e d fMSX/Menu.c > COPYING

	# Include a snippet from the top-level Makefile, which is used to
	# configure optional features later on in build().
	echo "include ${srcdir}/config.mk" >> fMSX/Unix/Makefile
}

build () {
	cd "${srcdir}"
	cat > config.mk <<-EOF
	CFLAGS += ${CFLAGS} -fcommon
	LIBS += ${LDFLAGS} -fcommon
	EOF
	make -C fMSX/Unix
}

package () {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/lib/fmsx"
	install -m 755 fMSX/Unix/fmsx "${pkgdir}/usr/lib/fmsx"
	install -m 644 "${srcdir}"/*.ROM fMSX/Unix/CARTS.SHA "${pkgdir}/usr/lib/fmsx"
	mkdir -p "${pkgdir}/usr/bin"
	install -m 755 "${startdir}/fmsx.sh" "${pkgdir}/usr/bin/fmsx"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
