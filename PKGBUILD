# Maintainer: Dringsim <dringsim@qq.com>

pkgname=clips-lib
_pkgname=clips
pkgver=6.41
_pkgver=6.4.1
pkgrel=1
pkgdesc="A forward-chaining rule-based programming language written in C that also provides procedural and object-oriented programming facilities (with headers and libclips.so)"
arch=('x86_64')
url="https://www.clipsrules.net/"
license=('GPL')
depends=('termcap' 'libxaw' 'xbitmaps')
provides=('clips')
conflicts=('clips')
source=("https://downloads.sourceforge.net/project/clipsrules/CLIPS/${_pkgver}/${_pkgname}_core_source_${pkgver//.}.tar.gz"
		"https://downloads.sourceforge.net/project/clipsrules/CLIPS/${_pkgver}/${_pkgname}_documentation_${pkgver//.}.tar.gz"
		"https://downloads.sourceforge.net/project/clipsrules/CLIPS/${_pkgver}/${_pkgname}_examples_${pkgver//.}.tar.gz"
        "https://downloads.sourceforge.net/project/clipsrules/CLIPS/${_pkgver}/${_pkgname}_feature_tests_${pkgver//.}.tar.gz"
		"makefile.patch")
sha256sums=('AA4F3BB8B15964BF4734F365C9587E32996BDDD3F50BFCF53B95154BEAE76EE3'
            '367ED086ADBCD805CF31AB3FC8A8CE7E5B92D022F1DA5D49EB86011B402A7C68'
            'BBA83B6E38F671D4112C859F3007535B100610236E2DA26412798BBEF65A62FA'
            '4AF5B8835B1881FAF72C28C4D57252974077D6AA290598EB8E541A4F17D550FF'
			'6E08E30FA96AF3D87F9E20768AA3E045A87EF9784F8E2A845FB6D8D849CE0A72')

build() {
	cd "${_pkgname}_core_source_${pkgver//.}/core"
	patch --forward --strip=1 --input="${srcdir}/makefile.patch"
	make
}

package() {
	install -Dm755 ${_pkgname}_core_source_${pkgver//.}/core/clips ${pkgdir}/usr/bin/clips
	install -Dm644 ${_pkgname}_core_source_${pkgver//.}/core/*.h -t ${pkgdir}/usr/include/${_pkgname}
	# ln -sf /usr/include/${_pkgname}/clips.h ${pkgdir}/usr/include/clips.h
	install -Dm644 ${_pkgname}_core_source_${pkgver//.}/core/libclips.so ${pkgdir}/usr/lib/libclips.so.${pkgver}
	ln -sf /usr/lib/libclips.so.${pkgver} ${pkgdir}/usr/lib/libclips.so.6
	ln -sf /usr/lib/libclips.so.${pkgver} ${pkgdir}/usr/lib/libclips.so
	install -d "${pkgdir}/usr/share/${_pkgname}"
	install -d "${pkgdir}/usr/share/doc/${_pkgname}/pdf"
	cp ${_pkgname}_documentation_${pkgver//.}/*.pdf ${pkgdir}/usr/share/doc/${_pkgname}/pdf/
	cp -a ${_pkgname}_examples_${pkgver//.} ${pkgdir}/usr/share/${_pkgname}/examples
	cp -a ${_pkgname}_feature_tests_${pkgver//.} ${pkgdir}/usr/share/${_pkgname}/feature_tests
}
