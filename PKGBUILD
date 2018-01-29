# Maintainer: Einhard Leichtfuß <archer@respiranto.de>
# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
pkgname=dict-gcide
_debver=0.48.4
pkgver=0.52
pkgrel=1
pkgdesc="GNU version of the Collaborative International Dictionary of English for dictd et al."
arch=('any')
url="http://gcide.gnu.org.ua/"
license=('GPL' 'GPL3')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'sed')
provides=('dictd-gcide')
conflicts=('dictd-gcide')
install=${pkgname}.install
source=('fixes.sed'
        "http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${_debver}.tar.xz"
        "ftp://ftp.gnu.org/gnu/gcide/gcide-${pkgver}.tar.xz"{,.sig})
sha512sums=('3adc1c75e9f96883966236131518b4b8f4c6c588759112417ec46c35d421da87ddd1bac156fa0bf55c64f939cbe1efd235d0854b4dfe8cfa1278917d6fef07f5'
            '82939f8c9e2bb30368b673784abaf85724a04fb9ebab382b6908034e0978d4d47039b7667573b88fe074bb29ea232b9e11129ac30ba6e88d5b9271df3b2ad302'
            '260e4e7bb30ac857255b9a1f696b18b77bbae06574bb0f0cc35b38be7399bf497d3c561ab0d4a4b7e8fc3127c6bf72efde8e1d4a28fa428f82178d0972f704b3'
						'SKIP')
validpgpkeys=('325F650C4C2B6AD58807327A3602B07F55D0C732')

prepare() {
	ln -s "${srcdir}/fixes.sed" "${pkgname}-${_debver}/"
	sed -i 's`\(\./webfilter\) | \(\./webfmt -c\)`\1 | sed -Ef fixes.sed | \2`' "${pkgname}-${_debver}/Makefile.in"

	rm -rf "${pkgname}-${_debver}/cide"
	ln -s "${srcdir}/gcide-${pkgver}" "${pkgname}-${_debver}/cide"
	cd "${pkgname}-${_debver}/cide"
	for file in CIDE.?
	do
		mv "$file" "${file,,}"
	done
	mv tagset.{txt,web}
	mv webfont.{txt,asc}
	mv README{,.dic}
}

build() {
	cd "${pkgname}-${_debver}"
	export CPPFLAGS="-D_FORTIFY_SOURCE=0"
	./configure --with-local-libmaa --prefix=/usr
	make -j1
	mkdir "../final_data"
	make dictdir="../final_data" install
	# Fix wrong order.
	LANG=C sort --dictionary-order --ignore-case \
		-o ../final_data/gcide.index{,}
}

package()
{
	install -m 0755 -d "${pkgdir}/usr/share/dictd"
	install -m 0644 -t "${pkgdir}/usr/share/dictd/" \
		final_data/gcide.{dict.dz,index}
	install -m 0755 -d "${pkgdir}/usr/share/doc/dict-gcide"
	install -m 0644 -t "${pkgdir}/usr/share/doc/dict-gcide/" \
		"${pkgname}-${_debver}/cide/"{README.dic,INFO}
}
