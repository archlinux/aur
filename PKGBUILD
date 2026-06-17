# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname=aaronia-mcs
pkgver=2.1.5
pkgrel=4
pkgdesc="Aaronia AG - MCS Spectrum Analyzer Software."
url=http://www.aaronia.de
arch=(x86_64)
license=(GPL)
depends=('qt6-base' 'qt6-multimedia')
makedepends=('curl' 'binutils' 'coreutils')
provides=(aaronia-mcs)
conflicts=(aaronia-mcs)

source=()
sha512sums=()

prepare() {
  # Download file using fake http headers due to website enforcement rules
  curl -A "Mozilla/5.0 (ArchLinux; PKGBUILD; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36" \
       -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" \
       -H "Accept-Language: en-US,en;q=0.9" \
       https://downloads.aaronia.com/software/V4/linux/deb64/aaronia-mcs.$pkgver-$CARCH.deb \
       --output aaronia-mcs.$pkgver-$CARCH.deb

  # Check sha512sum
  local sha512sum="18556640fc0e65be417e7730320754cf37f54450042b8cd85ba11d49bd6a0e5cda1a3d37f2e1aced435a22cc14dee49e30565870bcf79d5a84d2fb93a2568a0f"
  local hash=$(sha512sum "aaronia-mcs.$pkgver-$CARCH.deb" | awk '{print $1}')
   if [ "$hash" != "$sha512sum" ]; then
    echo "Error: Checksum mismatch!"
    echo "Expected: $sha512sum"
    echo "Got:      $hash"
    exit 1
  else
    echo "sha512sum: validated"
   fi
  # Extract file
  ar x "aaronia-mcs.$pkgver-$CARCH.deb"
}


package() {
  tar -xf data.tar.xz -C "$pkgdir" ./opt
  rm -rf $pkgdir/opt/aaronia
	chmod 755 $pkgdir/opt
  mkdir -p $pkgdir/usr/share/applications
  mv $pkgdir/opt/Aaronia/MCS/share/applications/aaronia*.desktop $pkgdir/usr/share/applications/
}
