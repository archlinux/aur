# Maintainer: Stephano Cetola <stephano@cetola.net>
pkgname=reform-tools
pkgver=1.87
pkgrel=1
pkgdesc="MNT Reform system tools & helpers"
arch=('x86_64' 'aarch64')
url="https://source.mnt.re/reform/reform-tools"
license=('GPL3')
install=reform-tools.install


depends=(
  'python'
  'python-psutil'
  'i2c-tools'
  'cryptsetup'
  'lvm2'
  'parted'
  'jq'
  'rsync'
  'e2fsprogs'
)
makedepends=(
  'git'
  'help2man'
  'imagemagick'
  'pkgconf'
  'plymouth'
)
optdepends=(
  'mtd-utils: for NAND flashing tools'
  'alsa-utils: for audio-related tools'
  'lm_sensors: for sensor monitoring'
  'ircii: for Reform chat/IRC tools'
  'pavucontrol: GUI mixer control (if using PulseAudio)'
)

source=(
  "git+https://source.mnt.re/reform/reform-tools.git#tag=1d96f15cc3396442530a92c472bfe6d367045d76"
  'motd-full'
  'motd-rescue'
)
sha256sums=(
  'SKIP'
  'e11f4e0d24edbb52f6bd1fa6599bd81a41c7cca7143eb52e66a48f9423e1e1a2'
  'fba668d174ec937c97ad8281202c4bc1d1e3d388dc950ad7b062ab3b19888334'
)

build() {
  cd "$srcdir/reform-tools"
  make
}

