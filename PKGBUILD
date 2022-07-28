# Maintainer: Munzir Taha <munzirtaha at gmail dot com>

pkgname=hunspell-ar
pkgver=3.5
pkgrel=3
pkgdesc="Arabic dictionary for hunspell"
arch=(any)
url="http://ayaspell.sourceforge.net"
license=('GPL' 'LGPL' 'MPL')
makedepends=('qt6-webengine')
optdepends=('hunspell: the spell checking libraries and apps')
source=(http://downloads.sourceforge.net/project/ayaspell/${pkgname}_${pkgver}.2014-11-08.zip)
sha256sums=('966faf94e7d05d52e9afdd20b266e28932edf5b32fe26aa83d554d6a2c6021ea')

package() {
  cd "$srcdir"
  # bdic dosn't support the IGNORE command yet
  sed -i '/^IGNORE/d' ar.aff
  install -vDm 644 ar.dic ar.aff -t "$pkgdir/usr/share/hunspell"

  pushd "$pkgdir/usr/share/hunspell/"
    ar_aliases="ar_AE ar_BH ar_DZ ar_EG ar_IN ar_IQ ar_JO ar_KW ar_LB ar_LY ar_MA ar_OM ar_QA ar_SA ar_SD ar_SY ar_TN ar_YE"
    for lang in $ar_aliases; do
      ln -s ar.aff $lang.aff
      ln -s ar.dic $lang.dic
    done
  popd

  # Install webengine dictionary
  install -d "$pkgdir"/usr/share/qt{,6}/qtwebengine_dictionaries/
  for _file in "$pkgdir"/usr/share/hunspell/*.dic; do
  _filename=$(basename $_file)
    /usr/lib/qt6/qwebengine_convert_dict $_file "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic}
  ln -rs "$pkgdir"/usr/share/qt6/qtwebengine_dictionaries/${_filename/\.dic/\.bdic} "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
  done

  # myspell symlinks
  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  pushd "$pkgdir/usr/share/myspell/dicts"
    for file in "$pkgdir/usr/share/hunspell/"*; do
      ln -sv "/usr/share/hunspell/$(basename "$file")" .
    done
  popd

  # docs
  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 AUTHORS ChangeLog* README* TODO* "$pkgdir/usr/share/doc/$pkgname/"
}
