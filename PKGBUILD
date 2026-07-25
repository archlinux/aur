# Maintainer: Viachaslau Khalikin <viachaslavic'at'outlook'dot'com>

pkgbase=hunspell-be-tarask
pkgname=('hunspell-be-tarask' 'hunspell-be-tarask-alt')
pkgver=0.65
pkgrel=2
pkgdesc="Belarusian hunspell dictionary (classic orthography)"
arch=('any')
url="https://github.com/375gnu/spell-be-tarask"
license=('CC-BY-SA-3.0')
makedepends=('git' 'qt6-webengine')
optdepends=('hunspell: the spell checking libraries and apps')
provides=('hunspell-dictionary')
source=("$pkgbase::git+$url.git#commit=v${pkgver}")
b2sums=('32fab0731d71507dabb5c84854f48e23093f8eec9ae67afa1518173ab5882555f24bf73451d8d7a9e93fb8dfb37e927ff4147104a7ecc09ff2a65ed75d61e107')
options=('!emptydirs')

build() {
  cd ${srcdir}/${pkgbase}
  make dict
}

_package() {
  cd ${srcdir}/${pkgbase}
  install -Dm644 be_BY@tarask.{dic,aff} -t "$pkgdir"/usr/share/hunspell

  if [[ ! "$pkgname" =~ -alt$ ]]; then
    pushd "$pkgdir/usr/share/hunspell/" > /dev/null
      ln -sv be_BY@tarask.aff be_BY.aff
      ln -sv be_BY@tarask.dic be_BY.dic
    popd > /dev/null
  fi

  # myspell symlinks
  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  pushd "$pkgdir"/usr/share/myspell/dicts > /dev/null
    for file in "$pkgdir"/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename $file) .
    done
  popd > /dev/null

  # Install webengine dictionaries
  install -d "$pkgdir"/usr/share/qt{,6}/qtwebengine_dictionaries/
  for _file in "$pkgdir"/usr/share/hunspell/*.dic; do
    _filename=$(basename $_file)
    /usr/lib/qt6/qwebengine_convert_dict $_file "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic}
    ln -rs "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic} "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
  done

  # docs and license
  install -Dm644 dictionaries/README_be_BY.txt -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_hunspell-be-tarask() {
  conflicts=('hunspell-be' 'hunspell-be-tarask-alt')

  _package
}

package_hunspell-be-tarask-alt() {
  pkgdesc="Belarusian hunspell dictionary (classic orthography) - without be_BY aliases"
  conflicts=('hunspell-be-tarask')

  _package
}

# vim:set ft=sh ts=2 sw=2 et:
