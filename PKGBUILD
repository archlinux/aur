# Maintainer: xpufx <github@xpufx.com>
#
# PiPedal only ships .deb packages; this PKGBUILD repacks the upstream
# amd64 deb into an Arch package. The package is deliberately inert:
# the deb's postinst step (pipedalconfig --install) enables and starts
# services, so it is NOT run automatically.
# The ToobAmp plugin bundle is NOT embedded (upstream embeds an
# unpublished snapshot); the released plugin set ships as toobamp-bin,
# a hard dependency. pipedal-bin.install only prints guidance;
# see README.md.

pkgname=pipedal-bin
pkgver=2.0.110
pkgrel=4
pkgdesc="IoT guitar effect pedal for Raspberry Pi, with phone-friendly web interface"
arch=('x86_64')
url="https://rerdavies.github.io/pipedal/"
license=('MIT')
depends=(
  'alsa-lib'
  'alsa-utils'
  'avahi'
  'bzip2'
  'cairo'
  'curl'
  'dbus'
  'ffmpeg'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'gnupg'
  'icu'
  'iw'
  'jack' # virtual: provided by jack2 or pipewire-jack (pacman prompts)
  'libbsd'
  'libcap'
  'libgcrypt'
  'libgpg-error'
  'libjpeg-turbo'
  'libx11'
  'libxrandr'
  'librsvg'
  'lilv'
  'lz4'
  'openssl'
  'pango'
  'systemd-libs'
  'toobamp-bin' # LV2 plugin bundle; upstream embeds a newer unpublished snapshot
  'util-linux-libs'
  'xz'
  'zlib'
  'zstd'
)
optdepends=(
  'authbind: only needed when the web UI serves on a port below 1024 (the default is port 80); use `pipedalconfig --install --port 8080` to avoid it (AUR)'
  'networkmanager: Wi-Fi hotspot and P2P session features'
  'lv2: use third-party LV2 effects plugins in addition to the ToobAmp set (from toobamp-bin)'
)
makedepends=('binutils')
install='pipedal-bin.install'
source=("https://github.com/rerdavies/pipedal/releases/download/v${pkgver}/pipedal_${pkgver}_amd64.deb")
sha256sums=('e0e49988ec3f0d63168e82a24345e44f1f06b71f5545f5f2417de609ea695a8b')

package() {
  cd "${srcdir}"

  # Unpack the deb's data payload. `ar` (binutils) splits the deb into
  # debian-binary, control.tar.gz and data.tar.gz; the data payload maps
  # onto the Arch FHS (etc/, usr/).
  ar x "pipedal_${pkgver}_amd64.deb"
  tar -xf data.tar.gz -C "${pkgdir}"

  # Arch merged /usr/sbin into /usr/bin (usrmerge): /usr/sbin is a
  # symlink owned by the filesystem package, so a directory entry for it
  # would conflict. Move the admin binaries to usr/bin (same location at
  # runtime) and drop the directory.
  mv "${pkgdir}"/usr/sbin/* "${pkgdir}"/usr/bin/ 2>/dev/null || true
  rmdir "${pkgdir}"/usr/sbin 2>/dev/null || true

  # Do not embed the ToobAmp LV2 bundle: its released version ships as
  # the separate toobamp-bin package (hard dependency). Upstream embeds
  # an unpublished newer snapshot (1.3.85) that cannot be repacked;
  # shipping both copies would collide on /usr/lib/lv2/ToobAmp.lv2.
  rm -rf "${pkgdir}"/usr/lib/lv2
  rmdir "${pkgdir}"/usr/lib 2>/dev/null || true

  # Normalize directory permissions: the deb ships dirs at 775, but Arch
  # convention is 755 (and polkit's rules.d must stay restricted).
  find "${pkgdir}" -type d -exec chmod 755 {} +

  # Ship the upstream license bundle (Debian-style copyright file listing
  # the Expat/MIT main license plus BSD/Apache/MPL/GPL component licenses)
  # at the Arch-mandated location (namcap checks the pkgname dir).
  install -Dm644 "${pkgdir}/usr/share/doc/pipedal/copyright" \
    "${pkgdir}/usr/share/licenses/pipedal-bin/LICENSE"

  # Default the web server to a high port: upstream ships
  # "socketServerAddress": "0.0.0.0:80", which forces the authbind
  # dependency and root port binding. Serving on 8080 needs neither.
  # Users can still override via /var/pipedal/config/config.json or by
  # re-running `pipedalconfig --install --port <n>`.
  sed -i 's|"socketServerAddress": "0.0.0.0:80"|"socketServerAddress": "0.0.0.0:8080"|' \
    "${pkgdir}/etc/pipedal/config/config.json"

  # The deb's postinst runs `pipedalconfig --install` (service enablement
  # + boot config edits). That is intentionally NOT replicated here;
  # pipedal-bin.install only prints guidance.
  true
}
