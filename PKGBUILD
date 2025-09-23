



# Maintainer: ariasuni <aria@ariasuni.eu>

pkgbase='hunspell-fr'
pkgname=($pkgbase-{'classical','comprehensive','revised'})
_commit=e22005d53f
# http://grammalecte.net:8080/finfo?name=gc_lang/fr/oxt/Dictionnaires/dictionaries/README_dict_fr.txt
pkgver="7.7"
pkgrel=2
pkgdesc="French Hunspell dictionary"
arch=(any)
url="https://grammalecte.net/home.php?prj=fr"
license=('MPL2')
makedepends=('python-setuptools' 'qt6-webengine')
conflicts=('hunspell-fr')
provides=('hunspell-fr')
source=("http://grammalecte.net:8080/tarball/$_commit/Grammalecte-$_commit.tar.gz"
        "${pkgbase}_skip-useless-steps.patch")
sha256sums=('fb77c85992fa5f9d3296299b33303865589ad0e52d40ace5f4cb0c21309081f6'
            'd03f9754aca4a95629831d00d27f5e598e325adbd10845eac265a6da57a4b1c6')

prepare() {
  cd "${srcdir}/Grammalecte-$_commit"
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
  aliases="fr_BE fr_CA fr_CH fr_LU"
  _dicname=$1
  cd "${srcdir}/Grammalecte-$_commit"

  pushd "gc_lang/fr/dictionnaire/"
  python genfrdic.py --verdic ${pkgver}

  pushd "_build/${pkgver}/hunspell-french-dictionaries-v${pkgver}/"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 fr-${_dicname}.dic ${pkgdir}/usr/share/hunspell/fr_FR.dic
  install -m644 fr-${_dicname}.aff ${pkgdir}/usr/share/hunspell/fr_FR.aff
  install -Dm644 README_dict_fr.txt -t ’"${pkgdir}"/usr/share/doc/${pkgname}/
  popd
  popd

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
