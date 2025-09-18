# Maintainer: endorfina <emilia@carcosa.space>
# Contributor: rHermes <teodor_spaeren@riseup.net>
# Contributor: bnavigator <code@bnavigator.de>
# Contributor: PlusMinus
# Contributor: rhabbachi

pkgname=displaylink
pkgver=6.2
_releasedate=2025-09
_pkgfullver=6.2.0-30
pkgrel=1
pkgdesc="Linux driver for DisplayLink devices"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.synaptics.com/products/displaylink-graphics"
license=('custom' 'GPL2' 'LGPL2.1')
depends=('evdi<1.15'
         'libusb')
makedepends=('grep' 'gawk' 'wget')
changelog="displaylink-release-notes-${pkgver}.txt"
source=(displaylink-driver-${pkgver}.zip::https://www.synaptics.com/sites/default/files/exe_files/${_releasedate}/DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu${pkgver}-EXE.zip
        "$changelog"
        DISPLAYLINK-EULA
        udev.sh
        99-displaylink.rules
	displaylink.service
        displaylink-sleep.sh)
sha256sums=('2503bb784cf8a5da0f921727f6d22ecb94782b27ec0a78aec3a797c3facb6981'
            '64071e9eea7e1ac728f2f6b2ee97f78c11c80cb99ddbe67a491b3aafc8151739'
            '2f81fea43332a62b2cf1dd47e56ea01caf1e886bcd16c3f82b18bfe148fb21a9'
            '53aac00fecfc04ec9e3d88ea13f5bf7bb05f669ff33e1834ba671f9240fe9641'
            '530c488fa9b2833ff64611ff2b533f63212a85f8ebed446d5a4d51cf9a52c7ea'
            '342e83abfe2a38d5635ea928345e933d2ad127ebd3f7caca476663d4f583684b'
            '9b4609423fd9cfaa8cad8acd086dd6b92cd09182facbb28792affeac1ecc4a45')

prepare() {
  chmod +x displaylink-driver-${_pkgfullver}.run
  ./displaylink-driver-${_pkgfullver}.run \
     --noexec \
     --target $pkgname-$pkgver \
     --nox11 \
     --noprogress
  if [[ ! -d $pkgname-$pkgver ]]
  then
    echo "Extracting the driver with the .run installer failed"
    exit 1
  fi
}

package() {
  echo "Adding udev rule for DisplayLink devices"
  install -D -m644 99-displaylink.rules "$pkgdir/usr/lib/udev/rules.d/99-displaylink.rules"
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

  echo "Installing DLSupportTool"
  install -D -m755 DLSupportTool.sh "$pkgdir/usr/bin/DLSupportTool.sh"

  echo "Installing license file"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  popd
  install -D -m644 DISPLAYLINK-EULA "${pkgdir}/usr/share/licenses/${pkgname}/DISPLAYLINK-EULA"
}
