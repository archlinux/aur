# Maintainer: pantarune

pkgname=niri-screenshare
pkgver=0.2.4
pkgrel=1
pkgdesc="Portal backend for niri implementing ScreenCast (prebuilt binary)"
arch=('x86_64')
url="https://github.com/pantarune/niri-screenshare"
license=('GPL3')
depends=('xdg-desktop-portal' 'pipewire' 'niri' 'gtk4' 'libadwaita')
source=("niri-screenshare-v${pkgver}-linux-x86_64.tar.gz::https://github.com/pantarune/niri-screenshare/releases/download/v${pkgver}/niri-screenshare-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('8a2a9ca52073ae1d9f6ec20a5a30eb05e8e012e3509a750421de47abf978863c')

package() {
  install -Dm755 "$srcdir/niri-screenshare" "$pkgdir/usr/lib/niri-screenshare"
  install -dm755 "$pkgdir/usr/share/xdg-desktop-portal/portals"
  cat > "$pkgdir/usr/share/xdg-desktop-portal/portals/niri.portal" <<'EOF_0'
[portal]
DBusName=org.freedesktop.impl.portal.desktop.niri
Interfaces=org.freedesktop.impl.portal.ScreenCast;
UseIn=niri
EOF_0
  install -dm755 "$pkgdir/usr/share/dbus-1/services"
  cat > "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.niri.service" <<'EOF_1'
[D-BUS Service]
Name=org.freedesktop.impl.portal.desktop.niri
Exec=/usr/lib/niri-screenshare
SystemdService=niri-screenshare.service
EOF_1
  install -dm755 "$pkgdir/usr/lib/systemd/user"
  cat > "$pkgdir/usr/lib/systemd/user/niri-screenshare.service" <<'EOF_2'
[Unit]
Description=Portal service (niri backend)
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
Type=dbus
BusName=org.freedesktop.impl.portal.desktop.niri
ExecStart=/usr/lib/niri-screenshare
Restart=on-failure

[Install]
WantedBy=graphical-session.target
EOF_2
}
