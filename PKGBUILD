# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=system76-io-dkms
_modname=system76-io
pkgver=0.0.1
_commit="d7ec9914ea0aee4af22ff7ace5cba697a95309aa"
pkgrel=2
pkgdesc="This DKMS driver controls System76 Io devices"
arch=('x86_64')
url="https://github.com/pop-os/system76-io-dkms"
license=('GPL3')
depends=('dkms')
source=("https://github.com/pop-os/${pkgname}/archive/${_commit}.tar.gz"
        "system76-io.conf")
sha256sums=("5791cd88485da3ac714ebf069eafe68266c46f87be911500cab2308e34436941"
            "aac9100aba28a0a6716b6b2012858ce996a5f710e1f1e02628da1cff2ef2bdd2")

package() {
  # Installation directory
  local install_dir="${pkgdir}/usr/src/${_modname}-${pkgver}"

  cd ${srcdir}/${pkgname}-${_commit}

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
