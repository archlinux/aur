# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

pkgbase='hunspell-fr'
pkgname=($pkgbase-{'classical','comprehensive','revised'})
pkgver=7.6
pkgrel=1
pkgdesc="French Hunspell dictionary"
arch=(any)
_base_url="https://grammalecte.net"
url="${_base_url}/home.php?prj=fr"
license=('MPL2')
makedepends=('fossil' 'qt5-webengine')
conflicts=('hunspell-fr')
provides=('hunspell-fr')
source=("grammalecte.fossil::fossil+http://grammalecte.net:8080#tag=cc24153f418268c1"
        "${pkgbase}_skip-useless-steps.patch")
sha256sums=('SKIP'
            '2c43bd9f031a7b63166d818377cedd52f7bb1589e28fe936862005f371a98837')

prepare() {
  cd "${srcdir}/grammalecte"
  patch -Np1 -i "../${pkgbase}_skip-useless-steps.patch"
}

package_hunspell-fr-classical() {
  pkgdesc+=" (classical variant)"
  _package 'classique'
}

package_hunspell-fr-comprehensive() {
  pkgdesc+=" (comprehensive variant)"
  _package 'toutesvariantes'
}

package_hunspell-fr-revised() {
  pkgdesc+=" (revised variant)"
  _package 'reforme1990'
}

_package() {
  _dicname=$1
  cd "${srcdir}/grammalecte"

  pushd "gc_lang/fr/dictionnaire/"
  python genfrdic.py --verdic ${pkgver}

  pushd "_build/${pkgver}/hunspell-french-dictionaries-v${pkgver}/"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 fr-${_dicname}.dic ${pkgdir}/usr/share/hunspell/fr_FR.dic
  install -m644 fr-${_dicname}.aff ${pkgdir}/usr/share/hunspell/fr_FR.aff
  install -Dm644 README_dict_fr.txt "${pkgdir}"/usr/share/doc/${pkgname}/README_dict_fr.txt
  popd
  popd

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

  # Install webengine dictionaries
  install -d "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
  for _file in "$pkgdir"/usr/share/hunspell/*.dic; do
    _filename=$(basename $_file)
    qwebengine_convert_dict $_file "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/${_filename/\.dic/\.bdic}
  done
}
