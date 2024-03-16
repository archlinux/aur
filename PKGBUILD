# Maintainer: Munzir Taha <munzirtaha at gmail dot com>

pkgname=hunspell-ar
pkgver=3.5
pkgrel=6
pkgdesc="Arabic dictionary for hunspell"
arch=(any)
url="http://ayaspell.sourceforge.net"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' 'MPL-1.1')
makedepends=('qt6-webengine')
optdepends=('hunspell: the spell checking libraries and apps')
source=(http://downloads.sourceforge.net/project/ayaspell/${pkgname}_${pkgver}.2014-11-08.zip)
sha256sums=('966faf94e7d05d52e9afdd20b266e28932edf5b32fe26aa83d554d6a2c6021ea')

package() {
  cd "$srcdir"
  install -vDm 644 ar.dic ar.aff -t "$pkgdir/usr/share/hunspell"

  # Install webengine dictionary; the IGNORE command is not supported by bdic (https://bugs.chromium.org/p/chromium/issues/detail?id=1374955)
  sed -i '/^IGNORE/d' ar.aff
  install -vd "$pkgdir"/usr/share/qt{,6}/qtwebengine_dictionaries/
  for _file in *.dic; do
    _filename=$(basename "$_file")
    /usr/lib/qt6/qwebengine_convert_dict "$_file" "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/"${_filename/\.dic/\.bdic}"
    ln -rs "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/"${_filename/\.dic/\.bdic}" "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
  done

  # myspell symlinks
  install -vdm755 "${pkgdir}/usr/share/myspell/dicts"
  pushd "$pkgdir/usr/share/myspell/dicts"
    for file in "$pkgdir/usr/share/hunspell/"*; do
      ln -sv "/usr/share/hunspell/$(basename "$file")" .
    done
  popd

  # docs
  install -vd "$pkgdir"/usr/share/doc/$pkgname
  install -vm644 AUTHORS ChangeLog-* README-* THANKS TODO-* install-* "$pkgdir/usr/share/doc/$pkgname/"
}
