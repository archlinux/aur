# Maintainer: eric-dev <eric2043@gmail.com>
# Contributor: rHermes <teodor_spaeren@riseup.net>
# Contributor: bnavigator <code@bnavigator.de>
# Contributor: PlusMinus
# Contributor: rhabbachi

pkgname=displaylink-runit
pkgver=5.8
_releasedate=2023-08
_pkgfullver=5.8.0-63.33
pkgrel=1
pkgdesc="Linux driver for DL-6xxx, DL-5xxx, DL-41xx and DL-3x00"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.synaptics.com/products/displaylink-graphics"
license=('custom' 'GPL2' 'LGPL2.1')
conflicts=('displaylink')
depends=('evdi<1.15.0'
         'libusb')
makedepends=('grep' 'gawk' 'wget')
changelog="displaylink-release-notes-${pkgver}.txt"
source=(displaylink-driver-${pkgver}.zip::https://www.synaptics.com/sites/default/files/exe_files/${_releasedate}/DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu${pkgver}-EXE.zip
        displaylink-release-notes-${pkgver}.txt
        DISPLAYLINK-EULA
        udev.sh
        99-displaylink.rules
        displaylink.run)
sha256sums=('22c552ead448c80d9e8dd48a842bb511184d07a74180ac76bd89dd144ddda816'
            'b5a1a75b2042cd5efb475b53f1ead5207f706c6eb45f4572d7b226ffcdee3ee9'
            '2f81fea43332a62b2cf1dd47e56ea01caf1e886bcd16c3f82b18bfe148fb21a9'
            'c844f324ba0be36a3960e09e6db09dee108e18ca94f05135b0215b6e9e7406ed'
            'c08a4726cf4e2f92c7cab00168ae9cc8d69d36a67c570609396a4a674934245a'
            'bf14a9fd6d7b2b6047647d1f6fdc6ee85bcfb0ac2e62af5d90e10e293fb4a741')

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
  echo "Adding udev rule for DisplayLink DL-3xxx/5xxx devices"
  install -D -m644 99-displaylink.rules "$pkgdir/etc/udev/rules.d/99-displaylink.rules"
  install -D -m755 udev.sh "$pkgdir/opt/displaylink/udev.sh"

  echo "Installing DLM runit service"

  install -Dm744 displaylink.run "$pkgdir/etc/runit/sv/displaylink/run"

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
