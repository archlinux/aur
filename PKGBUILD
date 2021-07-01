# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_pkgname=freedict-tools
pkgname="${_pkgname}-svn"
epoch=1
pkgver=r443
pkgrel=2
pkgdesc="Tools to compile the Freedict dictionaries"
arch=('any')
url="https://freedict.org/"
license=('GPL' 'GPL3' 'CC-BY-SA' 'AGPL3')
depends=('make' 'libxslt' 'tar' 'gzip' 'dictd' 'perl' 'espeak-ng'
         'python>3.4' 'perl-xml-libxml' 'perl-xml-libxslt' 'iso-codes'
         'which'
         'haskell-base' 'haskell-containers' 'haskell-transformers'
         'haskell-pretty' 'haskell-xml')
makedepends=('subversion'
             'ghc' 'alex' 'happy')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("svn+https://github.com/freedict/tools/trunk")
sha512sums=('SKIP')


pkgver()
{
	cd trunk
	local _ver="$(svnversion)"
	printf "r%s" "${_ver//[[:alpha:]]}"
}


build()
{
	# Build ding2tei.

	cd trunk/importers/ding2tei/src

	alex Language/Ding/AlexScanner.x
	happy Language/Ding/Parser/Line.y

	mkdir ../build
	ghc -dynamic -Wall -O2 -XRecursiveDo Main -o ../ding2tei -outputdir ../build
}


package()
{
	mkdir -p "${pkgdir}/usr/lib/${_pkgname}"

	# `*': Exclude `.svn', `.gitignore', `.makepkg'.
	cp -r trunk/* "${pkgdir}/usr/lib/${_pkgname}/"

	# ding2tei: Delete unnecessary files.
	cd "${pkgdir}/usr/lib/${_pkgname}/importers/ding2tei"
	mv src/preprocess/ .
	find . -regextype posix-extended \
		-mindepth 1 -maxdepth 1 \
		! -regex './(ding2tei|preprocess|README)' \
		-exec rm -rf '{}' +

	mkdir -p "${pkgdir}/usr/share/doc/freedict/tools"
	ln -s /usr/lib/${_pkgname}/README.md \
		"${pkgdir}/usr/share/doc/freedict/tools/"
}
