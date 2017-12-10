# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

pkgbase='hunspell-fr'
pkgname=($pkgbase-{'classical','comprehensive','modern','revised'})
pkgver=6.2
pkgrel=1
pkgdesc="French hunspell dictionary"
arch=(any)
_base_url="https://dicollecte.org/"
url="${_base_url}home.php?prj=fr"
license=('MPL2')
optdepends=('hunspell: the spell checking libraries and apps')
conflicts=('hunspell-fr')
provides=('hunspell-fr')
source=(${_base_url}download/fr/hunspell-french-dictionaries-v${pkgver}.zip)
sha256sums=('c98147b99518a5aa51d51db58d6a153377bb9f366ebe8a21a2faa05b6c76308d')

package_hunspell-fr-classical() {
  _package 'classical' 'classique'
}

package_hunspell-fr-comprehensive() {
  _package 'comprehensive' 'toutesvariantes'
}

package_hunspell-fr-modern() {
  _package 'modern' 'moderne'
}

package_hunspell-fr-revised() {
  _package 'revised' 'reforme1990'
}

_package() {
  pkgdesc="${pkgdesc} ($1 variant)"
  cd "${srcdir}"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 fr-$2.dic ${pkgdir}/usr/share/hunspell/fr_FR.dic
  install -m644 fr-$2.aff ${pkgdir}/usr/share/hunspell/fr_FR.aff

  pushd "${pkgdir}"/usr/share/hunspell/
  aliases="fr_BE fr_CA fr_CH fr_LU"
  for lang in ${aliases}; do
    ln -s fr_FR.aff ${lang}.aff
    ln -s fr_FR.dic ${lang}.dic
  done
  popd

  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd

  install -Dm644 README_dict_fr.txt "${pkgdir}"/usr/share/doc/${pkgname}/README_dict_fr.txt
}
