# Maintainer: Berkay Yıldırım <berkayildirm@gmail.com>

pkgname=libfprint-ftexx00
pkgver=1.94.4_20250112
pkgrel=3
pkgdesc="Proprietary driver for FocalTech FTE3600, FTE4800, FTE6600 and FTE6900 fingerprint readers"
arch=('x86_64')
url="https://github.com/oneXfive/ubuntu_spi"
license=('unknown')
groups=('fprint')
depends=('gcc-libs' 'glib2' 'glibc' 'libgudev' 'libgusb' 'openssl' 'pixman' 'nss' 'focaltech-spi-dkms')
makedepends=('tar')
provides=('libfprint=1.94.4' 'libfprint-2.so')
conflicts=('libfprint')
source=("https://github.com/oneXfive/ubuntu_spi/raw/refs/heads/main/libfprint-2-2_1.94.4+tod1-0ubuntu1~22.04.2_spi_20250112_amd64.deb")
sha256sums=('b48c93c3732f90aabbcc520e5538faeffbb87bb6847a01d03e14ea157f1d36c1')

prepare() {
  cd "$srcdir"

  # Find the latest debian package by YYYYMMDD format
  latest_deb=$(ls *.deb 2>/dev/null | grep -E '[0-9]{8}' | sed -n 's/.*\([0-9]\{8\}\).*/\1 &/p' | sort -n | tail -1 | cut -d' ' -f2-)

  # Extract the debian package
  ar x "$latest_deb"

  # Extract data archive
  tar -xf data.tar.*

  # Update udev rules for Arch (replace plugdev with uaccess)
  sed -i 's/GROUP="plugdev"/TAG+="uaccess"/' lib/udev/rules.d/60-libfprint-2.rules

  # Create systemd override file
  cat << 'EOF' > override.conf
[Service]
DeviceAllow=/dev/focal_moh_spi rw
EOF
}

package() {
  cd "$srcdir"

  # Install library file
  install -Dm755 "usr/lib/x86_64-linux-gnu/libfprint-2.so.2.0.0" \
		"${pkgdir}/usr/lib/libfprint-2.so.2.0.0"

  # Install udev rules
  install -Dm644 "lib/udev/rules.d/60-libfprint-2.rules" \
		"${pkgdir}/usr/lib/udev/rules.d/60-libfprint-2.rules"

  # Install systemd override file
  install -Dm644 override.conf \
		"${pkgdir}/etc/systemd/system/fprintd.service.d/override.conf"

  # Create symlink
  ln -s libfprint-2.so.2.0.0 "${pkgdir}/usr/lib/libfprint-2.so.2"
  ln -s libfprint-2.so.2.0.0 "${pkgdir}/usr/lib/libfprint-2.so"
}
