# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>

# README:
#  * Building this package takes very long (a day or so) and consumes quite a
#    lot of RAM (> 4 GiB).
#    * Consider to use the corresponding -bin package instead.

_lang=deu-eng
pkgname=dict-freedict-${_lang}
_dingver=1.8.1
_pkgver=${_dingver}-fd0.2.1
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="German -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="https://freedict.org/"
license=('GPL' 'AGPL3')
optdepends=('dictd: dict client and server')
makedepends=('freedict-tools-svn>=1:r440')
install=${pkgname}.install
source=("https://ftp.tu-chemnitz.de/pub/Local/urz/ding/old-releases/ding-${_dingver}.tar.gz")
sha512sums=('7d1b459d40e26482c3c16a79565cb897a492fa5807f44c5c3ed1022bcf65ba90bec9cb503cc67970742c2beeb34bd653c684e56ef5492f536254bf475d3f70a4')


prepare()
{
	mkdir "$_lang"

	printf '%s\n\n%s\n' \
		'DISTFILES = deu-eng.tei' \
		'include $(FREEDICT_TOOLS)/mk/dicts.mk' \
		> "${_lang}/Makefile"
}


build()
{
	local _freedict_tools_dir=/usr/lib/freedict-tools
	local _ding2tei_dir="${_freedict_tools_dir}/importers/ding2tei"

	"$_ding2tei_dir"/preprocess/de-en/all.sh \
		< "ding-${_dingver}/de-en.txt" \
		> de-en.txt.preprocessed

	"${_ding2tei_dir}/ding2tei" de-en.txt.preprocessed "${_lang}/${_lang}.tei"

	cd "$_lang"
	make FREEDICT_TOOLS="$_freedict_tools_dir" build-dictd
}


package()
{
	install -m 755 -d "${pkgdir}/usr/share/dictd"
	install -m 644 -t "${pkgdir}/usr/share/dictd/" \
		"${_lang}/build/dictd/${_lang}".{dict.dz,index}
}
