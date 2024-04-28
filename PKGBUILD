# Maintainer: Viačasłaŭ Chalikin <viachaslavic'at'outlook'dot'com>

pkgname='hunspell-be-tarask'
pkgver=0.60
pkgrel=1
pkgdesc="Belarusian hunspell dictionary (classic orthography)"
arch=('any')
url="https://github.com/375gnu/spell-be-tarask"
license=('CC-BY-SA-3.0')
makedepends=('git' 'qt6-webengine')
optdepends=('hunspell: the spell checking libraries and apps')
provides=('hunspell-dictionary')
conflicts=('hunspell-be')
source=("$pkgname::git+$url.git#commit=v${pkgver}")
b2sums=('1cc0bfb1ecf3ae3ff148d564006b1a07965f5648cc1649b7f454db7545eba7179f736cfb955869380b5a916ed5cb6674ffae4a7c642cb059a9bce83eb0a41d8e')

build() {
  cd ${srcdir}/${pkgname}
  make dict
}

package() {
  cd ${srcdir}/${pkgname}
  install -Dm644 be_BY@tarask.{dic,aff} -t "$pkgdir"/usr/share/hunspell

  pushd "$pkgdir/usr/share/hunspell/"
    be_BY_aliases="be_BY"
    for lang in $be_BY_aliases; do
      ln -s be_BY@tarask.aff $lang.aff
      ln -s be_BY@tarask.dic $lang.dic
    done
  popd

  # myspell symlinks
  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  pushd "$pkgdir"/usr/share/myspell/dicts
    for file in "$pkgdir"/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename $file) .
    done
  popd

  # Install webengine dictionaries
  install -d "$pkgdir"/usr/share/qt{,6}/qtwebengine_dictionaries/
  for _file in "$pkgdir"/usr/share/hunspell/*.dic; do
    _filename=$(basename $_file)
    /usr/lib/qt6/qwebengine_convert_dict $_file "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic}
    ln -rs "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic} "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
  done

  # docs
  install -Dm644 dictionaries/README_be_BY.txt -t "${pkgdir}/usr/share/doc/${pkgname}"

  # licenses
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 et:
