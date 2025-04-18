# Maintainer: Harrison <contact@htv04.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname="facetimehd-firmware"
pkgname="$_pkgname"
pkgver=1.43_5
pkgrel=1
epoch=1
pkgdesc='Firmware for the FacetimeHD (Broadcom 1570) PCIe webcam'
url='https://github.com/patjak/facetimehd-firmware'
license=('LicenseRef-Apple')
arch=('any')

makedepends=(
  'cpio'
  'xz'
)

conflicts=('bcwc-pcie-firmware')
provides=('bcwc-pcie-firmware')

_pkgsrc="$_pkgname"
source=('LicenseRef-Apple.tar.xz')
sha256sums=('SKIP')

build() {
  local URL RANGE OSX_DRV OSX_DRV_DIR FILE DRV_HASH FW_HASH OFFSET SIZE
  URL="https://updates.cdn-apple.com/2019/cert/041-88431-20191011-e7ee7d98-2878-4cd9-bc0a-d98b3a1e24b1/OSXUpd10.11.5.dmg"
  RANGE=204909802-207733123
  OSX_DRV=AppleCameraInterface
  OSX_DRV_DIR=System/Library/Extensions/AppleCameraInterface.kext/Contents/MacOS
  FILE="$OSX_DRV_DIR/$OSX_DRV"

  DRV_HASH=f56e68a880b65767335071531a1c75f3cfd4958adc6d871adf8dbf3b788e8ee1
  FW_HASH=e3e6034a67dfdaa27672dd547698bbc5b33f47f1fc7f5572a2fb68ea09d32d3d

  OFFSET=81920
  SIZE=603715

  echo "Downloading driver..."
  curl -k -L -r "$RANGE" "$URL" | xzcat -qq -Q | cpio --format odc -i -d "./$FILE" &> /dev/null || true
  mv "$FILE" .

  echo "Extracting firmware..."
  dd bs=1 skip=$OFFSET count=$SIZE if=./$OSX_DRV of=./firmware.bin.gz &> /dev/null
  gunzip ./firmware.bin.gz

  cat > firmware.sha256 << END
$DRV_HASH  $OSX_DRV
$FW_HASH  firmware.bin
END
}

check() {
  sha256sum -c firmware.sha256
}

package() {
  install -Dm644 firmware.bin -t "$pkgdir/usr/lib/firmware/facetimehd/"
  install -Dm644 LicenseRef-Apple/*.rtf -t "$pkgdir/usr/share/licenses/$pkgname/"
}
