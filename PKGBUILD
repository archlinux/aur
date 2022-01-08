# Contributor: rHermes <teodor_spaeren@riseup.net>
# Contributor: bnavigator <code@bnavigator.de>
# Contributor: PlusMinus
# Contributor: rhabbachi

_pkgver=5.5.0-beta-59.118
pkgname=displaylink-beta
pkgver=5.5.0
pkgrel=1
pkgdesc="Linux driver for DL-6xxx, DL-5xxx, DL-41xx and DL-3x00"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.synaptics.com/products/displaylink-graphics"
license=('custom' 'GPL2' 'LGPL2.1')
depends=('evdi>=1.9.1'
         'libusb>=1.0.0')
makedepends=('grep' 'gawk' 'wget')
conflicts=('displaylink')
source=(displaylink-driver-${pkgver}.zip::https://www.synaptics.com/sites/default/files/exe_files/2021-12/DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu%20%28Beta%295.5%20Beta-EXE.zip
        DISPLAYLINK-EULA
        udev.sh
        99-displaylink.rules 
	      displaylink.service 
        displaylink-sleep.sh)
sha256sums=('aaa6f2c6d8c4492d18cf670466f4bbf6d1ccdbb3c39ccc4ca20b4e5bc3352d56'
            '2f81fea43332a62b2cf1dd47e56ea01caf1e886bcd16c3f82b18bfe148fb21a9'
            'dc41ae8a2c287fc50fdda65bad8b0ffd76726f7773c25e1b0c5b7de95cecbdb6'
            'c08a4726cf4e2f92c7cab00168ae9cc8d69d36a67c570609396a4a674934245a'
            '342e83abfe2a38d5635ea928345e933d2ad127ebd3f7caca476663d4f583684b'
            '8be4ab7616e38f91746bdd3e7fafe9004322a8be8e6722389746df9868d576e0')

package() {
  echo "Adding udev rule for DisplayLink DL-3xxx/5xxx devices"
  install -D -m644 99-displaylink.rules "$pkgdir/etc/udev/rules.d/99-displaylink.rules"
  install -D -m755 udev.sh "$pkgdir/opt/displaylink/udev.sh"

  echo "Installing DLM systemd service"
  install -D -m644 displaylink.service "$pkgdir/usr/lib/systemd/system/displaylink.service"
  install -D -m755 displaylink-sleep.sh "$pkgdir/usr/lib/systemd/system-sleep/displaylink.sh"
  
  COREDIR="$pkgdir/usr/lib/displaylink"
  install -d -m755 $COREDIR
  install -d -m755 "$pkgdir/var/log/displaylink"

  echo "Extracting DisplayLink Driver Package"
  pushd $srcdir
  chmod +x displaylink-driver-${_pkgver}.run
  ./displaylink-driver-${_pkgver}.run \
     --noexec \
     --target $pkgname-$pkgver \
     --nox11 \
     --noprogress
  test -d $pkgname-$pkgver || (echo "Extracting the driver with the .run installer failed"; exit 1)
  pushd $pkgname-$pkgver
  
  case $CARCH in
    i686)
      ARCH="x86-ubuntu-1604" ;;
    x86_64)
      ARCH="x64-ubuntu-1604" ;;
    arm|armv6h|armv7h|aarch64)
      ARCH="arm-linux-gnueabihf" ;;
  esac
  
  echo "Installing DisplayLink Manager $ARCH"
  install -D -m755 $ARCH/DisplayLinkManager $COREDIR/DisplayLinkManager

  echo "Installing firmware packages"
  install -D -m644 *.spkg $COREDIR

  echo "Installing license file"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  popd
  popd
  install -D -m644 DISPLAYLINK-EULA "${pkgdir}/usr/share/licenses/${pkgname}/DISPLAYLINK-EULA"
}
