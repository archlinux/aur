# Maintainer:	Lynuxed
# Contributor:	Archadept <flame-droid at gmx dot com>
# 	Revision: 2023-01-26

pkgname="hunspell-la"
pkgver="2013.03.31"
pkgrel="4"
pkgdesc='Latin hunspell dictionary'
arch=('any')
url="https://extensions.libreoffice.org/extensions/latin-spelling-and-hyphenation-dictionaries"
license=('GPL')
optdepends=('hunspell:  the spell checking libraries and apps')
source=('https://extensions.libreoffice.org/assets/downloads/z/dict-la-2013-03-31.oxt')
md5sums=('46674c8e9985b97e3f71555ed83a90cd')

prepare() {
    # Hunspell ignores byte order mark (BOM sequence), see changelog of 2007-03-19:
    # https://github.com/hunspell/hunspell/blob/master/ChangeLog
    # However, some third-party applications can be affected. For example:
    # https://bugs.launchpad.net/ubuntu/+source/hunspell-ru/+bug/992194

    	# BOM removal
    LC_ALL=C sed -s -i '1s/^\xEF\xBB\xBF//' ${srcdir}/la/universal/*
}

package() {

	#copy hunspell
    cd "${srcdir}"/la/universal
    install -dm755 "${pkgdir}"/usr/share/hunspell
    install -m644 -t "${pkgdir}"/usr/share/hunspell la.aff la.dic

    	# myspell symlinks
    install -dm755 "${pkgdir}"/usr/share/myspell/dicts
    pushd "${pkgdir}"/usr/share/myspell/dicts
    	for file in "${pkgdir}"/usr/share/hunspell/*; do
		ln -sv /usr/share/hunspell/"$(basename "${file}")" .
	done
    popd

    	# license
    install -Dm644 "${srcdir}"/la/README_la.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

