# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Repackages the official self-contained build (PyInstaller bundle:
# its own Python + numpy/scipy/pyrtlsdrlib + web UI in /opt/falconsdr),
# so no Python packaging is involved on the Arch side. RTL-SDR plus
# HackRF/Airspy via bundled native libs (no SoapySDR); other SoapySDR
# hardware needs a source install (see upstream README).
pkgname=falconsdr
pkgver=1.4.1
pkgrel=1
pkgdesc="Wideband SDR ATC/radio scanner - records only the transmissions it stops on"
arch=('x86_64')
url="https://github.com/rafafunt/FalconSDR"
license=('GPL-3.0-or-later')
depends=('libusb' 'hicolor-icon-theme' 'systemd')
optdepends=('ffmpeg: MP3 recording output (system binary preferred, bundled fallback otherwise)')
conflicts=('smartscanatc')
provides=('falconsdr')
source=("https://github.com/rafafunt/FalconSDR/releases/download/v${pkgver}/falconsdr_${pkgver}_amd64.deb")
sha256sums=('4b7c3b6cb1364b404324a13b403ca1d35356c7e82355fb38efea5dbc9001a7dd')

package() {
  # .deb = ar archive (debian-binary, control.tar.*, data.tar.*); bsdtar
  # (libarchive, base-devel) extracts the data payload directly.
  bsdtar -xf "$srcdir/data.tar."* -C "$pkgdir"
  # The .deb wraps the binary as /usr/bin/falconsdr -> /opt/falconsdr,
  # ships the desktop entry, icon, udev rule, modprobe blacklist, docs and
  # licenses already in their FHS locations - nothing to rearrange. Fix up
  # Debian-isms for Arch:
  # - udev rules belong in /usr/lib/udev/rules.d on Arch, not /etc.
  if [ -f "$pkgdir/etc/udev/rules.d/60-rtl-sdr.rules" ]; then
    install -d "$pkgdir/usr/lib/udev/rules.d"
    mv "$pkgdir/etc/udev/rules.d/60-rtl-sdr.rules" "$pkgdir/usr/lib/udev/rules.d/60-rtl-sdr.rules"
    rmdir -p "$pkgdir/etc/udev/rules.d" 2>/dev/null || true
  fi
  # - modprobe blacklist is location-independent (/etc/modprobe.d is correct).
  # - udev file trigger so the RTL-SDR rule takes effect on install/remove.
  install -d "$pkgdir/usr/share/libalpm/hooks"
  cat > "$pkgdir/usr/share/libalpm/hooks/60-rtl-sdr-udev.hook" <<'HOOK'
[Trigger]
Type = File
Operation = Install
Operation = Remove
Target = usr/lib/udev/rules.d/60-rtl-sdr.rules

[Action]
Description = Reloading udev rules for RTL-SDR...
When = PostTransaction
Exec = /bin/sh -c 'udevadm control --reload-rules 2>/dev/null; udevadm trigger --subsystem-match=usb 2>/dev/null; true'
HOOK
}
