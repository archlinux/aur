# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Rax Garfield <admin at dvizho.ks.ua>

pkgname=hunspell-uk
pkgver=5.0.6
pkgrel=1
pkgdesc="Ukrainian spelling dictionary"
arch=('any')
url='https://github.com/brown-uk/dict_uk'
license=('GPL3')
optdepends=('hunspell: the spell checking libraries and apps')
makedepends=('qt5-webengine')
source=("https://github.com/brown-uk/dict_uk/releases/download/v${pkgver}/hunspell-uk_UA.zip")
sha256sums=('d7aa147db0cafb2fb473219275b2ba2af7c2673320a1e7a31d31743850a07735')

package() {
  install -dm755 "$pkgdir"/usr/share/hunspell
  install -m644 uk_UA.* "$pkgdir"/usr/share/hunspell

  # myspell symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd

  # Install webengine dictionaries
  install -d "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
  for _file in *.dic; do
    _filename="$(basename $_file)"
    sed -i '/^IGNORE/d' "${_file/\.dic/\.aff}"
    qwebengine_convert_dict "$_file" "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/"${_filename/\.dic/\.bdic}"
  done
}
