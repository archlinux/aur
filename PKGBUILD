# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot com>

pkgname=hunspell-ko
_pkgname=hunspell-dict-ko
pkgver=0.7.93
pkgrel=1
pkgdesc="Korean hunspell dictionary"
arch=('any')
url='https://github.com/spellcheck-ko/hunspell-dict-ko'
license=('GPL3' 'custom')
makedepends=('hunspell' 'ispell' 'qt6-webengine' 'python' 'python-yaml')
optdepends=('hunspell: the spell checking libraries and apps')
source=($_pkgname-$pkgver.tar.gz::"https://github.com/spellcheck-ko/hunspell-dict-ko/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('a3f74ad224a74356d1a91ebdb88241fbd99958039f52a9a71390a6bd5d0ea2c5867113f25ea1f50224a5dd4362e03cf96159794d3d35e2b3e554ab945aabcff9')

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
