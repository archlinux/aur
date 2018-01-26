# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

pkgbase='hunspell-fr-ungendered'
pkgname=(hunspell-fr-{'classical','comprehensive','modern','revised'}-ungendered)
pkgver=6.2
pkgrel=1
pkgdesc="French ungendered hunspell dictionary"
arch=(any)
url="https://github.com/RadicaliseesSurInternet/hunspell-inclusif"
license=('MPL2')
makedepends=('python')
conflicts=('hunspell-fr')
provides=('hunspell-fr')
source=("git+${url}")
sha256sums=('SKIP')

package_hunspell-fr-classical-ungendered() {
  pkgdesc+=" (classical variant)"
  _package 'classique'
}

package_hunspell-fr-comprehensive-ungendered() {
  pkgdesc+=" (comprehensive variant)"
  _package 'toutesvariantes'
}

package_hunspell-fr-modern-ungendered() {
  pkgdesc+=" (modern variant)"
  _package 'moderne'
}

package_hunspell-fr-revised-ungendered() {
  pkgdesc+=" (revised variant)"
  _package 'reforme1990'
}

_package() {
  _dicname=$1
  cd "${srcdir}/hunspell-inclusif"

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
