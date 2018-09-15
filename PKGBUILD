# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

pkgbase='hunspell-fr'
pkgname=($pkgbase-{'classical','comprehensive','modern','revised'})
pkgver=6.3
pkgrel=1
pkgdesc="French Hunspell dictionary"
arch=(any)
_base_url="https://dicollecte.org/"
url="${_base_url}home.php?prj=fr"
license=('MPL2')
conflicts=('hunspell-fr')
provides=('hunspell-fr')
source=("${_base_url}download/fr/hunspell-french-dictionaries-v${pkgver}.zip")
sha256sums=('cc6c2d15073659d221487b45245e9eee9a4ed66c30c6dcf784326bab063c5266')

package_hunspell-fr-classical() {
  pkgdesc+=" (classical variant)"
  _package 'classique'
}

package_hunspell-fr-comprehensive() {
  pkgdesc+=" (comprehensive variant)"
  _package 'toutesvariantes'
}

package_hunspell-fr-modern() {
  pkgdesc+=" (modern variant)"
  _package 'moderne'
}

package_hunspell-fr-revised() {
  pkgdesc+=" (revised variant)"
  _package 'reforme1990'
}

_package() {
  _dicname=$1
  cd "${srcdir}"

  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 fr-${_dicname}.dic ${pkgdir}/usr/share/hunspell/fr_FR.dic
  install -m644 fr-${_dicname}.aff ${pkgdir}/usr/share/hunspell/fr_FR.aff

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
