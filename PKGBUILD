# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>

# README:
#  * Building this package takes very long (a day or so) and consumes quite a
#    lot of RAM (> 7 GiB).
#    * Consider to use the corresponding -bin package instead.

_lang=eng-deu
pkgname="dict-freedict-${_lang}"
_dingver=1.9
_pkgver="${_dingver}-fd1"
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="English -> German dictionary for dictd et al. from FreeDict.org"
arch=('any')
url="https://freedict.org/"
license=('GPL' 'AGPL3')
optdepends=('dictd: dict client and server')
makedepends=('freedict-tools>=1:0.6.0')
install="${pkgname}.install"
source=("ding-${_dingver}.gz::https://ftp.tu-chemnitz.de/pub/Local/urz/ding/de-en/de-en.txt.gz")
sha512sums=('172b61d4ee52ea14385608cca62891ecab22a4136aa5967654f56b5ef4c77c9f4feeb294396be43b7787133fabdfb2ace8648d2ee4fa877cf21ec566a0ef2b77')


_freedict_tools_dir=/usr/lib/freedict-tools
_ding2tei_dir="${_freedict_tools_dir}/importers/ding2tei"


prepare()
{
	mkdir -p dict/ding
	ln -s "${srcdir}/ding-${_dingver}" dict/ding/de-en.txt

	mkdir -p "dict/tei/${_lang}"
	ln -s "${_ding2tei_dir}/dict/tei/${_lang}/Makefile" "dict/tei/${_lang}/"
}


build()
{
	local _utf8_locale
	if [[ "$LANG" == *.UTF-8 ]]
	then
		_utf8_locale="$LANG"
	else
		_utf8_locale="$(localectl list-locales | grep '\.UTF-8$' | head -n 1)"
		if [[ "$_utf8_locale" == '' ]]
		then
			printf 'No UTF-8 locale available.  Cannot continue.'
			return 1
		fi
	fi

	# Build the TEI XML file.
	#  * ding2tei (incl. the preprocess scripts) needs a UTF-8 locale.
	#    - The tools operating on the built TEI XML should not need this.
	make -C "$_ding2tei_dir" -o ding2tei LC_ALL="$_utf8_locale" \
		dictdir="${srcdir}/dict" "${_lang}"

	# Build the DICT files (this takes very long).
	make -C "dict/tei/${_lang}" FREEDICT_TOOLS="$_freedict_tools_dir" \
		build-dictd
}


package()
{
	make -C "dict/tei/${_lang}" FREEDICT_TOOLS="$_freedict_tools_dir" \
		DESTDIR="$pkgdir" PREFIX=/usr install
}
