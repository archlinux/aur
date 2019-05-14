# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

pkgbase='hunspell-fr-ungendered'
pkgname=("$pkgbase"-{'classical','comprehensive','modern','revised'})
pkgver=0.6.0
pkgrel=2
pkgdesc="French ungendered hunspell dictionary"
arch=(any)
url="https://github.com/RadicaliseesSurInternet/hunspell-inclusif"
license=('MPL2')
makedepends=('python')
conflicts=('hunspell-fr')
provides=('hunspell-fr')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('e86eb438b81eb67c1d35122325f000d1077779e42f4f5ec27554a8b390d44922')

package_hunspell-fr-ungendered-classical() {
  pkgdesc+=" (classical variant)"
  _package 'classique'
}

package_hunspell-fr-ungendered-comprehensive() {
  pkgdesc+=" (comprehensive variant)"
  _package 'toutesvariantes'
}

package_hunspell-fr-ungendered-modern() {
  pkgdesc+=" (modern variant)"
  _package 'moderne'
}

package_hunspell-fr-ungendered-revised() {
  pkgdesc+=" (revised variant)"
  _package 'reforme1990'
}

_package() {
  _dicname=$1
  cd "${srcdir}/hunspell-inclusif-${pkgver}"

  python3 scripts/generate-aff.py dicollecte/fr-${_dicname}.aff > fr.aff
  python3 scripts/generate-dic.py dicollecte/fr-${_dicname}.dic > fr.dic

  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 fr.dic ${pkgdir}/usr/share/hunspell/fr_FR.dic
  install -m644 fr.aff ${pkgdir}/usr/share/hunspell/fr_FR.aff

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

  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
