# Maintainer : Pim Bliek <pim@pimbliek.nl>
# Contributor : Elvin L <elvin@eelviny.me>

pkgname=rocrail
pkgver=03112022
pkgrel=1
pkgdesc="Innovative Model Railroad Control System"
arch=('x86_64')
url="http://wiki.rocrail.net/"
license=('Proprietary')
depends=('libusb' 'libsm' 'gtk3')
makedepends=('curl')
source=("https://wiki.rocrail.net/rocrail-snapshot/Debian/Rocrail-debian11-i64.zip")
md5sums=('SKIP')

pkgver() {
  # get buildnumber
  # curl -s https://wiki.rocrail.net/rocrail-snapshot/log.txt | head -n 1 | awk '{ print $1 }'
  # get builddate
  curl -s https://wiki.rocrail.net/rocrail-snapshot/ | grep -e '<a href="Debian/Rocrail-debian11-i64.zip"' | cut -d' ' -f 7 | rev | cut -c 1-8 | rev
}


package() {
  msg "Installing..."
  cd "$srcdir/"
  chmod -R 755 .
  mkdir -p $pkgdir/opt/rocrail
  cp -r * $pkgdir/opt/rocrail/.
  rm $pkgdir/opt/rocrail/*.zip
  chmod -R 755 $pkgdir/opt/rocrail

  TEMPFILE="rocrail.desktop"
  echo "[Desktop Entry]" > $TEMPFILE
  echo "Type=Application" >> $TEMPFILE
  echo "Version=$pkgver" >> $TEMPFILE
  echo "Name=Rocrail" >> $TEMPFILE
  echo "Comment=$pkgdesc" >> $TEMPFILE
  echo "Path=/opt/rocrail/" >> $TEMPFILE
  echo "Exec=/opt/rocrail/rocview.sh" >> $TEMPFILE
  echo "Icon=/opt/rocrail/rocrail.png" >> $TEMPFILE
  echo "Terminal=false" >> $TEMPFILE
  echo "Categories=Application;" >> $TEMPFILE

  chmod +x $TEMPFILE
  mkdir -p $pkgdir/usr/share/applications
  cp -p $TEMPFILE $pkgdir/usr/share/applications/.
  mkdir -p $pkgdir/usr/share/pixmaps
  cp -p rocrail.png $pkgdir/usr/share/pixmaps/.
}
