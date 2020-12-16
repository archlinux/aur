# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=system76-dkms
_pkgname=system76
pkgver=1.0.11
pkgrel=2
pkgdesc="This DKMS driver provides airplane mode, keyboard backlight, and fan support for System76 laptops"
arch=('x86_64')
url="https://github.com/pop-os/system76-dkms"
license=('GPL3')
depends=('dkms')
source=("https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz"
        'system76.conf')
sha1sums=('a87119b4b522143cd5979972e91e5c69c831e77a'
          'f03f2b085eb04bd889778906ee387277751a1f5f')


package() {
  # Installation directory
  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install source files
  for file in {Makefile,*.c,*.h}; do
    [ -f "$file" ] || continue
    install -Dm644 -t "${install_dir}/" "${file}"
  done

  # Install udev hwdb files
  install -Dm644 -t "${pkgdir}/usr/lib/udev/hwdb.d/" lib/udev/hwdb.d/*

  # Edit and install dkms configuration
  sed "s/#MODULE_VERSION#/${pkgver}/" "debian/system76-dkms.dkms" > "${install_dir}/dkms.conf"

  # Load the module at boot
  install -Dm644 ${srcdir}/system76.conf ${pkgdir}/etc/modules-load.d/system76.conf
} 
