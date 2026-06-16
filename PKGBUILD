# Maintainer: Henrique Custódio <henriqueffc at tutanota dot com>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Pedro Gabriel Drumond Pereira <pedrogabriel at dcc.ufmg.br>
# Contributor: Rafael D Martins <raziel_takato at hotmail dotcom>
# Contributor: Daniel Felipe Reis Apolinario <dapolinario at gmail dotcom>
# Contributor: Bernardo Barros <bernardobarros at gmail dotcom>
# Contributor: Robson R S Peixoto <robsonpeixoto at gmail dotcom>

pkgname=hunspell-pt-br
pkgver=3.2.0
pkgrel=2
epoch=1
pkgdesc="Brazillian Portuguese grammar, spelling and hyphenation checker to hunspell"
arch=(any)
url="https://extensions.libreoffice.org/en/extensions/show/vero-verificador-ortografico-e-hifenizador-em-portugues"
license=('LGPL-3.0-only' 'MPL')
makedepends=('qt6-webengine')
optdepends=('hunspell:  the spell checking libraries and apps')
source=('https://extensions.libreoffice.org/assets/downloads/z/veroptbrv320aoc.oxt')
sha256sums=('78bac9ed27bf1b23666e240bc3809b9520004f14885423580a029771032bff54')

# based it in the community build for hunspell-hu-HU
package() {
  cd "$srcdir"
  install -dm755 "$pkgdir"/usr/share/hunspell
  install -m644 -t "$pkgdir"/usr/share/hunspell pt_BR.dic pt_BR.aff

  # Install webengine dictionaries
  install -d "$pkgdir"/usr/share/qt{,6}/qtwebengine_dictionaries/
  for _file in "$pkgdir"/usr/share/hunspell/*.dic; do
  _filename=$(basename $_file)
    /usr/lib/qt6/qwebengine_convert_dict $_file "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic}
  ln -rs "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic} "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
  done

  # the symlinks
  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  pushd "$pkgdir"/usr/share/myspell/dicts
     for file in "$pkgdir"/usr/share/hunspell/*; do
       ln -sv /usr/share/hunspell/$(basename $file) .
     done
  popd

  # docs
  install -Dm644 README_pt_BR.txt "$pkgdir"/usr/share/doc/$pkgname/README_pt_BR.txt
}
