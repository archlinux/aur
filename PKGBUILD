# MAINTAINER: winlu <derwinlu AT gmail DOT com>
pkgname=soundsense
_pkgver="2015-1_194"
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="SoundSense is a sound-engine tool for Dwarf Fortress."
arch=("any")
url="http://df.zweistein.cz/soundsense/"
license=("custom")
install="soundsense.install"
depends=("java-runtime")
makedepends=("coreutils"
             "unzip")
source=("http://df.zweistein.cz/soundsense/soundSense_${_pkgver}.zip"
        "soundsense.install")
md5sums=('95eebf4bdd0e048e217288b80aaae658'
         '15fd5fb1136348807f7f5351887b3ef9')

DEST="/opt/soundsense"

prepare() {
  cd $srcdir/$pkgname

  # fix line breaks
  sed -i $'s/\r$//' soundSense.sh
  # set correct working dir
  sed -i 's:${0\%/\*}:'"${DEST}"':' soundSense.sh

  unzip -q -o packSkeletons.zip
}

package() {
  # install runner
  install -Dm755 ${srcdir}/${pkgname}/soundSense.sh $pkgdir/usr/bin/soundsense
  # rm unneeded files
  rm $srcdir/$pkgname/*.{cmd,exe,zip,sh}
  # copy over and set permissions
  install -dm755 -o root -g games ${pkgdir}${DEST}
  cp -r $srcdir/$pkgname/. ${pkgdir}${DEST}
  chown root:games -R ${pkgdir}${DEST}
  find ${pkgdir}${DEST}/ -type d -exec chmod 6775 {} +
  find ${pkgdir}${DEST}/ -type f -exec chmod 664 {} +
}

# vim:set ts=2 sw=2 et:
