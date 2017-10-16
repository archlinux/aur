# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

pkgbase='hunspell-fr'
pkgname=($pkgbase-{'classical','comprehensive','modern','revised'})
pkgver=6.1
pkgrel=1
pkgdesc="French hunspell dictionary"
arch=(any)
url="http://www.dicollecte.org/"
license=('MPL2')
optdepends=('hunspell: the spell checking libraries and apps')
conflicts=('hunspell-fr')
provides=('hunspell-fr')
source=(${url}download/fr/hunspell-french-dictionaries-v${pkgver}.zip)
sha256sums=('0c6acc29d3ec88feed4e4772af4521af1d52ce3fb092e685d474486e06fc5070')

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
