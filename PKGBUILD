# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>

_pkgname=freedict-tools
pkgname="${_pkgname}-svn"
epoch=1
pkgver=0.6.0.r469
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
makedepends=('subversion'
             # ding2tei:
             'ghc' 'alex' 'happy')
provides=("${_pkgname}=${epoch}:${pkgver}") # Updated via pkgver() & package().
conflicts=("$_pkgname")
source=("${pkgname}::svn+https://github.com/freedict/tools/trunk")
sha512sums=('SKIP')


pkgver()
{
	cd "$pkgname"
	local _mainver _svnver
	_mainver="$(
		svn ls ^/tags \
			| sed -En \
				'\`^[0-9]+(\.[0-9]+)*(-beta\.[0-9]+)?/$` { s`/$``; s`-`_`g; p }' \
			| tail -n 1
	)"
	_svnver="$(svnversion | tr -d '[:alpha:]')"
	printf "%s.r%s" "$_mainver" "$_svnver"
}


prepare()
{
	sed -Ei 's/^HCFLAGS =/& -dynamic/' \
		"${pkgname}/importers/ding2tei/GNUmakefile"
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

	make -C "${pkgname}/importers/ding2tei" LC_ALL="$_utf8_locale"
}


package()
{
	mkdir -p "${pkgdir}/usr/lib/${_pkgname}"

	# `*': Exclude `.svn', `.gitignore', `.makepkg'.
	cp -r "$pkgname"/* "${pkgdir}/usr/lib/${_pkgname}/"

	# ding2tei: Delete unnecessary files.
	cd "${pkgdir}/usr/lib/${_pkgname}/importers/ding2tei"
	mv src/preprocess/ .
	find . -regextype posix-extended \
		-mindepth 1 -maxdepth 1 \
		! -regex '\./(ding2tei|preprocess|GNUmakefile|README|dict)' \
		-exec rm -rf '{}' +

	# Adjust ding2tei Makefile to changed location of `preprocess/'.
	sed -Ei 's/^(srcdir) = .*$/\1 = ./' GNUmakefile

	mkdir -p "${pkgdir}/usr/share/doc/freedict/tools"
	ln -s "/usr/lib/${_pkgname}/README.md" \
		"${pkgdir}/usr/share/doc/freedict/tools/"

	# Update "provided" version.
	#  - Does not work in pkgver().
	provides=("${_pkgname}=${epoch}:${pkgver}")
}
