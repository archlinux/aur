# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=system76-io-dkms-git
_pkgname=system76-io-dkms
pkgver=19
pkgrel=1
pkgdesc="This DKMS driver provides airplane mode, keyboard backlight, and fan support for System76 laptops"
arch=('x86_64')
url="https://github.com/pop-os/system76-io-dkms"
license=('GPL3')
depends=('dkms')
source=("${_pkgname}::git+https://github.com/pop-os/${_pkgname}.git"
        'system76-io.conf')
sha256sums=('SKIP'
            'aac9100aba28a0a6716b6b2012858ce996a5f710e1f1e02628da1cff2ef2bdd2')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}


package() {
  # Installation directory
  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  cd "${srcdir}/${_pkgname}"

  # Install source files
  for file in {Makefile,*.c,*.h}; do
    [ -f "$file" ] || continue
    install -D -m644 -t "${install_dir}/" "${file}"
  done

  # Edit and install dkms configuration
  sed "s/#MODULE_VERSION#/${pkgver}/" "debian/system76-io-dkms.dkms" > "${install_dir}/dkms.conf"

  # Load the module at boot
  install -Dm644 ${srcdir}/system76-io.conf ${pkgdir}/etc/modules-load.d/system76-io.conf
}
