# Maintainer: Pedro Cunha <arch [at] pyker [dot] net>
# Contributor: Mauro Santos <registo.mailling@gmail.com>

pkgname='hunspell-pt_pt'
_pkgname='hunspell-pt_PT'
pkgver=20251001
pkgrel=2
pkgdesc="Portuguese (European, post-orthographic agreement) hunspell dictionaries"
arch=('any')
url="https://natura.di.uminho.pt/download/sources/Dictionaries/hunspell/"
license=('GPL' 'LGPL' 'MPL')
makedepends=('qt6-webengine')
optdepends=('hunspell: the spell checking libraries and apps')
source=("https://natura.di.uminho.pt/download/sources/Dictionaries/hunspell/$_pkgname-$pkgver.tar.gz")
sha256sums=('2066157087e83264484a6d564e1d85258fe2c5eddb9713a42d6f6cf06b0a2ed9')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/share/hunspell"
  install -vDm644 pt_PT.aff pt_PT.dic -t "$pkgdir/usr/share/hunspell"

  # Install webengine dictionaries
  install -d "$pkgdir"/usr/share/qt{,6}/qtwebengine_dictionaries/
  for _file in "$pkgdir"/usr/share/hunspell/*.dic; do
    _filename=$(basename $_file)
    /usr/lib/qt6/qwebengine_convert_dict $_file "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic}
    ln -rs "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic} "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
  done

  # myspell symlinks
  install -dm755 "$pkgdir/usr/share/myspell/dicts"
  pushd "$pkgdir/usr/share/myspell/dicts"
    for file in "$pkgdir/usr/share/hunspell/"*; do
      ln -sv /usr/share/hunspell/$(basename $file) .
    done
  popd

  # docs
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -D -m644 README_pt_PT.txt "$pkgdir/usr/share/doc/$pkgname"

  # licences
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
