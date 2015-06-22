#  Maintainer: Archadept
#    Revision: 2013-10-18

pkgname=hunspell-la
pkgver=20130331
pkgrel=1
pkgdesc='Latin dictionary for Hunspell'
arch=('any')
url="http://extensions.libreoffice.org/extension-center/latin-spelling-and-hyphenation-dictionaries"
license=('GPL')
optdepends=('hunspell:	the spell checking libraries and apps')
source=('http://extensions.libreoffice.org/extension-center/latin-spelling-and-hyphenation-dictionaries/pscreleasefolder.2011-11-05.0070960452/2013.03.31/dict-la_2013-03-31.oxt')
md5sums=('46674c8e9985b97e3f71555ed83a90cd')

package() {
    cd "${srcdir}/la"

    install -dm755 ${pkgdir}/usr/share/hunspell
	install -m644 la.dic ${pkgdir}/usr/share/hunspell
	install -m644 la.aff ${pkgdir}/usr/share/hunspell
  
    # UTF-8
    conv='iconv -f iso8859-1 -t utf-8'
    $conv la.dic > la_LA.dic
    $conv la.aff | sed '1s/SET ISO8859-1/SET UTF-8/' > la_LA.aff
    install -m644 la_LA.dic ${pkgdir}/usr/share/hunspell/
    install -m644 la_LA.aff ${pkgdir}/usr/share/hunspell/

    rm ${pkgdir}/usr/share/hunspell/la.dic
    rm ${pkgdir}/usr/share/hunspell/la.aff

    # symlinks
    install -dm755 ${pkgdir}/usr/share/myspell/dicts
    pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
                ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
    popd
  
    # docs
    install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
    install -m644 README_la.txt $pkgdir/usr/share/doc/${pkgname}/README_la.txt
}
