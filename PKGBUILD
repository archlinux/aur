# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=nourish-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Modern Wayland desktop with an infinite zoomable canvas"
arch=('x86_64')
url="https://nourish.snowies.com"
license=('Apache-2.0 OR MIT')
depends=(
  'dbus'
  'ffmpeg'
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libinput'
  'libpulse'
  'libsoup3'
  'libxcb'
  'libxkbcommon'
  'mesa'
  'pam'
  'pixman'
  'seatd'
  'systemd-libs'
  'webkit2gtk-4.1'
  'xcb-util-cursor'
  'xorg-xwayland'
)
optdepends=(
  'vulkan-tools: Vulkan diagnostics'
  'mesa-utils: EGL/GL diagnostics'
  'glmark2: graphics benchmark diagnostics'
  'xdotool: example MX gesture commands in the bundled config template'
)
provides=('nourish')
conflicts=('nourish')
options=('!debug' '!strip')
install=nourish-bin.install
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/y5-snowies/nourish/releases/download/v${pkgver}/package.tar.gz"
  "LICENSE-MIT::https://raw.githubusercontent.com/y5-snowies/nourish/v${pkgver}/LICENSE-MIT"
)
sha256sums=('40f122a1ee26ece382963cf7bf81cdda0be48656e0781a9d2a9942dc21db2b1b'
            '8f9eb88eafea695df265da06eda1ca4374862b2033ad8f6649829be81884c8ba')

latestver() {
  curl -fsSL 'https://api.github.com/repos/y5-snowies/nourish/releases/latest' |
    sed -nE 's/.*"tag_name": "v?([^"]+)".*/\1/p'
}

package() {
  install -Dm755 y5-install/binaries/y5.compositor "${pkgdir}/usr/bin/y5.compositor"
  install -Dm755 y5-install/binaries/y5.compositor.dev "${pkgdir}/usr/bin/y5.compositor.dev"
  install -Dm755 y5-install/binaries/y5.compositor.settings "${pkgdir}/usr/bin/y5.compositor.settings"
  install -Dm755 y5-install/binaries/compositor-developer-tool "${pkgdir}/usr/bin/y5.compositor.monitor"
  install -Dm755 y5-install/binaries/xwayland-satellite "${pkgdir}/usr/bin/xwayland-satellite"
  install -Dm755 y5-install/binaries/y5-polkit-agent "${pkgdir}/usr/bin/y5-polkit-agent"
  install -Dm755 y5-install/binaries/mx-gesture-daemon "${pkgdir}/usr/bin/mx-gesture-daemon"

  install -Dm644 y5-install/templates/pam/installation-y5-lock "${pkgdir}/etc/pam.d/y5-lock"
  install -Dm644 y5-install/templates/mx/42-logitech-hidpp.rules "${pkgdir}/usr/lib/udev/rules.d/42-logitech-hidpp.rules"
  install -Dm644 y5-install/templates/mx/config.example.toml "${pkgdir}/usr/share/doc/${pkgname}/mx-gesture-daemon/config.example.toml"

  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/user/y5.service" <<'EOF'
[Unit]
Description=Y5 Wayland compositor (Y5 Compositor)
BindsTo=graphical-session.target
Before=graphical-session.target
Wants=graphical-session-pre.target
After=graphical-session-pre.target
Wants=xdg-desktop-autostart.target
Before=xdg-desktop-autostart.target

[Service]
Slice=session.slice
Type=exec
ExecStart=/usr/bin/y5.compositor.desktop
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/user/y5.shutdown.target" <<'EOF'
[Unit]
Description=Shutdown running Y5 session
DefaultDependencies=no
StopWhenUnneeded=yes
Conflicts=graphical-session.target graphical-session-pre.target
After=graphical-session.target graphical-session-pre.target
EOF

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/y5.compositor.desktop" <<'EOF'
#!/bin/bash
export RUST_LOG=info,smithay=info
export MESA_DEBUG=1
export XDG_CURRENT_DESKTOP=y5
export XDG_SESSION_TYPE=wayland

_y5_cfg="${XDG_CONFIG_HOME:-$HOME/.config}/y5.compositor"
if [ ! -f "$_y5_cfg/settings.json" ]; then
	echo "y5: no configuration at $_y5_cfg/settings.json" >&2
	echo "y5: run 'y5.compositor.settings' to configure, then start this session again." >&2
	exit 1
fi

exec /usr/bin/y5.compositor
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/wayland-sessions/y5-compositor.desktop" <<'EOF'
[Desktop Entry]
Name=Y5 Compositor
Comment=Y5 Compositor - Y5 Compositor
Exec=systemctl --user --wait start y5.service
Type=Application
DesktopNames=y5
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/user/y5-polkit-agent.service" <<'EOF'
[Unit]
Description=Y5 polkit authentication agent
After=graphical-session.target
PartOf=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/y5-polkit-agent
Restart=on-failure

[Install]
WantedBy=graphical-session.target
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/user/xwayland.service" <<'EOF'
[Unit]
Description=X Wayland Satellite
After=graphical-session.target
PartOf=graphical-session.target

[Service]
Type=simple
ExecStartPre=/usr/bin/sleep 20
ExecStart=/usr/bin/xwayland-satellite :12 --ignore-fractional-scale
Restart=no

[Install]
WantedBy=graphical-session.target
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/user/mx-gesture-daemon.service" <<'EOF'
[Unit]
Description=MX Master gesture button daemon
After=graphical-session.target
PartOf=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/mx-gesture-daemon
Restart=no
Environment=RUST_LOG=info

[Install]
WantedBy=graphical-session.target
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/y5.compositor.monitor.desktop" <<'EOF'
[Desktop Entry]
Categories=
Comment=y5 developer log viewer (Tauri + React)
Exec=y5.compositor.monitor
StartupWMClass=y5.compositor.monitor
Icon=y5.compositor.monitor
Name=y5.compositor.monitor
Terminal=false
Type=Application
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/xdg-desktop-portal/y5-portals.conf" <<'EOF'
[preferred]
default=gtk
EOF

  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
