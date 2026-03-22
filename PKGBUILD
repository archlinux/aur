# Maintainer: WattHog Project
pkgname=watthog-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A TUI utility for monitoring system power consumption on Linux"
arch=('any')
url="https://github.com/Jareda15/WattHog"
license=('GPL3')
depends=('python' 'python-textual' 'python-psutil')
makedepends=('git')
source=("git+https://github.com/Jareda15/WattHog.git")
md5sums=('SKIP')

package() {
    cd "${srcdir}/WattHog"

    # Install Python files
    install -d "${pkgdir}/opt/watthog"
    install -m644 app.py backend.py "${pkgdir}/opt/watthog/"

    # Install Udev rule
    install -d "${pkgdir}/usr/lib/udev/rules.d"
    echo 'ACTION=="add", SUBSYSTEM=="powercap", KERNEL=="intel-rapl:*", ATTR{energy_uj}="0444"' > "${pkgdir}/usr/lib/udev/rules.d/99-watthog-rapl.rules"

    # Install .desktop file
    install -d "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/watthog.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=WattHog
Comment=Power and process monitor
Exec=/usr/bin/watthog
Icon=utilities-system-monitor
Terminal=true
Categories=System;Monitor;
EOF

    # Install executable wrapper
    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/watthog"
#!/bin/sh
exec python /opt/watthog/app.py "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/watthog"
}
