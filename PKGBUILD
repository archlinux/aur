# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
pkgname=dict-gcide
_major_debver=0.48
_debver=${_major_debver}.5
pkgver=0.52
pkgrel=2
pkgdesc="GNU version of the Collaborative International Dictionary of English for dictd et al."
arch=('any')
url="http://gcide.gnu.org.ua/"
license=('GPL3')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'sed')
provides=('dictd-gcide')
conflicts=('dictd-gcide')
install=${pkgname}.install
source=('fixes.sed'
        'post_webfilter.sed'
				'check.sed'
        "http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${_debver}.tar.xz"
        "ftp://ftp.gnu.org/gnu/gcide/gcide-${pkgver}.tar.xz"{,.sig})
sha512sums=('6fc2caf86d96ac9a14f2676ca4455afe987f37933c03ac672b27cf2de7a4fc893457c97c7fa17dc280debfb4e1a3ab4adc5f7c68ee445605dc3c22665d32a445'
            'e7c6766b51ef92c4d8669394b6a71f8c4d7249ac63a1eb940f0a3017cb5ff6841f0f4bce7a60ffbcf180801d92b068db6ca46afd1dceac06a9c37c59dcddbfb3'
						'1304bdce3776355fcd7827cebbf670ae34377bda78b04bf271ba10a25d92e33f6ec69644e168c30a6ec47808ebacc461de47d9494a5a2a5894d58c21be045973'
            'a10d46947c7d8b7050c44a12cfb38ed374e971063805e69897652cd8993dc5cf0ecc4d9a12680a8ced30d110d20bc84def75bd587166aa2cfa78529b9397aafe'
            '260e4e7bb30ac857255b9a1f696b18b77bbae06574bb0f0cc35b38be7399bf497d3c561ab0d4a4b7e8fc3127c6bf72efde8e1d4a28fa428f82178d0972f704b3'
						'SKIP')
validpgpkeys=('325F650C4C2B6AD58807327A3602B07F55D0C732')

prepare()
{
	sed -Ei \
		"s/\"(The Collaborative International Dictionary of English) v.${_major_debver}\"/\"\\1 v.${pkgver}\"/" \
		"${pkgname}-${_debver}/scan.l"
}

build()
{
	cd ${pkgname}-${_debver}

	CPPFLAGS="-D_FORTIFY_SOURCE=0" ./configure --with-local-libmaa
	make -j1

	# Do the conversion explicitly, instead of `make db', to account for all
	# the differences to the original build process.
	# LANG=C is required so that the index file is properly sorted.
	../fixes.sed ../gcide-${pkgver}/CIDE.? \
		| sed -f debian/sedfile \
		| ./webfilter \
		| ../post_webfilter.sed \
		| tee pre_webfmt.data \
		| LANG=C ./webfmt -c

	dictzip -v gcide.dict
}

check()
{
	errors="$(./check.sed < ${pkgname}-${_debver}/pre_webfmt.data)"

	if test -n "$errors"
	then
		echo "Errors found:"
		echo "$errors"
		return 1
	fi
}

package()
{
	install -m 0755 -d "${pkgdir}/usr/share/dictd"
	install -m 0644 -t "${pkgdir}/usr/share/dictd/" \
		${pkgname}-${_debver}/gcide.{dict.dz,index}

	install -m 0755 -d "${pkgdir}/usr/share/doc/dict-gcide"
	install -m 0644 -t "${pkgdir}/usr/share/doc/dict-gcide/" \
		gcide-${pkgver}/{README,INFO}
}
