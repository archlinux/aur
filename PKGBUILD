# Maintainer: endorfina <emilia@carcosa.space>
# Contributor: rHermes <teodor_spaeren@riseup.net>
# Contributor: bnavigator <code@bnavigator.de>
# Contributor: PlusMinus
# Contributor: rhabbachi

pkgname=displaylink
pkgver=5.8
_releasedate=2023-08
_pkgfullver=5.8.0-63.33
pkgrel=0
pkgdesc="Linux driver for DisplayLink devices"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.synaptics.com/products/displaylink-graphics"
license=('custom' 'GPL2' 'LGPL2.1')
depends=('evdi<1.15'
         'libusb')
makedepends=('grep' 'gawk' 'wget')
changelog="displaylink-release-notes-${pkgver}.txt"
source=(displaylink-driver-${pkgver}.zip::https://www.synaptics.com/sites/default/files/exe_files/${_releasedate}/DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu${pkgver}-EXE.zip
        displaylink-release-notes-${pkgver}.txt
        DISPLAYLINK-EULA
        udev.sh
        99-displaylink.rules
	displaylink.service
        displaylink-sleep.sh)
sha256sums=('22c552ead448c80d9e8dd48a842bb511184d07a74180ac76bd89dd144ddda816'
            '83167d307d030abc42f2bbe6ad6a23802433cf5d8fab50afb0d519036518f22b'
            '2f81fea43332a62b2cf1dd47e56ea01caf1e886bcd16c3f82b18bfe148fb21a9'
            'dc41ae8a2c287fc50fdda65bad8b0ffd76726f7773c25e1b0c5b7de95cecbdb6'
            '530c488fa9b2833ff64611ff2b533f63212a85f8ebed446d5a4d51cf9a52c7ea'
            '342e83abfe2a38d5635ea928345e933d2ad127ebd3f7caca476663d4f583684b'
            '8be4ab7616e38f91746bdd3e7fafe9004322a8be8e6722389746df9868d576e0')

prepare() {
  chmod +x displaylink-driver-${_pkgfullver}.run
  ./displaylink-driver-${_pkgfullver}.run \
     --noexec \
     --target $pkgname-$pkgver \
     --nox11 \
     --noprogress
  test -d $pkgname-$pkgver || (echo "Extracting the driver with the .run installer failed"; exit 1)
}

package() {
  echo "Adding udev rule for DisplayLink devices"
  install -D -m644 99-displaylink.rules "$pkgdir/etc/udev/rules.d/99-displaylink.rules"
  install -D -m755 udev.sh "$pkgdir/opt/displaylink/udev.sh"

  echo "Installing DLM systemd service"
  install -D -m644 displaylink.service "$pkgdir/usr/lib/systemd/system/displaylink.service"
  install -D -m755 displaylink-sleep.sh "$pkgdir/usr/lib/systemd/system-sleep/displaylink.sh"

  COREDIR="$pkgdir/usr/lib/displaylink"
  install -d -m755 "$COREDIR"
  install -d -m755 "$pkgdir/var/log/displaylink"

  pushd "$srcdir/$pkgname-$pkgver"

  case $CARCH in
    i686)
      ARCH="x86-ubuntu-1604" ;;
    x86_64)
      ARCH="x64-ubuntu-1604" ;;
    arm|armv6h|armv7h)
      ARCH="arm-linux-gnueabihf" ;;
    aarch64)
      ARCH="aarch64-linux-gnu" ;;
  esac

  echo "Installing DisplayLink Manager $ARCH"
  install -D -m755 "$ARCH/DisplayLinkManager" "$COREDIR/DisplayLinkManager"

  echo "Installing firmware packages"
  install -D -m644 ./*.spkg "$COREDIR"

  echo "Installing license file"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  popd
  install -D -m644 DISPLAYLINK-EULA "${pkgdir}/usr/share/licenses/${pkgname}/DISPLAYLINK-EULA"
}
