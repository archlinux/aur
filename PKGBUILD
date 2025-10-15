# Maintainer: Berkay Yıldırım <berkayildirm@gmail.com>

pkgname=focaltech-spi-dkms
pkgver=1.0.3
pkgrel=2
pkgdesc="SPI module for FocalTech FTE3600, FTE4800, FTE6600 and FTE6900 fingerprint readers"
arch=('x86_64')
url="https://github.com/vobademi/FTEXX00-Ubuntu"
license=('GPL-2.0') # The license is indicated in focal_spi.c.
depends=('dkms')
makedepends=('git' 'tar' 'linux-headers')
source=("git+https://github.com/vobademi/FTEXX00-Ubuntu.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/FTEXX00-Ubuntu"

  # Rename kernel header for recent kernel versions
  sed -i 's#<asm/unaligned.h>#<linux/unaligned.h>#' focal_spi.c

  # Update Makefile for being built after kernel upgrades
  sed -i 's/KERNEL_VERSION :=/KERNEL_VERSION ?=/' Makefile
  sed -i 's/KERNELDIR :=/KERNELDIR ?=/' Makefile

  # Create DKMS configuration
  cat << EOF > dkms.conf
PACKAGE_NAME="$pkgname"
PACKAGE_VERSION="$pkgver"
BUILT_MODULE_NAME[0]="focal_spi"
DEST_MODULE_LOCATION[0]="/kernel/drivers/spi"
AUTOINSTALL="yes"
MAKE[0]="make KERNELDIR=\\\${kernel_source_dir} -C \\\${dkms_tree}/\\\${PACKAGE_NAME}/\\\${PACKAGE_VERSION}/build"
EOF
}

package() {
  cd "$srcdir/FTEXX00-Ubuntu"

  # Create DKMS source directory
  install -dm755 "$pkgdir/usr/src/$pkgname-$pkgver"

  # Install source files
  install -Dm644 focal_spi.c "$pkgdir/usr/src/$pkgname-$pkgver/"
  install -Dm644 Makefile "$pkgdir/usr/src/$pkgname-$pkgver/"
  install -Dm644 dkms.conf "$pkgdir/usr/src/$pkgname-$pkgver/"
}
