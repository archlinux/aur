# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
pkgbase=qtuxtimings-git
pkgname=('qtuxtimings-git' 'qtuxtimings-dkms-git')
# Set by pkgver(); RELEASE.rREVISION.gHASH from the upstream tag (e.g.
# 1.0.5.r6.g8f1776b). Builds from the branch tip, hence the -git suffix and the
# git+ source, per the Arch VCS package guidelines.
pkgver=1.0.5.r26.gb29b244
pkgrel=1
pkgdesc="AMD Ryzen DRAM timings and CPU telemetry viewer (Qt6)"
arch=('x86_64')
url="https://github.com/drizzt/QTuxTimings"
license=('GPL3')
makedepends=('git' 'gcc' 'cmake' 'qt6-base')
source=("$pkgbase::git+https://github.com/drizzt/QTuxTimings.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgbase"
    # Needs the upstream tag (v1.0.5) reachable in this clone: push it to the
    # origin remote so AUR builds can describe against it.
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgbase/Linux"
    rm -rf build
    cmake -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package_qtuxtimings-git() {
    pkgdesc="AMD Ryzen DRAM timings and CPU telemetry viewer (Qt6)"
    # qt6-wayland ships the Wayland QPA platform plugin; the launcher forces
    # QT_QPA_PLATFORM=wayland on Wayland sessions, so it must be present.
    depends=('qt6-base' 'qt6-wayland')
    provides=('qtuxtimings')
    conflicts=('qtuxtimings')
    optdepends=(
        'qtuxtimings-dkms-git: kernel modules for accurate benchmarking and memory voltages'
        'ryzen_smu-dkms-git: kernel module for reading AMD SMN/PM tables'
        'nct6775-dkms-git: fan readings on boards with Nuvoton Super I/O (NCT6775F through NCT6799D)'
    )

    cd "$srcdir/$pkgbase/Linux"

    # Binary
    install -Dm755 build/qtuxtimings "$pkgdir/opt/QTuxTimings/bin/qtuxtimings"

    # Icon
    install -Dm644 qtuxtimings.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/qtuxtimings.png"

    # Polkit policy
    install -Dm644 /dev/stdin "$pkgdir/usr/share/polkit-1/actions/it.belloworld.QTuxTimings.policy" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE policyconfig PUBLIC
 "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
 "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
<policyconfig>
  <action id="it.belloworld.QTuxTimings.run">
    <description>Run QTuxTimings</description>
    <message>Authentication is required to run QTuxTimings</message>
    <defaults>
      <allow_any>auth_admin</allow_any>
      <allow_inactive>auth_admin</allow_inactive>
      <allow_active>auth_admin_keep</allow_active>
    </defaults>
    <annotate key="org.freedesktop.policykit.exec.path">/opt/QTuxTimings/bin/qtuxtimings</annotate>
    <annotate key="org.freedesktop.policykit.exec.allow_gui">true</annotate>
  </action>
</policyconfig>
EOF

    # Desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/qtuxtimings.desktop" << 'DESKTOP'
[Desktop Entry]
Name=QTuxTimings
Comment=AMD Ryzen DRAM timings viewer
Exec=qtuxtimings
Icon=qtuxtimings
Terminal=false
Type=Application
Categories=Utility;
DESKTOP

    # Launcher script (handles env forwarding through pkexec)
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/qtuxtimings" << 'LAUNCHER'
#!/bin/bash
if [ "$(id -u)" -eq 0 ]; then
    exec /opt/QTuxTimings/bin/qtuxtimings "$@"
fi

ENV_ARGS=""
for VAR in DISPLAY WAYLAND_DISPLAY XDG_RUNTIME_DIR XAUTHORITY \
           DBUS_SESSION_BUS_ADDRESS XDG_CONFIG_HOME HOME; do
    eval VAL=\$$VAR
    [ -n "$VAL" ] && ENV_ARGS="$ENV_ARGS --env-$VAR=$VAL"
done
[ -n "$WAYLAND_DISPLAY" ] && ENV_ARGS="$ENV_ARGS --env-QT_QPA_PLATFORM=wayland"

exec pkexec /opt/QTuxTimings/bin/qtuxtimings $ENV_ARGS "$@"
LAUNCHER
}

package_qtuxtimings-dkms-git() {
    pkgdesc="DKMS kernel modules for QTuxTimings (aod-voltages, tuxbench)"
    depends=('dkms' 'linux-headers')
    provides=('qtuxtimings-dkms')
    conflicts=('qtuxtimings-dkms')
    optdepends=('clang: required if your kernel was built with Clang (CachyOS, etc)')
    install=qtuxtimings-dkms.install

    cd "$srcdir/$pkgbase/Linux"

    # aod-voltages DKMS module source
    local aod_ver
    aod_ver=$(grep '^PACKAGE_VERSION=' src/aod-voltages/dkms.conf | cut -d= -f2 | tr -d '"')
    install -dm755 "$pkgdir/usr/src/aod-voltages-$aod_ver"
    install -Dm644 src/aod-voltages/aod_voltages.c  "$pkgdir/usr/src/aod-voltages-$aod_ver/aod_voltages.c"
    install -Dm644 src/aod-voltages/Makefile         "$pkgdir/usr/src/aod-voltages-$aod_ver/Makefile"
    install -Dm644 src/aod-voltages/dkms.conf        "$pkgdir/usr/src/aod-voltages-$aod_ver/dkms.conf"

    # tuxbench DKMS module source
    local tb_ver
    tb_ver=$(grep '^PACKAGE_VERSION=' src/tuxbench/dkms.conf | cut -d= -f2 | tr -d '"')
    install -dm755 "$pkgdir/usr/src/tuxbench-$tb_ver"
    install -Dm644 src/tuxbench/tuxbench.c   "$pkgdir/usr/src/tuxbench-$tb_ver/tuxbench.c"
    install -Dm644 src/tuxbench/tuxbench.h   "$pkgdir/usr/src/tuxbench-$tb_ver/tuxbench.h"
    install -Dm644 src/tuxbench/Makefile     "$pkgdir/usr/src/tuxbench-$tb_ver/Makefile"
    install -Dm644 src/tuxbench/dkms.conf    "$pkgdir/usr/src/tuxbench-$tb_ver/dkms.conf"
}
