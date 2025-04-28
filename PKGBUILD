# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Rax Garfield <admin at dvizho.ks.ua>

pkgname=hunspell-uk
pkgver=6.6.1
pkgrel=1
pkgdesc="Ukrainian spelling dictionary"
arch=(any)
url=https://github.com/brown-uk/dict_uk
license=(GPL-3.0-or-later CC-BY-NC-SA-4.0)
optdepends=('hunspell: the spell checking libraries and apps')
makedepends=('java-environment<24' gradle qt5-webengine)
source=($pkgname-$pkgver.tar.gz::https://github.com/brown-uk/dict_uk/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('75b2bf919b1f78251a7cdb32052a88efebab6d197e87b9b476ff7fad7ef02ae7')

build() {
  cd "$srcdir/dict_uk-$pkgver"
  gradle -b distr/hunspell/build.gradle hunspell --no-daemon --gradle-user-home "$srcdir"/gradle
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
  install -d "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
  for _file in distr/hunspell/build/hunspell/*.dic; do
    _filename="$(basename "$_file")"
    sed -i '/^IGNORE/d' "${_file/\.dic/\.aff}"
    qwebengine_convert_dict "$_file" "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/"${_filename/\.dic/\.bdic}"
  done
}
