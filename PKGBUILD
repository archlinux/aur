# Maintainer: Arawn <mail at arawn dot digital>
# SPDX-License-Identifier: 0BSD

pkgname=aurascan
pkgver=0.10.2
pkgrel=1
pkgdesc="AI-assisted safety and recovery layer for Arch-family systems"
arch=('any')
url="https://github.com/crizzler/AuraScan"
license=('MIT')
install=aurascan.install
depends=('python' 'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
optdepends=(
  'clamav: AV signature scanning through clamscan'
  'arch-audit: official Arch Security Team vulnerability advisories'
  'gnupg: explicit deep-static signature verification'
  'pacman: local package database, upgrade preflight, and vercmp support'
  'base-devel: makepkg wrapper workflows'
  'paru: AUR update context for aurascan upgrade'
  'yay: AUR update context for aurascan upgrade'
  'shelly: optional Shelly update handoff for aurascan upgrade'
  'python-pyqt6: AuraScan Updater tray applet'
  'pyside6: alternative Qt binding for the AuraScan Updater tray applet'
  'libnotify: desktop notifications for Agent Instruction Guard'
  'pacman-contrib: bounded package-cache cleanup for incident recovery'
  'pciutils: readable GPU model names in hardware-aware follow-up'
  'dmidecode: DIMM type and configured-speed context when privilege is already available'
  'inxi: unprivileged filtered DIMM topology and memory speed context'
  'lm_sensors: broader temperature and cooling sensor visibility'
  'fwupd: supported motherboard and device firmware update checks'
  'mkosi: build the optional local AuraScan Recovery UKI'
  'systemd: systemd-boot integration and recovery runtime support'
  'systemd-ukify: validate and assemble the optional recovery UKI'
  'arch-install-scripts: run bounded package and repair commands in a recovery target'
  'sbctl: sign the recovery UKI when Secure Boot is enabled'
  'networkmanager: Ethernet, tethering, and Wi-Fi in AuraScan Recovery'
  'iwd: WPA2/WPA3 Wi-Fi backend for AuraScan Recovery'
  'cryptsetup: unlock LUKS2 recovery targets'
  'lvm2: discover LVM recovery targets'
  'mdadm: discover mdraid recovery targets'
  'btrfs-progs: Btrfs diagnosis and snapshot recovery'
  'snapper: snapshot test and confirmed restore workflows'
  'xfsprogs: read-only XFS recovery diagnostics'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0787c3b42297c3f974f50240dd5a88b4fe1df3aee68a6b99b8aac6724d73e9b0')

build() {
  cd "AuraScan-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "AuraScan-$pkgver"
  python -m pytest -q
}

package() {
  cd "AuraScan-$pkgver"
  python -m installer --destdir="$pkgdir" --prefix=/usr dist/*.whl
  install -Dm644 packaging/arch/aurascan.hook "$pkgdir/usr/share/libalpm/hooks/aurascan.hook"
  install -Dm644 aurascan/assets/aurascan-updater.desktop "$pkgdir/usr/share/applications/aurascan-updater.desktop"
  install -Dm644 aurascan/assets/aurascan-updater.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/aurascan-updater.svg"
  install -Dm644 aurascan/assets/aurascan-updater-maintenance.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/aurascan-updater-maintenance.svg"
  install -Dm644 aurascan/assets/aurascan-updater-attention.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/aurascan-updater-attention.svg"
  install -Dm644 aurascan/assets/aurascan-updater-critical.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/aurascan-updater-critical.svg"
  install -Dm644 aurascan/assets/aurascan-incident-monitor.service "$pkgdir/usr/lib/systemd/system/aurascan-incident-monitor.service"
  install -Dm644 aurascan/assets/aurascan-incident-maintenance.service "$pkgdir/usr/lib/systemd/system/aurascan-incident-maintenance.service"
  install -Dm644 aurascan/assets/aurascan-incident-maintenance.timer "$pkgdir/usr/lib/systemd/system/aurascan-incident-maintenance.timer"
  install -Dm644 aurascan/assets/aurascan-incident-safe-autopilot.service "$pkgdir/usr/lib/systemd/system/aurascan-incident-safe-autopilot.service"
  install -Dm644 aurascan/assets/aurascan-incident-assistant.service "$pkgdir/usr/lib/systemd/user/aurascan-incident-assistant.service"
  install -Dm644 aurascan/assets/aurascan-incident-assistant.timer "$pkgdir/usr/lib/systemd/user/aurascan-incident-assistant.timer"
  install -Dm644 aurascan/assets/aurascan-instruction-monitor.service "$pkgdir/usr/lib/systemd/user/aurascan-instruction-monitor.service"
  install -Dm644 aurascan/assets/aurascan-instruction-monitor.timer "$pkgdir/usr/lib/systemd/user/aurascan-instruction-monitor.timer"
  install -Dm644 aurascan/assets/aurascan-instruction-assistant.service "$pkgdir/usr/lib/systemd/user/aurascan-instruction-assistant.service"
  install -Dm644 aurascan/assets/aurascan-instruction-assistant.timer "$pkgdir/usr/lib/systemd/user/aurascan-instruction-assistant.timer"
  install -Dm644 aurascan/assets/aurascan-incidents.conf "$pkgdir/usr/lib/tmpfiles.d/aurascan-incidents.conf"
  install -Dm644 aurascan/assets/aurascan-recovery.service "$pkgdir/usr/lib/systemd/system/aurascan-recovery.service"
  install -Dm644 aurascan/assets/aurascan-recovery-refresh.hook "$pkgdir/usr/share/libalpm/hooks/aurascan-recovery-refresh.hook"
  install -Dm644 aurascan/assets/aurascan-recovery-mkosi.conf "$pkgdir/usr/lib/aurascan/recovery/mkosi.conf"
  install -Dm644 aurascan/assets/aurascan-recovery-iso.json "$pkgdir/usr/share/aurascan/recovery/iso-manifest.json"
  install -Dm644 aurascan/assets/aurascan-recovery-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/aurascan-recovery.conf"
  install -Dm644 aurascan/assets/aurascan-recovery.service "$pkgdir/usr/lib/aurascan/recovery/rootfs/usr/lib/systemd/system/aurascan-recovery.service"
  install -Dm644 packaging/recovery/rootfs/usr/lib/systemd/system-preset/90-aurascan-recovery.preset "$pkgdir/usr/lib/aurascan/recovery/rootfs/usr/lib/systemd/system-preset/90-aurascan-recovery.preset"
  install -Dm644 packaging/recovery/rootfs/etc/issue "$pkgdir/usr/lib/aurascan/recovery/rootfs/etc/issue"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 DEVELOPING.md "$pkgdir/usr/share/doc/$pkgname/DEVELOPING.md"
  install -Dm644 docs/RELEASE_CHECKLIST.md "$pkgdir/usr/share/doc/$pkgname/RELEASE_CHECKLIST.md"
  install -Dm644 docs/PRIVACY.md "$pkgdir/usr/share/doc/$pkgname/PRIVACY.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
