# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>

pkgname=freedict-tools
epoch=1
pkgver=0.6.0
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="Tools to compile the FreeDict dictionaries"
arch=('any')
url="https://freedict.org/"
license=('GPL' 'GPL3' 'CC-BY-SA' 'AGPL3')
depends=('make' 'libxslt' 'tar' 'gzip' 'dictd' 'perl' 'espeak-ng'
         'python>3.4' 'perl-xml-libxml' 'perl-xml-libxslt' 'iso-codes'
         'which'
         # ding2tei:
         'haskell-base' 'haskell-containers' 'haskell-transformers'
         'haskell-pretty' 'haskell-xml' 'haskell-safe'
         'bash' 'sed' 'make' 'coreutils')
makedepends=('ghc' 'alex' 'happy')  # ding2tei
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/freedict/tools/archive/refs/tags/${_pkgver}.tar.gz")
sha512sums=('e525a767b5468e16270838ff4e6e6773af9a062a50b6b0c01b9f4bbc06ecc33ac3c1ae5d5cb133041abba24214289e22f9c1a38fd585b2b936491663380c6aff')


prepare()
{
	sed -Ei 's/^HCFLAGS =/& -dynamic/' \
		"tools-${_pkgver}/importers/ding2tei/GNUmakefile"
}


build()
{
	# Build ding2tei.
	#  * A UTF-8 locale is required.

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

	make -C "tools-${_pkgver}/importers/ding2tei" LC_ALL="$_utf8_locale"
}


package()
{
	mkdir -p "${pkgdir}/usr/lib/${pkgname}"

	# `*': Exclude `.gitignore'.
	cp -r "tools-${_pkgver}"/* "${pkgdir}/usr/lib/${pkgname}/"

	# ding2tei: Delete unnecessary files.
	cd "${pkgdir}/usr/lib/${pkgname}/importers/ding2tei"
	mv src/preprocess/ .
	find . -regextype posix-extended \
		-mindepth 1 -maxdepth 1 \
		! -regex '\./(ding2tei|preprocess|GNUmakefile|README|dict)' \
		-exec rm -rf '{}' +

	# Adjust ding2tei Makefile to changed location of `preprocess/'.
	sed -Ei 's/^(srcdir) = .*$/\1 = ./' GNUmakefile

	mkdir -p "${pkgdir}/usr/share/doc/freedict/tools"
	ln -s "/usr/lib/${pkgname}/README.md" \
		"${pkgdir}/usr/share/doc/freedict/tools/"
}
