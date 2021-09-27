# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Rax Garfield <admin at dvizho.ks.ua>

pkgname=hunspell-uk
pkgver=5.5.2
pkgrel=1
pkgdesc="Ukrainian spelling dictionary"
arch=('any')
url='https://github.com/brown-uk/dict_uk'
license=('CCPL')
optdepends=('hunspell: the spell checking libraries and apps')
makedepends=('qt5-webengine')
source=("https://github.com/brown-uk/dict_uk/releases/download/v${pkgver}/hunspell-uk_UA_${pkgver}.zip")
sha256sums=('7930b34c9f8d15feb46b9f71a5fd4179d7cd2235401e5fb234cf51303569cd0c')

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
