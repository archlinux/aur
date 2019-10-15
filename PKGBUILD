# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=system76-acpi-dkms
_pkgname=system76-acpi
pkgver=1.0.1
pkgrel=1
pkgdesc="System76 ACPI Driver (DKMS)"
arch=('x86_64')
url="https://github.com/pop-os/system76-acpi-dkms"
license=('GPL')
depends=('dkms')
source=("https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz"
        'system76-acpi.conf')
sha256sums=('032fc6e0ba0ad6b94abb7f0f3dbc6126f8bdef3384d08be37823d684235c8e8d'
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

  # Edit and install dkms configuration
  sed "s/#MODULE_VERSION#/${pkgver}/" "debian/system76-acpi-dkms.dkms" > "${install_dir}/dkms.conf"

  # Load the module at boot
  install -Dm644 ${srcdir}/${_pkgname}.conf ${pkgdir}/etc/modules-load.d/${_pkgname}.conf
} 
