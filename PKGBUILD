# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Frederik Nordahl Jul Sabroe <frederikns at gmail dot com>
# Contributor: adament <adament@adament.net>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=stavekontrolden
pkgver=2.7.268
pkgrel=1
pkgdesc="Stavekontrolden Danish dictionaries; for use with nuspell/hunspell, hyphen, libmythes, LibreOffice, and OpenOffice"
arch=('any')
url='https://stavekontrolden.dk/'
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=(
  'hunspell: the spell checking libraries and apps'
  'hyphen: for use of hyphenation rules'
  'libmythes: for use of thesaurus dictionary')
makedepends=('libarchive')
provides=('libreoffice-extension-da_dk' 'openoffice-extension-da_dk' 'hunspell-da' 'hyphen-da' 'mythes-da')
conflicts=("${provides[@]}")
source=("https://stavekontrolden.dk/dictionaries/da_DK/da_DK-$pkgver.oxt")
b2sums=('37325530db1b742bf38c297dbdf0f57791076ba8e72ee07f1bd087f3a6b2d6c705d96ddfecfccbdcfa1fc8e0b0e1c5f62bcb3801719e787731c3ddea7a8f9fb2')

package() {
  # LibreOffice extension
  _extension_dir="${pkgdir}"/usr/lib/libreoffice/share/extensions/da_DK
  install -dm755 "${_extension_dir}"
  bsdtar -xf da_DK-$pkgver.oxt -C "${_extension_dir}"/

  # Symlink for OpenOffice
  install -dm755 "${pkgdir}"/opt/openoffice4/share/extensions
  ln -s /usr/lib/libreoffice/share/extensions/da_DK "${pkgdir}"/opt/openoffice4/share/extensions/da_DK

  # set types and make directories
  _types=('hunspell' 'hyphen' 'mythes')
  for type in "${_types[@]}"; do
    install -dm755 "${pkgdir}"/usr/share/$type
  done

  _link_dir=../../lib/libreoffice/share/extensions/da_DK

  # hunspell
  ln -s $_link_dir/da_DK.dic "${pkgdir}"/usr/share/hunspell/da_DK.dic
  ln -s $_link_dir/da_DK.aff "${pkgdir}"/usr/share/hunspell/da_DK.aff

  # hyphen
  ln -s $_link_dir/hyph_da_DK.dic "${pkgdir}"/usr/share/hyphen/hyph_da_DK.dic
  ln -s $_link_dir/hyph_da_DK.dic "${pkgdir}"/usr/share/hyphen/hyph_da.dic

  # thesaurus (mythes)
  ln -s $_link_dir/th_da_DK.dat "${pkgdir}"/usr/share/mythes/th_da_DK.dat
  ln -s $_link_dir/th_da_DK.idx "${pkgdir}"/usr/share/mythes/th_da_DK.idx

  # myspell/dicts symlinks
  install -dm755 "${pkgdir}"/usr/share/myspell/dicts
  pushd "$pkgdir"/usr/share/myspell/dicts > /dev/null
    for type in "${_types[@]}"; do
      for file in "${pkgdir}"/usr/share/$type/*; do
        ln -Ls ../../$type/"$(basename $file)" .
      done
    done
  popd > /dev/null

  install -dm755 "${pkgdir}"/usr/share/doc/$pkgname
  ln -s ../$_link_dir/README_da_DK.txt "${pkgdir}"/usr/share/doc/$pkgname/README_da_DK.txt
  ln -s ../$_link_dir/HYPH_da_DK_README.txt "${pkgdir}"/usr/share/doc/$pkgname/HYPH_da_DK_README.txt
  install -dm755 "${pkgdir}"/usr/share/licenses/$pkgname
  ln -s ../$_link_dir/README_da_DK.txt "${pkgdir}"/usr/share/licenses/$pkgname/README_da_DK.txt
  ln -s ../$_link_dir/HYPH_da_DK_README.txt "${pkgdir}"/usr/share/licenses/$pkgname/HYPH_da_DK_README.txt
}
