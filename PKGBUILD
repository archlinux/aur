# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Frederik Nordahl Jul Sabroe <frederikns at gmail dot com>
# Contributor: adament <adament@adament.net>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=stavekontrolden
pkgver=2.8.090
pkgrel=1
pkgdesc="Stavekontrolden Danish dictionaries; for use with nuspell/hunspell, hyphen, libmythes, LibreOffice, and OpenOffice"
arch=('any')
url='https://stavekontrolden.dk/'
license=('GPL-3.0-only AND (GPL-2.0-only AND LGPL-2.1-only AND MPL-1.1)')
optdepends=(
  'hunspell: the spell checking libraries and apps'
  'hyphen: for use of hyphenation rules'
  'libmythes: for use of thesaurus dictionary')
makedepends=('libarchive' 'coreutils' 'findutils')
provides=('libreoffice-extension-da_dk' 'openoffice-extension-da_dk' 'hunspell-da' 'hyphen-da' 'mythes-da')
conflicts=("${provides[@]}")
source=("https://stavekontrolden.dk/dictionaries/da_DK/da_DK-$pkgver.oxt")
b2sums=('c372d3fae6197b6d1749ac0029fe28fc5ed044d261de4bb5f44606f341e40a29f1b19e916444c7005eb746a468adff956a1780a7972844d1e14bb182a28b1515')

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

  # Remove world writable bits
  chmod --recursive go-w "${pkgdir}"
  # Remove executable bits
  find "${pkgdir}"/ -type f -exec chmod -x {} +
}
