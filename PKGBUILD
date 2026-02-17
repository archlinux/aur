# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Rax Garfield <admin at dvizho.ks.ua>

pkgname=hunspell-uk
pkgver=6.7.5
pkgrel=1
pkgdesc="Ukrainian spelling dictionary"
arch=(any)
url=https://github.com/brown-uk/dict_uk
license=(GPL-3.0-or-later CC-BY-NC-SA-4.0)
optdepends=('hunspell: the spell checking libraries and apps')
makedepends=('java-environment>=21' gradle qt6-webengine)
source=($pkgname-$pkgver.tar.gz::https://github.com/brown-uk/dict_uk/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('d91519e9ea5feb7809673b7e483a20d39297aaed177e240c7e805a8effe899e7')

build() {
  cd "$srcdir/dict_uk-$pkgver"
  gradle --project-dir=distr/hunspell hunspell --no-daemon --gradle-user-home "$srcdir"/gradle
}

package() {
  cd "$srcdir/dict_uk-$pkgver"
  install -dm755 "$pkgdir"/usr/share/hunspell
  install -m644 distr/hunspell/build/hunspell/uk_UA.* "$pkgdir"/usr/share/hunspell

  # Install myspell symlinks
  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  pushd "$pkgdir"/usr/share/myspell/dicts
    for file in "$pkgdir"/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/"$(basename "$file")" .
    done
  popd

  # Install webengine dictionaries
  install -d "$pkgdir"/usr/share/qt{,6}/qtwebengine_dictionaries/
  for _file in "$pkgdir"/usr/share/hunspell/*.dic; do
    _filename=$(basename $_file)
    sed -i '/^IGNORE/d' "${_file/\.dic/\.aff}"
    /usr/lib/qt6/qwebengine_convert_dict $_file "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic}
    ln -rs "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic} "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
  done
}
