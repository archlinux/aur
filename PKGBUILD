# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=system76-acpi-dkms
_pkgname=system76-acpi
pkgver=1.0.2
pkgrel=2
pkgdesc="System76 ACPI Driver (DKMS)"
arch=('x86_64')
url="https://github.com/pop-os/system76-acpi-dkms"
license=('GPL')
depends=('dkms')
source=("https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz"
        'system76-acpi.conf')
sha256sums=('b6154e77aec8b171dfe2f1248a96f60370ba803c762833e644f41049ec3f5d33'
            '7b7e6bac10669d47576c8bd0bedad8217b32c1e25cab9cbb2ff64aa6be11fd39')

package() {
  # Installation directory
  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install source files
  for file in {Makefile,*.c,*.h}; do
    [ -f "$file" ] || continue
    install -D -m644 -t "${install_dir}/" "${file}"
  done

  # Install udev hwdb files
  install -Dm644 -t "${pkgdir}/usr/lib/udev/hwdb.d/" lib/udev/hwdb.d/*

  # Edit and install dkms configuration
  sed "s/#MODULE_VERSION#/${pkgver}/" "debian/system76-acpi-dkms.dkms" > "${install_dir}/dkms.conf"

  # Load the module at boot
  install -Dm644 ${srcdir}/${_pkgname}.conf ${pkgdir}/etc/modules-load.d/${_pkgname}.conf
} 
