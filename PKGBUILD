# Maintainer: Ivan <hideaki02@gmail.com>
pkgname=displaylink
pkgver=1.0.68
pkgrel=1
pkgdesc="DisplayLink DL-5xxx, DL-41xx and DL-3x00 Driver for Linux"
arch=('i686' 'x86_64')
url="http://www.displaylink.com/downloads/ubuntu.php"
license=('custom' 'GPL2' 'LGPL2.1')
groups=()
depends=('dkms')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=(http://downloads.displaylink.com/publicsoftware/DisplayLink-Ubuntu-$pkgver.zip 99-displaylink.rules displaylink.service)
noextract=()
md5sums=('3589332fd5ad70b3d24d9bc512d78b48'
         'b3919af46369e551f94589e1d1c799ec'
         '7e18667b7c0ca55d977a6a3ebbe1cbfe')

build() {
  chmod +x displaylink-driver-$pkgver.run
  ./displaylink-driver-$pkgver.run --target $pkgname-$pkgver --noexec
  cp 99-displaylink.rules $pkgname-$pkgver
  cp displaylink.service $pkgname-$pkgver
}

package() {
  cd "$pkgname-$pkgver"
  
  COREDIR=$pkgdir/usr/lib/displaylink
  LOGSDIR=$pkgdir/var/log/displaylink
  mkdir -p $COREDIR
  mkdir -p $LOGSDIR
  chmod 0755 $COREDIR
  chmod 0750 $LOGSDIR
  
  echo "Configuring EVDI DKMS module"
  SRCDIR=$pkgdir/usr/src/evdi-$pkgver
  mkdir -p "$SRCDIR"
  tar xf "evdi-$pkgver-src.tar.gz" -C "$SRCDIR"

  if [ "$CARCH" == "i686" ]; then
    ARCH="x86"
  elif [ "$CARCH" == "x86_64" ]; then
    ARCH="x64"
  fi
  local DLM="$ARCH/DisplayLinkManager"
  echo "Installing $DLM"
  cp -f $DLM $COREDIR

  echo "Installing libraries"
  local LIBEVDI="$ARCH/libevdi.so"
  local LIBUSB="$ARCH/libusb-1.0.so.0.1.0"

  mv -f $LIBEVDI $COREDIR
   mv -f $LIBUSB $COREDIR
  ln -s /usr/lib/displaylink/libusb-1.0.so.0.1.0 $COREDIR/libusb-1.0.so.0
  ln -s /usr/lib/displaylink/libusb-1.0.so.0.1.0 $COREDIR/libusb-1.0.so

  chmod 0755 $COREDIR/DisplayLinkManager
  chmod 0755 $COREDIR/libevdi.so
  chmod 0755 $COREDIR/libusb-1.0.so.0.1.0

  echo "Installing firmware packages"
  cp -f *.spkg $COREDIR
  chmod 0644 $COREDIR/*.spkg

  echo "Installing license file"
  cp -f LICENSE $COREDIR
  chmod 0644 $COREDIR/LICENSE

  echo "Adding udev rule for DisplayLink DL-3xxx/5xxx devices"
  mkdir -p $pkgdir/etc/udev/rules.d/
  cp 99-displaylink.rules $pkgdir/etc/udev/rules.d/
  chmod 0644 $pkgdir/etc/udev/rules.d/99-displaylink.rules

  echo "Installing DLM systemd service"
  mkdir -p $pkgdir/usr/lib/systemd/system/
  cp displaylink.service $pkgdir/usr/lib/systemd/system/
  chmod 0644 $pkgdir/usr/lib/systemd/system/displaylink.service
}

