# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Rax Garfield <admin at dvizho.ks.ua>

pkgname=hunspell-uk
pkgver=6.5.4
pkgrel=1
pkgdesc="Ukrainian spelling dictionary"
arch=(any)
url=https://github.com/brown-uk/dict_uk
license=(GPL-3.0-or-later CC-BY-NC-SA-4.0)
optdepends=('hunspell: the spell checking libraries and apps')
makedepends=(java-environment gradle qt5-webengine)
source=($pkgname-$pkgver.tar.gz::https://github.com/brown-uk/dict_uk/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('a22e3d6bc19f089f5c574e4f5497ca6667c1d4495ee7d33daef864e98d3d168a')

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
