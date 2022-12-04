# Maintainer: Theowhy <aur.theowhy@shizoku.fr>
# Contributor: jpkotta
pkgname=mfgtools
pkgver=1.5.11
pkgrel=1
pkgdesc="Freescale/NXP I.MX Chip image deploy tools"
arch=(x86_64)
url="https://github.com/NXPmicro/mfgtools"
license=('BSD')
depends=('bzip2' 'zlib' 'libusb' 'libzip' 'openssl')
makedepends=('cmake')
changelog=History.md
source=(https://github.com/NXPmicro/mfgtools/releases/download/uuu_$pkgver/uuu_source-$pkgver.tar.gz uuu-complete.bash)
sha256sums=('932c0a4acde0f52b907f5693c6d133c83142c4ca6e9df05a38b3ac1e50628883'
            'ffc8e32655ce574a4719c85c5c9a3530a5ec619e933fc801a291df8ec506a442')


build() {
  cd "uuu-$pkgver"
  # Remove useless folders to make
  rm -Rf -- bzip2 libusb msvc zlib
  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "uuu-$pkgver/build"

  make DESTDIR="$pkgdir/" install

  comp_dir="$pkgdir"/etc/bash_completion.d/
  install -d -m 755 "$comp_dir"
  install -m 644 "$srcdir"/uuu-complete.bash "$comp_dir"/uuu-complete.bash

  ./uuu/uuu -udev > 99-uuu.rules
  udev_dir="$pkgdir"/usr/lib/udev/rules.d/
  install -d -m 755 "$udev_dir"
  install -m 644 99-uuu.rules "$udev_dir"/99-uuu.rules

  lic_dir="$pkgdir"/usr/share/licenses/mfgtools/
  install -d -m 755 "$lic_dir"
  install -m 644 ../LICENSE "$lic_dir"/LICENSE
}
