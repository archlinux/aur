#Maintainer: Archydan <daniel at dragusanu dot net>
#Contributor: Guglielmo De Concini <guglielmo dot deconcini at gmail dot com>

_dirname=rpm_1.01_20110222
_rpmname=Xerox-Phaser_6000_6010-1.0-1.i686.rpm

pkgname=xerox-phaser-6000-6010
pkgver=1.01
pkgrel=3
pkgdesc="Driver for Xerox Phaser 6000/6010 color laser printer"
url="http://www.support.xerox.com/support/phaser-6000/downloads/engb.html?operatingSystem=linux&fileLanguage=en_GB"
license=('custom:"XeroxEULA"')
arch=('i686' 'x86_64')
depends=('cups')
if test "$CARCH" == x86_64; then
  depends=("${depends}" lib32-libcups lib32-libstdc++5 lib32-libtiff lib32-libpng)
fi
if test "$CARCH" == i686; then
  depends=("${depends}" libcups libstdc++5 libtiff libpng)
fi
makedepends=('rpmextract' 'libtool' 'dialog')
source=("6000_6010_rpm_1.01_20110222.zip::http://www.support.xerox.com/support/phaser-6000/file-redirect/enus.html?operatingSystem=linux&fileLanguage=en&contentId=116070")
md5sums=('f19dfec3afec150b797b773bbbe0eefe')

prepare() {
  dialog --title "End User License Agreement" --scrollbar --exit-label "Next"\
  --textbox ${startdir}/XeroxEULA \
  200 100

if dialog --title "EULA ACCEPTANCE" --yesno "Do you accept the End User License Agreement?" 5 50; then
  echo "You have accepted the EULA. Install continues..."
else
  echo "You must accept the EULA to continue. Aborting!"
  rm -r ${srcdir}
  rm ${startdir}/6000_6010_rpm_1.01_20110222.zip
  exit
fi
}


build() {
  cd ${srcdir}/${_dirname}
  rpmextract.sh ${_rpmname}
}

package() {
  cd ${srcdir}/${_dirname}
  cp -r usr ${pkgdir}
  install -D -m644 ${startdir}/XeroxEULA "${pkgdir}/usr/share/licenses/${pkgname}/XeroxEULA"
}
