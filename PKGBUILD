# Maintainer: endorfina <emilia@carcosa.space>
# Contributor: rHermes <teodor_spaeren@riseup.net>
# Contributor: bnavigator <code@bnavigator.de>
# Contributor: PlusMinus
# Contributor: rhabbachi

pkgname=displaylink
pkgver=6.3
_releasedate=2026-06
_pkgfullver=6.3.0-48
pkgrel=2
pkgdesc="Linux driver for DisplayLink devices"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.synaptics.com/products/displaylink-graphics"
license=('custom' 'GPL2' 'LGPL2.1')
depends=('evdi<1.16'
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
sha256sums=('7269856c7527060c513215ce1b5a36fef074d8e89cab89bcab13df342acce098'
            'eb1dddc973eee7ca6c7d213c9be8ebca89701e47782fe8340ab4957d6d4cb66c'
            '2f81fea43332a62b2cf1dd47e56ea01caf1e886bcd16c3f82b18bfe148fb21a9'
            'f46839b1f5a1642392c739c3044177f70dd313e7e14db7b121509fa73c91107d'
            '35b5c5cf24c0b43cbcb054e8547a2a6966ad764de40208d5364b8d57d793a635'
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
