# Maintainer:  E_D3V <eric2043@gmail.com>
# Contributor: ptr1337
# Contributor: aliu
# Contributor: endorfina <emilia@carcosa.space>
# Contributor: rHermes <teodor_spaeren@riseup.net>
# Contributor: bnavigator <code@bnavigator.de>
# Contributor: PlusMinus
# Contributor: rhabbachi

pkgname=displaylink-runit
pkgver=6.1.1
_releasedate=2025-04
_pkgfullver=6.1.1-17
pkgrel=2
pkgdesc="Linux driver for DL-6xxx, DL-5xxx, DL-41xx and DL-3x00"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.synaptics.com/products/displaylink-graphics"
license=('custom' 'GPL2' 'LGPL2.1')
conflicts=('displaylink')
depends=('evdi<1.15'
         'libusb'
         'elogind'
         'elogind-runit')
optdepends=('dmidecode: For DLSupport.sh')
makedepends=('grep' 'gawk' 'wget')
changelog="displaylink-release-notes-${pkgver}.txt"
source=(displaylink-driver-${pkgver}.zip::https://www.synaptics.com/sites/default/files/exe_files/${_releasedate}/DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu${pkgver}-EXE.zip
        "$changelog"
        DISPLAYLINK-EULA
        udev.sh
        99-displaylink.rules
	      displaylink.runit
        displaylink-log.runit
        displaylink-sleep.sh)
sha256sums=('ca2230e940ce2d5d4bba3c61015b1f8c803985efbef16d36dbe10afce653c172'
            '2d9ef22e7aa9202e7490d033be461a3d2b2fc3b599ca1ab83ede8c53fc2206c6'
            '2f81fea43332a62b2cf1dd47e56ea01caf1e886bcd16c3f82b18bfe148fb21a9'
            '5f89c3153bd090b17394449ef6a7d7c854e865773dfef7e7a35259129d3445d9'
            '530c488fa9b2833ff64611ff2b533f63212a85f8ebed446d5a4d51cf9a52c7ea'
            'bf14a9fd6d7b2b6047647d1f6fdc6ee85bcfb0ac2e62af5d90e10e293fb4a741'
            'e2629548e67e4e72268bdd5a3cdf2917d6f8e58ff7f049dfc3810c1684851541'
            '647b2c165768c29371b7c8356174bc330c795347495636e269f0d4a33b7d726d')
install="$pkgname.install"

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

  echo "Installing DLM runit service"
  install -Dm744 displaylink.runit "$pkgdir/etc/runit/sv/displaylink/run"
  install -D -m755 displaylink-sleep.sh "$pkgdir/etc/elogind/sleep.d/99-displaylink.sh"

  echo "Installing runit log service"
  install -Dm755 displaylink-log.runit "$pkgdir/etc/runit/sv/displaylink-log/run"
  install -d -m755 "$pkgdir/var/log/displaylink"

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

