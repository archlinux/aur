# Maintainer: ariasuni <aria@ariasuni.eu>

pkgbase='hunspell-fr'
pkgname=($pkgbase-{'classical','comprehensive','revised'})
pkgver="7.7"
pkgrel=3
pkgdesc="French Hunspell dictionary"
arch=(any)
url="https://grammalecte.net/"
license=('MPL2')
makedepends=('python-setuptools' 'qt6-webengine')
conflicts=('hunspell-fr')
provides=('hunspell-fr' 'hunspell-dictionary')
optdepends=('hunspell: the spell checking libraries and apps')
source=("https://www.grammalecte.net/dic/hunspell-french-dictionaries-v$pkgver.zip")
sha256sums=('44314d992f94b4658c31a86ef2351724a43067531b0af3643f91bf0220eee616')

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
  aliases="fr_BE fr_CA fr_CH fr_LU"
  _dicname=$1
  cd "${srcdir}/"

  install -dm755 ${pkgdir}/usr/share/hunspell
  install -Dm644 fr-${_dicname}.dic "${pkgdir}"/usr/share/hunspell/fr_FR.dic
  install -Dm644 fr-${_dicname}.aff "${pkgdir}"/usr/share/hunspell/fr_FR.aff
  install -Dm644 README_dict_fr.txt -t "${pkgdir}"/usr/share/doc/${pkgname}/

  pushd "${pkgdir}"/usr/share/hunspell/
  for lang in ${aliases}; do
    ln -s fr_FR.aff ${lang}.aff
    ln -s fr_FR.dic ${lang}.dic
  done
  # the symlinks
  install -dm755 "${pkgdir}"/usr/share/myspell/dicts
  for file in *; do
    ln -rs ${file} "${pkgdir}"/usr/share/myspell/dicts
  done
  popd

  # Install webengine dictionaries
  install -d "$pkgdir"/usr/share/qt{,6}/qtwebengine_dictionaries/
  pushd "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/
  /usr/lib/qt6/qwebengine_convert_dict "$pkgdir"/usr/share/hunspell/fr_FR.dic fr_FR.bdic
  ln -rs fr_FR.bdic "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
  for lang in ${aliases}; do
    ln -rs fr_FR.bdic ${lang}.bdic
    ln -rs fr_FR.bdic "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/${lang}.bdic
  done
  popd
}
