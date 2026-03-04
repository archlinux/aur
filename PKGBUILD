# Maintainer: LeonLionHeart
pkgname=archvault
pkgver=5.0.2_beta
pkgrel=1
pkgdesc="Backup & Restore Manager for Arch Linux — GUI for rsync, btrfs, tar, rclone with scheduling, encryption, and cloud support"
arch=('any')
url="https://github.com/LeonLionHeart/ArchVault"
license=('GPL3')
depends=(
    'python'
    'python-pyqt6'
    'python-cryptography'
    'rsync'
    'btrfs-progs'
    'tar'
    'gzip'
    'coreutils'
    'systemd'
)
optdepends=(
    'rclone: Cloud backup support (S3, GCS, Azure, Backblaze, Dropbox, Google Drive)'
    'python-boto3: Direct AWS S3 cloud uploads'
    'zstd: Zstandard compression for backups'
    'cifs-utils: SMB/CIFS network share mounting'
    'nfs-utils: NFS network share mounting'
    'sshfs: SSHFS remote filesystem mounting'
    'openssh: SFTP backup target support'
    'libnotify: Desktop notification support'
    'xdg-desktop-portal: GNOME Background Apps panel integration'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/ArchVault-${pkgver//_/-}"

    # Install Python source files
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 *.py "${pkgdir}/usr/lib/${pkgname}/"

    # Make entry point executable
    chmod 755 "${pkgdir}/usr/lib/${pkgname}/archvault.py"

    # Install launcher script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'LAUNCHER'
#!/bin/bash
# ArchVault launcher — requires root for system backup operations
if [ "$EUID" -ne 0 ]; then
    # Try pkexec first, fall back to sudo
    if command -v pkexec &>/dev/null; then
        exec pkexec env DISPLAY="$DISPLAY" XAUTHORITY="$XAUTHORITY" \
            WAYLAND_DISPLAY="$WAYLAND_DISPLAY" XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" \
            QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-xcb}" \
            DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" \
            python3 /usr/lib/archvault/archvault.py "$@"
    else
        exec sudo -E python3 /usr/lib/archvault/archvault.py "$@"
    fi
else
    exec python3 /usr/lib/archvault/archvault.py "$@"
fi
LAUNCHER

    # Install headless runner for systemd tasks
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}-task" <<'TASKRUNNER'
#!/bin/bash
# ArchVault headless task runner for systemd timers
exec python3 /usr/lib/archvault/archvault.py --run-task "$@"
TASKRUNNER

    # Desktop entry
    install -Dm644 archvault.desktop \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon
    install -Dm644 archvault.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

    # License
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Polkit policy for GUI elevation
    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/polkit-1/actions/com.archvault.app.policy" <<'POLKIT'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE policyconfig PUBLIC
 "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
 "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
<policyconfig>
  <action id="com.archvault.app.run">
    <description>Run ArchVault Backup Manager</description>
    <message>Authentication is required to run ArchVault</message>
    <defaults>
      <allow_any>auth_admin</allow_any>
      <allow_inactive>auth_admin</allow_inactive>
      <allow_active>auth_admin_keep</allow_active>
    </defaults>
    <annotate key="org.freedesktop.policykit.exec.path">/usr/lib/archvault/archvault.py</annotate>
    <annotate key="org.freedesktop.policykit.exec.allow_gui">true</annotate>
  </action>
</policyconfig>
POLKIT

    # Config directory (created at runtime, but set permissions)
    install -dm700 "${pkgdir}/etc/archvault"
}
