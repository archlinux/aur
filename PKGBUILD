# Maintainer: Slavi Pantaleev <s.pantaleev at gmail.com>

pkgname=hunspell-bg
pkgver=4.3
pkgrel=2
pkgdesc='Bulgarian dictionary for Hunspell'
arch=('any')
url="http://sourceforge.net/projects/bgoffice/"
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=('hunspell:	the spell checking libraries and apps')
source=('http://sourceforge.net/projects/bgoffice/files/OpenOffice.org%20Spell%20BG/'$pkgver'/OOo-spell-bg-'$pkgver'.zip')
md5sums=('ee804f871c855eb218c8d825b5fe54fb')

package() {
  cd "${srcdir}/OOo-spell-bg-${pkgver}"
  install -dm755 ${pkgdir}/usr/share/hunspell

  # UTF-8 convert
  conv='iconv -f windows-1251 -t utf-8'
  $conv bg_BG.dic > bg_BG_utf8.dic
  $conv bg_BG.aff | sed '1s/SET microsoft-cp1251/SET UTF-8/' > bg_BG_utf8.aff
  $conv README.bulgarian > README_bulgarian.txt

  install -m644 bg_BG_utf8.dic ${pkgdir}/usr/share/hunspell/bg_BG.dic
  install -m644 bg_BG_utf8.aff ${pkgdir}/usr/share/hunspell/bg_BG.aff

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd

  # docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  install -m644 README_bulgarian.txt ${pkgdir}/usr/share/doc/${pkgname}/

  # licenses
  install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 Copyright ${pkgdir}/usr/share/licenses/${pkgname}/Copyright
}
