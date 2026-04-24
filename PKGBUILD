# Maintainer: Javier Tia <floss@jetm.me>

pkgname=jetm-kernel-settings
pkgver=1.0.0
pkgrel=1
pkgdesc="Kernel tuning (sysctl/udev/modprobe/tmpfiles/systemd) for jetm's Ryzen + mixed-storage + Yocto workstation"
arch=('any')
url="https://aur.archlinux.org/packages/jetm-kernel-settings"
license=('GPL-1.0-only')
depends=('systemd>=256' 'zram-generator' 'iw' 'wireless-regdb')
backup=('etc/systemd/zram-generator.conf')
conflicts=('cachyos-settings')
replaces=('cachyos-settings')
provides=('cachyos-settings' 'ntsync-common')
install="${pkgname}.install"

# AUR requires a flat repository (no subdirectories). All config files
# live at the root and are placed into their real filesystem paths by
# package() below. Files with colliding basenames across subsystems
# are prefixed: system-*, user-*, rtkit-*, docker-*.
source=(
  '70-jetm-kernel.conf'
  '20-audio-pm.rules'
  '30-zram.rules'
  '40-hpet-permissions.rules'
  '50-sata.rules'
  '60-ioschedulers.rules'
  '69-hdparm.rules'
  '85-iw-regulatory.rules'
  '99-cpu-dma-latency.rules'
  'blacklist.conf'
  'ntsync.conf'
  'coredump.conf'
  'thp.conf'
  'thp-shrinker.conf'
  '00-journal-size.conf'
  '00-timeout.conf'
  'system-10-limits.conf'
  'user-10-limits.conf'
  '10-timesyncd.conf'
  'rtkit-override.conf'
  'user-delegate.conf'
  'docker-00-jetm-limits.conf'
  'jetm-iw-set-regdomain.service'
  'jetm-iw-set-regdomain.path'
  'iw-set-regdomain'
  'zram-generator.conf'
)
sha256sums=(
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

package() {
  # sysctl
  install -Dm644 "${srcdir}/70-jetm-kernel.conf" \
    "${pkgdir}/usr/lib/sysctl.d/70-jetm-kernel.conf"

  # udev rules
  install -Dm644 "${srcdir}/20-audio-pm.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/20-audio-pm.rules"
  install -Dm644 "${srcdir}/30-zram.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/30-zram.rules"
  install -Dm644 "${srcdir}/40-hpet-permissions.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/40-hpet-permissions.rules"
  install -Dm644 "${srcdir}/50-sata.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/50-sata.rules"
  install -Dm644 "${srcdir}/60-ioschedulers.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/60-ioschedulers.rules"
  install -Dm644 "${srcdir}/69-hdparm.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/69-hdparm.rules"
  install -Dm644 "${srcdir}/85-iw-regulatory.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/85-iw-regulatory.rules"
  install -Dm644 "${srcdir}/99-cpu-dma-latency.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/99-cpu-dma-latency.rules"

  # modprobe + modules-load
  install -Dm644 "${srcdir}/blacklist.conf" \
    "${pkgdir}/usr/lib/modprobe.d/blacklist.conf"
  install -Dm644 "${srcdir}/ntsync.conf" \
    "${pkgdir}/usr/lib/modules-load.d/ntsync.conf"

  # tmpfiles
  install -Dm644 "${srcdir}/coredump.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/coredump.conf"
  install -Dm644 "${srcdir}/thp.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/thp.conf"
  install -Dm644 "${srcdir}/thp-shrinker.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/thp-shrinker.conf"

  # systemd drop-ins
  install -Dm644 "${srcdir}/00-journal-size.conf" \
    "${pkgdir}/usr/lib/systemd/journald.conf.d/00-journal-size.conf"
  install -Dm644 "${srcdir}/00-timeout.conf" \
    "${pkgdir}/usr/lib/systemd/system.conf.d/00-timeout.conf"
  install -Dm644 "${srcdir}/system-10-limits.conf" \
    "${pkgdir}/usr/lib/systemd/system.conf.d/10-limits.conf"
  install -Dm644 "${srcdir}/user-10-limits.conf" \
    "${pkgdir}/usr/lib/systemd/user.conf.d/10-limits.conf"
  install -Dm644 "${srcdir}/10-timesyncd.conf" \
    "${pkgdir}/usr/lib/systemd/timesyncd.conf.d/10-timesyncd.conf"
  install -Dm644 "${srcdir}/rtkit-override.conf" \
    "${pkgdir}/usr/lib/systemd/system/rtkit-daemon.service.d/override.conf"
  install -Dm644 "${srcdir}/user-delegate.conf" \
    "${pkgdir}/usr/lib/systemd/system/user@.service.d/delegate.conf"
  install -Dm644 "${srcdir}/docker-00-jetm-limits.conf" \
    "${pkgdir}/usr/lib/systemd/system/docker.service.d/00-jetm-limits.conf"

  # systemd units + helper
  install -Dm644 "${srcdir}/jetm-iw-set-regdomain.service" \
    "${pkgdir}/usr/lib/systemd/system/jetm-iw-set-regdomain.service"
  install -Dm644 "${srcdir}/jetm-iw-set-regdomain.path" \
    "${pkgdir}/usr/lib/systemd/system/jetm-iw-set-regdomain.path"
  install -Dm755 "${srcdir}/iw-set-regdomain" \
    "${pkgdir}/usr/lib/iw-set-regdomain"

  # zram-generator config lives in /etc so user can customise
  # (listed in backup=() above so upgrades produce .pacnew).
  install -Dm644 "${srcdir}/zram-generator.conf" \
    "${pkgdir}/etc/systemd/zram-generator.conf"
}

# vim:set ts=2 sw=2 et:
