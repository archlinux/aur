# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Frederik Nordahl Jul Sabroe <frederikns at gmail dot com>
# Contributor: adament <adament@adament.net>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=stavekontrolden
pkgver=2.8.055
pkgrel=1
pkgdesc="Stavekontrolden Danish dictionaries; for use with nuspell/hunspell, hyphen, libmythes, LibreOffice, and OpenOffice"
arch=('any')
url='https://stavekontrolden.dk/'
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=(
  'hunspell: the spell checking libraries and apps'
  'hyphen: for use of hyphenation rules'
  'libmythes: for use of thesaurus dictionary')
makedepends=('libarchive' 'coreutils' 'findutils')
provides=('libreoffice-extension-da_dk' 'openoffice-extension-da_dk' 'hunspell-da' 'hyphen-da' 'mythes-da')
conflicts=("${provides[@]}")
source=("https://stavekontrolden.dk/dictionaries/da_DK/da_DK-$pkgver.oxt")
b2sums=('58dbe207575380e856e95482ac1491f84f87e6ca61635c5589d816974e5d9319dc4116c65e4454c90b58103393d2e25b3b5ae1726843172c15fe144791a0d0c4')

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
