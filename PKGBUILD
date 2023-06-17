# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot com>

pkgname=hunspell-ko
_pkgname=hunspell-dict-ko
pkgver=0.7.94
pkgrel=1
pkgdesc="Korean hunspell dictionary"
arch=('any')
url='https://github.com/spellcheck-ko/hunspell-dict-ko'
license=('GPL3' 'custom')
makedepends=('hunspell' 'ispell' 'qt6-webengine' 'python' 'python-yaml')
optdepends=('hunspell: the spell checking libraries and apps')
source=($_pkgname-$pkgver.tar.gz::"https://github.com/spellcheck-ko/hunspell-dict-ko/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('1dbcd566fdf37c1cdb26601cc546fddd8f91875d4a0a96cd4e5de7ca0f23005404559859b7a4eb4362c35d232ac062c23bdc8f4416feab1c32a76651faecf524')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -dm755 "$pkgdir"/usr/share/hunspell
  install -m644 ko.dic "$pkgdir"/usr/share/hunspell/ko_KR.dic
  install -m644 ko.aff "$pkgdir"/usr/share/hunspell/ko_KR.aff

  # the symlinks
  install -dm755 "${pkgdir}"/usr/share/myspell/dicts
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

  # licenses
  install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
