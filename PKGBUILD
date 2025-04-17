# Maintainer: Harrison <contact@htv04.com>

_pkgname="facetimehd-data"
pkgname="$_pkgname"
pkgver=5.1.5769
pkgrel=2
pkgdesc='Sensor calibration data for the FacetimeHD (Broadcom 1570) PCIe webcam'
url='https://github.com/patjak/facetimehd'
license=('LicenseRef-Apple')
arch=('any')

makedepends=('7zip')

source=('https://download.info.apple.com/Mac_OS_X/031-30890-20150812-ea191174-4130-11e5-a125-930911ba098f/bootcamp5.1.5769.zip')
sha256sums=('4ede2c8ef240708c850237a3e5911094ed6adae1734258e4639bc9069a814b1e')

# Based on instructions from https://github.com/patjak/facetimehd/wiki/Extracting-the-sensor-calibration-files
build() {
  # Extract AppleCamera64 data
  cd "BootCamp/Drivers/Apple"
  7z x "AppleCamera64.exe"

  # Extract sensor calibration data
  mkdir -p "$srcdir/$pkgname"
  dd bs=1 skip=1663920 count=33060 if='AppleCamera.sys' of="$srcdir/$pkgname/9112_01XX.dat"
  dd bs=1 skip=1644880 count=19040 if='AppleCamera.sys' of="$srcdir/$pkgname/1771_01XX.dat"
  dd bs=1 skip=1606800 count=19040 if='AppleCamera.sys' of="$srcdir/$pkgname/1871_01XX.dat"
  dd bs=1 skip=1625840 count=19040 if='AppleCamera.sys' of="$srcdir/$pkgname/1874_01XX.dat"
}

package() {
  # Install facetimehd-data
  for FILE in '9112' '1771' '1871' '1874'; do
    install -Dm644 "$pkgname/${FILE}_01XX.dat" "$pkgdir/usr/lib/firmware/facetimehd/${FILE}_01XX.dat"
  done

  # Install licenses
  for FILE in 'Arabic' 'BrazilianPortuguese' 'Czech' 'Danish' 'Dutch' 'English' 'Finnish' 'French' 'German' 'Hungarian' 'Italian' 'Japanese' 'Korean' 'Norwegian' 'Polish' 'Portuguese' 'Russian' 'SimplifiedChinese' 'Spanish' 'Swedish' 'TraditionalChinese' 'Turkish'; do
    install -Dm644 "BootCamp/Drivers/Apple/${FILE}License.txt" "$pkgdir/usr/share/licenses/$pkgname/${FILE}License.txt"
  done
}
