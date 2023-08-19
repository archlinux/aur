# Maintainer: Theowhy <aur.theowhy@shizoku.fr>
# Contributor: jpkotta
# Contributor: jona
# Contributor: arti
pkgname=mfgtools
pkgver=1.5.21
pkgrel=2
pkgdesc="Freescale/NXP I.MX Chip image deploy tools"
arch=(x86_64)
url="https://github.com/NXPmicro/mfgtools"
license=('BSD')
depends=('bzip2' 'zlib' 'libusb' 'libzip' 'openssl')
makedepends=('cmake')
changelog=History.md
source=(https://github.com/NXPmicro/mfgtools/releases/download/uuu_$pkgver/uuu_source-$pkgver.tar.gz uuu-complete.bash uuu-cstdint.patch)
sha256sums=('600be50827b52df4dddf0c7d07da27b103a4576eb445890905c61780e3c36871'
            'ffc8e32655ce574a4719c85c5c9a3530a5ec619e933fc801a291df8ec506a442'
            '8fda770717ca00034e7685077509d766ab854fb6b750a937b6d5efd3998d9c65')

prepare() {
  patch --directory="uuu-$pkgver" --forward --strip=1 --input="${srcdir}/uuu-cstdint.patch"
}

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

  ./uuu/uuu -udev > 70-uuu.rules
  udev_dir="$pkgdir"/usr/lib/udev/rules.d/
  install -d -m 755 "$udev_dir"
  install -m 644 70-uuu.rules "$udev_dir"/70-uuu.rules

  lic_dir="$pkgdir"/usr/share/licenses/mfgtools/
  install -d -m 755 "$lic_dir"
  install -m 644 ../LICENSE "$lic_dir"/LICENSE
}
