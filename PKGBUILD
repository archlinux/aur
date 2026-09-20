# Maintainer: Rick <RickStylesProyects>
pkgname=dell-g15-fan-control-git
_pkgname=DellG15FanControl---EndeavorOS
pkgver=1.0.0.r5.270ac73
pkgrel=1
pkgdesc="Modern thermal profile manager and fan control for Dell G15 5511 on Arch Linux."
arch=('any')
url="https://github.com/MapleProjects/DellG15FanControl---EndeavorOS"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-psutil' 'acpi_call-dkms')
makedepends=('git')
provides=('dell-g15-fan-control')
conflicts=('dell-g15-fan-control')
source=("git+https://github.com/MapleProjects/DellG15FanControl---EndeavorOS.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  # Install package module files to /usr/lib/dell-g15-fan-control/
  install -dm755 "$pkgdir/usr/lib/dell-g15-fan-control"
  cp -r dell_g15_fan_control "$pkgdir/usr/lib/dell-g15-fan-control/"
  install -Dm755 g15_fan_control.py "$pkgdir/usr/lib/dell-g15-fan-control/g15_fan_control.py"

  # System binary launchers in /usr/bin
  install -dm755 "$pkgdir/usr/bin"
  cat << 'EOF' > "$pkgdir/usr/bin/dell-g15-fan-control"
#!/bin/sh
exec /usr/bin/python3 /usr/lib/dell-g15-fan-control/g15_fan_control.py "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/dell-g15-fan-control"
  ln -sf dell-g15-fan-control "$pkgdir/usr/bin/dell-g15-fan-control-gui"
  ln -sf dell-g15-fan-control "$pkgdir/usr/bin/g15-fan-control"

  # Desktop entry
  install -dm755 "$pkgdir/usr/share/applications"
  cat << 'EOF' > "$pkgdir/usr/share/applications/dell-g15-fan-control.desktop"
[Desktop Entry]
Type=Application
Version=1.0
Name=Dell G15 Fan Control
GenericName=Fan Control
Comment=Control de perfiles térmicos para Dell G15 5511
Exec=/usr/bin/dell-g15-fan-control
Icon=dell-g15-fan-control
Terminal=false
Categories=System;Settings;HardwareSettings;
Keywords=fan;ventilador;dell;g15;thermal;termal;cooling;
StartupNotify=true
EOF

  # Icon
  install -Dm644 dell_g15_fan_control/icons/app_icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/dell-g15-fan-control.svg"

  # Systemd services (boot & resume)
  install -dm755 "$pkgdir/usr/lib/systemd/system"
  cat << 'EOF' > "$pkgdir/usr/lib/systemd/system/dell-g15-fan-resume.service"
[Unit]
Description=Dell G15 Fan Control - Restore thermal profile on resume
After=suspend.target hibernate.target hybrid-sleep.target suspend-then-hibernate.target

[Service]
Type=oneshot
ExecStart=/usr/bin/dell-g15-fan-control --apply-saved-mode

[Install]
WantedBy=suspend.target hibernate.target hybrid-sleep.target suspend-then-hibernate.target
EOF

  cat << 'EOF' > "$pkgdir/usr/lib/systemd/system/dell-g15-fan-boot.service"
[Unit]
Description=Dell G15 Fan Control - Restore thermal profile at boot
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/usr/bin/dell-g15-fan-control --apply-saved-mode
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

  # Polkit rule
  install -dm755 "$pkgdir/usr/share/polkit-1/actions"
  cat << 'EOF' > "$pkgdir/usr/share/polkit-1/actions/org.dell.g15.fancontrol.policy"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE policyconfig PUBLIC
 "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
 "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
<policyconfig>
  <action id="org.dell.g15.fancontrol">
    <description>Dell G15 Fan Control</description>
    <message>Se requiere autenticación para controlar los ventiladores</message>
    <icon_name>dell-g15-fan-control</icon_name>
    <defaults>
      <allow_any>auth_admin</allow_any>
      <allow_inactive>auth_admin</allow_inactive>
      <allow_active>auth_admin_keep</allow_active>
    </defaults>
    <annotate key="org.freedesktop.policykit.exec.path">/usr/bin/python3</annotate>
    <annotate key="org.freedesktop.policykit.exec.argv1">/usr/lib/dell-g15-fan-control/g15_fan_control.py</annotate>
  </action>
</policyconfig>
EOF
}