package() {
  cd "$srcdir/reform-tools"

  # Arch packaging notes:
  # - Skip initramfs-tools/* and flash-kernel/* (Arch does not use these).
  # - Skip kernel/zz-reform-tools (kernel PKGBUILD manages DTBs and symlinks).

  # Binaries (from bin/)
  install -d "$pkgdir/usr/bin"
  install -m755 bin/* "$pkgdir/usr/bin/"


  install -Dm644 systemd/reform-hw-setup.service "$pkgdir/usr/lib/systemd/system/reform-hw-setup.service"
  install -Dm644 systemd/reform-sleep.service "$pkgdir/usr/lib/systemd/system/reform-sleep.service"
  install -Dm644 systemd/reform-power-daemon.service "$pkgdir/usr/lib/systemd/system/reform-power-daemon.service"
  install -Dm644 systemd/reform-sleep.conf "$pkgdir/usr/lib/systemd/sleep.conf.d/reform-sleep.conf"

  # MOTD files
  install -Dm644 "$srcdir/motd-full"   "$pkgdir/etc/motd-full"
  install -Dm644 "$srcdir/motd-rescue" "$pkgdir/etc/motd-rescue"

  # modprobe.d blacklists
  install -Dm644 modprobe.d/reform.conf "$pkgdir/usr/lib/modprobe.d/reform.conf"

  # NetworkManager Wi-Fi power-save off
  install -Dm644 NetworkManager/default-wifi-powersave-off.conf \
    "$pkgdir/usr/lib/NetworkManager/conf.d/default-wifi-powersave-off.conf"

  # udev rules
  install -Dm644 audio/99-reform-audio.rules \
    "$pkgdir/usr/lib/udev/rules.d/99-reform-audio.rules"
  install -Dm644 udev/reform-ttymxc-wakeup.rules \
    "$pkgdir/usr/lib/udev/rules.d/reform-ttymxc-wakeup.rules"

  # UCM2 configs (RK3588 + TLV320AIC3100)
  install -Dm644 audio/ucm2.conf.d/rk3588-tlv320ai/rk3588-tlv320aic3100.conf \
    "$pkgdir/usr/share/alsa/ucm2/rk3588-tlv320ai/rk3588-tlv320aic3100.conf"
  install -Dm644 audio/ucm2.conf.d/rk3588-tlv320ai/HiFi.conf \
    "$pkgdir/usr/share/alsa/ucm2/rk3588-tlv320ai/HiFi.conf"

  # WirePlumber HDMI audio priority
  install -Dm644 audio/reform-hdmi-audio-priority.conf \
    "$pkgdir/usr/share/wireplumber/wireplumber.conf.d/reform-hdmi-audio-priority.conf"

  # PulseAudio/ALSA defaults
  install -Dm644 audio/analog-input-reform.conf \
    "$pkgdir/usr/share/pulseaudio/alsa-mixer/paths/analog-input-reform.conf"
  install -Dm644 audio/reform.conf \
    "$pkgdir/usr/share/pulseaudio/alsa-mixer/profile-sets/reform.conf"
  install -Dm644 audio/asound.state \
    "$pkgdir/var/lib/alsa/asound.state"

  # GNOME defaults (gschema override)
  install -Dm644 schemas/20_reform.gschema.override \
    "$pkgdir/usr/share/glib-2.0/schemas/20_reform.gschema.override"

  # GDM/SDDM defaults
  install -Dm644 share/gdm/dconf/95-mnt-reform-settings \
    "$pkgdir/usr/share/gdm/dconf.d/95-mnt-reform-settings"
  install -Dm644 sddm/10-wayland.conf \
    "$pkgdir/usr/share/sddm/sddm.conf.d/10-wayland.conf"

  # Dracut config for Reform
  install -Dm644 dracut/20-pocket-reform.conf \
    "$pkgdir/usr/lib/dracut/dracut.conf.d/20-pocket-reform.conf"

  # u-boot-menu defaults
  install -Dm644 u-boot-menu/reform.conf \
    "$pkgdir/usr/share/u-boot-menu/conf.d/reform.conf"

  # Kernel postinst hooks
  install -Dm644 kernel/zz-reform-bootspec \
    "$pkgdir/usr/share/kernel/postinst.d/zz-reform-bootspec"

  # Machine configs for reform-* tools
  install -d "$pkgdir/usr/share/reform-tools/machines"
  install -Dm644 machines/* "$pkgdir/usr/share/reform-tools/machines/"

  # libexec helpers
  install -d "$pkgdir/usr/libexec/reform-tools"
  install -m755 libexec/reform-tools/reform-power-daemon \
    "$pkgdir/usr/libexec/reform-tools/reform-power-daemon"
  install -m755 libexec/reform-tools/reform-tray.py \
    "$pkgdir/usr/libexec/reform-tools/reform-tray.py"
  install -m755 libexec/reform-tools/reform-wallpaper.py \
    "$pkgdir/usr/libexec/reform-tools/reform-wallpaper.py"

  # Man pages (generated in build())
  install -d "$pkgdir/usr/share/man/man1"
  install -Dm644 man/*.1 "$pkgdir/usr/share/man/man1/"

  # Plymouth themes/assets (not enabled by default)
  install -d "$pkgdir/usr/share/plymouth/themes/reform-y2k"
  install -d "$pkgdir/usr/share/plymouth/themes/monobar"
  install -Dm644 plymouth/reform-y2k.plymouth \
    "$pkgdir/usr/share/plymouth/themes/reform-y2k/reform-y2k.plymouth"
  install -Dm644 plymouth/background.png \
    "$pkgdir/usr/share/plymouth/themes/reform-y2k/background.png"
  install -Dm644 plymouth/monobar.plymouth \
    "$pkgdir/usr/share/plymouth/themes/monobar/monobar.plymouth"
  # Arch plymouth modules live in /usr/lib/plymouth (no multiarch libdir).
  install -Dm644 plymouth/monobar.so \
    "$pkgdir/usr/lib/plymouth/monobar.so"
  for f in bullet capslock entry keyboard keymap-render lock; do
    ln -sf ../spinner/"$f".png "$pkgdir/usr/share/plymouth/themes/reform-y2k/$f.png"
  done
  for i in $(seq 1 36); do
    filename=$(printf "animation-%04d.png" "$i")
    ln -sf ../spinner/"$filename" "$pkgdir/usr/share/plymouth/themes/reform-y2k/$filename"
  done
  for i in $(seq 1 30); do
    filename=$(printf "throbber-%04d.png" "$i")
    ln -sf ../spinner/"$filename" "$pkgdir/usr/share/plymouth/themes/reform-y2k/$filename"
  done

  # profile.d defaults
  install -Dm644 etc/profile.d/reform-kwin.sh \
    "$pkgdir/etc/profile.d/reform-kwin.sh"
  install -Dm644 etc/profile.d/reform-mali.sh \
    "$pkgdir/etc/profile.d/reform-mali.sh"

  # Backgrounds for GNOME defaults/reform-gnome-config
  install -d "$pkgdir/usr/share/backgrounds"
  install -Dm644 share/backgrounds/* "$pkgdir/usr/share/backgrounds/"

  # Examples
  install -d "$pkgdir/usr/share/doc/reform-tools/examples"
  install -Dm644 examples/keyboard_rainbow.py \
    "$pkgdir/usr/share/doc/reform-tools/examples/keyboard_rainbow.py"
}
