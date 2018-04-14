#  Maintainer: Archadept
#    Revision: 2018-04-14

pkgname=hunspell-la
pkgver=20130331
pkgrel=3
pkgdesc='Latin dictionary for Hunspell'
arch=('any')
url="https://extensions.libreoffice.org/extensions/latin-spelling-and-hyphenation-dictionaries"
license=('GPL')
optdepends=('hunspell:  the spell checking libraries and apps')
source=('https://extensions.libreoffice.org/extensions/latin-spelling-and-hyphenation-dictionaries/2013.03.31/@@download/file/dict-la_2013-03-31.oxt')
md5sums=('46674c8e9985b97e3f71555ed83a90cd')

prepare() {
    # Hunspell ignores byte order mark (BOM sequence), see changelog of 2007-03-19:
    # https://github.com/hunspell/hunspell/blob/master/ChangeLog
    # However, some third-party applications can be affected. For example:
    # https://bugs.launchpad.net/ubuntu/+source/hunspell-ru/+bug/992194

    # BOM removal
    LC_ALL=C sed -i '1s/^\xEF\xBB\xBF//' "${srcdir}/la/universal/la.dic"
    LC_ALL=C sed -i '1s/^\xEF\xBB\xBF//' "${srcdir}/la/universal/la.aff"
}

package() {
    cd "${srcdir}/la/universal"

    # Hunspell dictionary
    install -Dm644 la.dic ${pkgdir}/usr/share/hunspell/la_LA.dic
    install -Dm644 la.aff ${pkgdir}/usr/share/hunspell/la_LA.aff

    # MySpell links
    install -dm755 ${pkgdir}/usr/share/myspell/dicts
    pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
        ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
    popd

    # Docs
    install -Dm644 "${srcdir}/la/README_la.txt" "${pkgdir}/usr/share/doc/${pkgname}/README_la.txt"
}

