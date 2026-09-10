# Maintainer: qie2035 <qie2035@users.noreply.github.com>
# The upstream asset lives under the moving "nightly" tag, which is rebuilt in
# place without changing the file name; the checksum below pins the
# 2026-09-07 build, so bump it (and pkgrel) whenever upstream pushes a new one.
pkgname=rustdesk-unattended-wayland
pkgver=1.5.0
pkgrel=2
pkgdesc="RustDesk remote desktop - nightly build with unattended access support on Wayland"
arch=('x86_64')
url="https://github.com/rustdesk/rustdesk"
license=('AGPL-3.0-only')
depends=(
  'alsa-lib'
  'curl'
  'gst-plugin-pipewire'      # Wayland screen capture
  'gst-plugins-base-libs'
  'gtk3'
  'libdrm'
  'libglvnd'                 # libEGL / libGLESv2
  'libpulse'
  'libva'
  'libxcb'                   # libxcb-randr/-shape/-xfixes
  'xdotool'                  # ships libxdo.so.4 (X11 input injection)
  'libxfixes'
)
optdepends=(
  'libayatana-appindicator: system tray icon'
)
conflicts=('rustdesk')
provides=('rustdesk')
options=('!strip' '!debug')
install="$pkgname.install"
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/rustdesk/rustdesk/releases/download/nightly/rustdesk-unattended-wayland-${pkgver}-x86_64.deb")
sha256sums_x86_64=('SKIP')

package() {
  bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}-x86_64.deb" data.tar.xz \
    | bsdtar -xf - -C "${pkgdir}"

  # Upstream ships the unit under /usr/share/rustdesk/files and installs it
  # from postinst (where it also rewrites pkill to an absolute path, which
  # systemd requires for ExecStop); do the same properly for pacman.
  sed -i 's|ExecStop=pkill|ExecStop=/usr/bin/pkill|' \
    "${pkgdir}/usr/share/rustdesk/files/systemd/rustdesk.service"
  install -Dm644 \
    "${pkgdir}/usr/share/rustdesk/files/systemd/rustdesk.service" \
    "${pkgdir}/usr/lib/systemd/system/rustdesk.service"
  rm -r "${pkgdir}/usr/share/rustdesk/files"

  # The deb's postinst creates this symlink at configure time; the binary's
  # $ORIGIN/lib RUNPATH resolves through it, so the target must stay put.
  ln -s /usr/share/rustdesk/rustdesk "${pkgdir}/usr/bin/rustdesk"

  rmdir "${pkgdir}/usr/share/polkit-1/actions" \
    "${pkgdir}/usr/share/polkit-1" 2>/dev/null || true
}
