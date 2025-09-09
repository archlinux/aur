# Maintainer: Gabriel Ruas Santos <gabrielruass@protonmail.com>
pkgname=gnu-shark-git
pkgver=0
pkgrel=1
pkgdesc="GTK UI to install drivers, optimizations, and gaming tools for Arch Linux and derivatives (git)"
arch=('any')
url="https://github.com/gabriel-ruas-santos/gnu-shark"
license=('GPL3') # adjust to your real license
depends=('python' 'python-gobject' 'gtk3' 'polkit')
optdepends=('flatpak: Flatpak/Flathub flows'
            'gamemode: Performance service'
            'steam: Game client'
            'lutris: Game manager'
            'heroic-games-launcher: Epic/GOG client'
            'mangohud: FPS/metrics overlay'
            'goverlay: GUI for MangoHUD')
makedepends=('git')
source=("git+https://github.com/gabriel-ruas-santos/gnu-shark.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/gnu-shark"
  git describe --tags --long --always 2>/dev/null | sed 's/^v//' | sed -E 's/-([0-9]+)-g/.r\1.g/; s/-/./g'
}

package() {
  cd "${srcdir}/gnu-shark"
  install -Dm755 "gnushark.py" "${pkgdir}/usr/bin/gnu-shark"
  if [[ -d icons ]]; then
    install -d "${pkgdir}/usr/share/gnushark"
    cp -r icons "${pkgdir}/usr/share/gnushark/icons"
    find "${pkgdir}/usr/share/gnushark/icons" -type f -name "*.png" -o -name "*.svg" -exec chmod 0644 {} +
  fi
  install -Dm644 <(cat <<'EOF'
[Desktop Entry]
Name=GNU/Shark
Comment=A hub of tools and utilities for gaming on Linux.
Exec=gnu-shark
Icon=org.gnushark.GNUShark
Terminal=false
Type=Application
Categories=Game;Utility;
StartupNotify=true
EOF
) "${pkgdir}/usr/share/applications/org.gnushark.GNUShark.desktop"
  if [[ -f icons/org.gnushark.GNUShark.svg ]]; then
    install -Dm644 "icons/org.gnushark.GNUShark.svg"       "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.gnushark.GNUShark.svg"
  fi
  install -Dm644 <(cat <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE policyconfig PUBLIC
 "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
 "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
<policyconfig>
  <action id="org.gnushark.runroot">
    <description>Run administrative tasks for GNU/Shark</description>
    <message>Allow GNU/Shark to perform administrative actions?</message>
    <icon_name>applications-games</icon_name>
    <defaults>
      <allow_any>auth_admin_keep</allow_any>
      <allow_inactive>auth_admin_keep</allow_inactive>
      <allow_active>auth_admin_keep</allow_active>
    </defaults>
    <annotate key="org.freedesktop.policykit.exec.path">/usr/libexec/gnushark-runroot</annotate>
    <annotate key="org.freedesktop.policykit.exec.allow_gui">true</annotate>
  </action>
</policyconfig>
EOF
) "${pkgdir}/usr/share/polkit-1/actions/org.gnushark.runroot.policy"
  install -Dm755 <(cat <<'EOF'
#!/bin/sh
umask 022
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
unset BASH_ENV ENV
exec /usr/bin/bash -s
EOF
) "${pkgdir}/usr/libexec/gnushark-runroot"
}
