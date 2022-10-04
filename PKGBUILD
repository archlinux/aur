# Maintainer A. Kulkarni <cd+aur [shift-2] terminal.space>
pkgname=lvm-autosnap
pkgver=0.0.2
pkgrel=2
pkgdesc='Create lvm snapshots during boot and automatically offer to restore your system if it stops booting.'
arch=('any')
license=('MIT')
install="lvm-autosnap.install"
depends=('lvm2')
url='https://github.com/intentionally-left-nil/lvm-autosnap'
_snapshot="${pkgname}-${pkgver}"
source=("${_snapshot}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

backup=(etc/lvm-autosnap.env)

package() {
  # Add core scripts
  bin_dir="${pkgdir}/usr/share/lvm-autosnap"
  install -D -m0755 "${srcdir}/${_snapshot}/cli.sh" "$bin_dir/cli.sh"
  install -D -m0755 "${srcdir}/${_snapshot}/config.sh" "$bin_dir/config.sh"
  install -D -m0755 "${srcdir}/${_snapshot}/core.sh" "$bin_dir/core.sh"
  install -D -m0755 "${srcdir}/${_snapshot}/lvm-wrapper.sh" "$bin_dir/lvm-wrapper.sh"
  install -D -m0755 "${srcdir}/${_snapshot}/lvol.sh" "$bin_dir/lvol.sh"
  install -D -m0755 "${srcdir}/${_snapshot}/util.sh" "$bin_dir/util.sh"

  # Add the CLI
  install -D -m0755 "${srcdir}/${_snapshot}/lvm-autosnap" "${pkgdir}/usr/bin/lvm-autosnap"

  # Add default config file
  install -D -m0644 "${srcdir}/${_snapshot}/lvm-autosnap.env" "${pkgdir}/etc/lvm-autosnap.env"

  # Add service to mark snapshots as not-pending once successfully booted
  install -D -m0644 "${srcdir}/${_snapshot}/lvm-autosnap.service" "${pkgdir}/usr/lib/systemd/system/lvm-autosnap.service"
  install -D -m0644 "${srcdir}/${_snapshot}/lvm-autosnap.timer" "${pkgdir}/usr/lib/systemd/system/lvm-autosnap.timer"

  # Add initrd service file
  install -D -m0644 "${srcdir}/${_snapshot}/lvm-autosnap-initrd.service" "${pkgdir}/usr/lib/systemd/system/lvm-autosnap-initrd.service"


  # Add the initcpio hooks
  install -D -m0644 "${srcdir}/${_snapshot}/install-hook.sh" "${pkgdir}/usr/lib/initcpio/install/lvm-autosnap"
  install -D -m0644 "${srcdir}/${_snapshot}/runtime-hook.sh" "${pkgdir}/usr/lib/initcpio/hooks/lvm-autosnap"
}
sha256sums=('51220db141bdb1c65b569549796ff2c52304e4845c8c675605c0b190b8b77bc2')


