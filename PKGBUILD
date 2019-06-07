# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=system76-io-dkms
_modname=system76-io
pkgver=1.0.1
pkgrel=1
pkgdesc="This DKMS driver controls System76 IO devices"
arch=('x86_64')
url="https://github.com/pop-os/system76-io-dkms"
license=('GPL3')
depends=('dkms')
source=("https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz"
        "system76-io.conf")
sha256sums=("492b334c0861af0e3627eb8f9f25690ba1dc617ba743a4f25ca02740de26db26"
            "aac9100aba28a0a6716b6b2012858ce996a5f710e1f1e02628da1cff2ef2bdd2")

package() {
  # Installation directory
  local install_dir="${pkgdir}/usr/src/${_modname}-${pkgver}"

  cd ${srcdir}/${pkgname}-${pkgver}

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
