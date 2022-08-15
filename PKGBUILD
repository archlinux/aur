# Maintainer: shadichy <shadichy.dev@gmail.com>
pkgbase=systemback
pkgname=("lib${pkgbase}" "${pkgbase}-cli" "${pkgbase}-efiboot-amd64" "${pkgbase}-locales" "${pkgbase}-scheduler" "${pkgbase}")
pkgver=1.8.9
pkgrel=2
pkgdesc='Simple system backup and restore application with extra features'
arch=(any)
march=""
url='https://github.com/shadichy/systemback-archlinux'
license=('GPL')
depends=('util-linux' 'util-linux-libs' 'parted' 'qt5-base>=5.5.0' 'procps-ng' 'gnu-free-fonts' 'dosfstools' 'libisoburn' 'squashfs-tools' 'syslinux' 'xterm' 'xz' 'mkinitcpio-live-boot')
optdepends=('btrfs-progs' 'jfsutils' 'reiserfsprogs' 'xfsprogs' 'unionfs-fuse' 'update-grub' 'cdrtools')
makedepends=('ncurses' 'qt5-tools' 'make' 'gcc11' 'dpkg' 'debhelper' 'util-linux' 'util-linux-libs' 'qt5-base>=5.5.0' 'gcc11-libs' 'procps-ng')
# source=()
# md5sums=('SKIP')

case $(uname -m) in
    x86_64)
        march="amd64"
        ;;
    i686)
        march="i386"
        depends+=( 'libxcrypt-compat' 'llvm13-libs')
        ;;
    *)
        echo "Unsupported architecture: $(uname -m)"
        exit 1
        ;;
esac

build() {
    cd "../${pkgbase}"
    dpkg-buildpackage -d -us -uc
}

package_libsystemback() {
    pkgdesc='Libary for Systemback'
    dpkg-deb -xv "../lib${pkgbase}_${pkgver}_${march}.deb" "${pkgdir}"
    install -dm755 "${pkgdir}/usr"
}
package_systemback-cli() {
    depends+=('ncurses' 'libsystemback' 'systemback-efiboot-amd64')
    optdepends+=('amd-ucode' 'intel-ucode')
    dpkg-deb -xv "../${pkgbase}-cli_${pkgver}_${march}.deb" "${pkgdir}"
    install -dm755 "${pkgdir}/usr"
}
package_systemback-efiboot-amd64() {
    pkgdesc='Systemback EFI bootloader support'
    depends=('syslinux' 'libsystemback')
    optdepends=('grub' 'systemback')
    dpkg-deb -xv "../${pkgbase}-efiboot-amd64_${pkgver}_all.deb" "${pkgdir}"
    install -dm755 "${pkgdir}/usr"
}
package_systemback-locales() {
    pkgdesc='Systemback language support'
    depends=('libsystemback')
    optdepends=('systemback')
    dpkg-deb -xv "../${pkgbase}-locales_${pkgver}_all.deb" "${pkgdir}"
    install -dm755 "${pkgdir}/usr"
}
package_systemback-scheduler() {
    pkgdesc='Systemback scheduler'
    depends+=('libsystemback')
    optdepends=('systemback')
    dpkg-deb -xv "../${pkgbase}-scheduler_${pkgver}_${march}.deb" "${pkgdir}"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp "../${pkgbase}/systemback.desktop" "${pkgdir}/usr/share/applications/org.systemback.sbsustart.desktop"
    mkdir -p "${pkgdir}/usr/bin"
    cat << EOF > "${pkgdir}/usr/bin/sbsustart"
#!/bin/bash

BASE_CMD="/usr/lib/systemback/sbsustart \$@"

if test "x\`id -u\`" != "x0"; then
    if test "xpkexec --disable-internal-agent" = "x"; then
        echo "Root privileges are required for running systemback."
        \$BASE_CMD
        exit 1
    fi

    ENABLE_XHOST_ROOT=yes
    GRANTED_XHOST_ROOT=no
    if test "x\$ENABLE_XHOST_ROOT" = 'xyes' && xhost 1> /dev/null 2>&1; then
        if ! xhost | grep -qi 'SI:localuser:root$'; then
            xhost +SI:localuser:root
            GRANTED_XHOST_ROOT=yes
        fi
    fi

    pkexec --disable-internal-agent '/usr/bin/sbsustart' "\$@"
    status=\$?

    if test "x\$GRANTED_XHOST_ROOT" = 'xyes'; then
        xhost -SI:localuser:root
    fi
    exit \$status
fi

\$BASE_CMD
EOF
    chmod +755 "${pkgdir}/usr/bin/sbsustart"
    mkdir -p "${pkgdir}/usr/share/polkit-1/actions/"
    cat << EOF > "${pkgdir}/usr/share/polkit-1/actions/org.systemback.sbsustart.policy"
<?xml version="1.0"?>
<!DOCTYPE policyconfig PUBLIC "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN" "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
<policyconfig>
    <vendor>systemback</vendor>
    <vendor_url>https://github.com/shadichy/systemback-archlinux</vendor_url>
    <action id="org.systemback.sbsustart">
        <description>Run Systemback Scheduler</description>
        <Message>Authorize Systemback Scheduler to run</Message>
        <icon_name>systemback</icon_name>
        <defaults>
            <allow_any>auth_admin</allow_any>
            <allow_active>auth_admin</allow_active>
            <allow_inactive>auth_admin</allow_inactive>
        </defaults>
        <annotate key="org.freedesktop.policykit.exec.path">/usr/bin/sbsustart</annotate>
        <annotate key="org.freedesktop.policykit.exec.allow_gui">true</annotate>
    </action>
</policyconfig>
EOF
    install -dm755 "${pkgdir}/usr"
}
package_systemback() {
    depends+=( 'libx11' 'zenity' 'libsystemback' 'systemback-efiboot-amd64' 'systemback-locales' 'systemback-scheduler' 'grub' 'mtools')
    optdepends+=('kdialog' 'amd-ucode' 'intel-ucode')
    dpkg-deb -xv "../${pkgbase}_${pkgver}_${march}.deb" "${pkgdir}"
    cp "${pkgdir}/usr/share/applications/systemback.desktop" "${pkgdir}/usr/share/applications/org.systemback.systemback.desktop"
    mv "${pkgdir}/usr/bin/systemback" "${pkgdir}/usr/lib/systemback/sbbin"
    cat <<EOF >"${pkgdir}/usr/bin/systemback"
#!/bin/bash

BASE_CMD="/usr/lib/systemback/sbbin \$@"

if test "x\`id -u\`" != "x0"; then
    if test "xpkexec --disable-internal-agent" = "x"; then
        echo "Root privileges are required for running systemback."
        \$BASE_CMD
        exit 1
    fi
    ENABLE_XHOST_ROOT=yes
    GRANTED_XHOST_ROOT=no
    if test "x\$ENABLE_XHOST_ROOT" = 'xyes' && xhost 1> /dev/null 2>&1; then
        if ! xhost | grep -qi 'SI:localuser:root$'; then
            xhost +SI:localuser:root
            GRANTED_XHOST_ROOT=yes
        fi
    fi

    pkexec --disable-internal-agent '/usr/bin/systemback' "\$@"
    status=\$?

    if test "x\$GRANTED_XHOST_ROOT" = 'xyes'; then
        xhost -SI:localuser:root
    fi
    exit \$status
fi

\$BASE_CMD
EOF
    chmod +755 "${pkgdir}/usr/bin/systemback"
    cp "../${pkgbase}/reserved_usernames" "${pkgdir}/usr/share/systemback/reserved_usernames"
    mkdir -p "${pkgdir}/usr/share/systemback/scripts"
    mkdir -p "${pkgdir}/usr/share/polkit-1/actions/"
    cat << EOF > "${pkgdir}/usr/share/polkit-1/actions/org.systemback.systemback.policy"
<?xml version="1.0"?>
<!DOCTYPE policyconfig PUBLIC "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN" "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
<policyconfig>
    <vendor>systemback</vendor>
    <vendor_url>https://github.com/shadichy/systemback-archlinux</vendor_url>
    <action id="org.systemback.systemback">
        <description>Run Systemback</description>
        <Message>Authorize Systemback to run</Message>
        <icon_name>systemback</icon_name>
        <defaults>
            <allow_any>auth_admin</allow_any>
            <allow_active>auth_admin</allow_active>
            <allow_inactive>auth_admin</allow_inactive>
        </defaults>
        <annotate key="org.freedesktop.policykit.exec.path">/usr/bin/systemback</annotate>
        <annotate key="org.freedesktop.policykit.exec.allow_gui">true</annotate>
    </action>
</policyconfig>
EOF
    mkdir -p "${pkgdir}/etc/systemback"
    cat << EOF > "${pkgdir}/etc/systemback/systemback.conf"
### Restore points settings

#  storage_directory=<path>
#  storage_dir_is_mount_point=[true/false]
#  max_temporary_restore_points=[3-10]
#  use_incremental_backup_method=[true/false]



### Live system settings

#  working_directory=<path>
#  use_xz_compressor=[true/false]
#  auto_iso_images=[true/false]



### Scheduler settigns

#  enabled=[true/false]
#  schedule=[0-7]:[0-23]:[0-59]:[10-99]
#  silent=[true/false]
#  window_position=[topleft/topright/center/bottomleft/bottomright]
#  disable_starting_for_users=[false/everyone/:<username,list>]



### User interface settings

#  language=[auto/<language_COUNTRY>]



### Graphical user interface settings

#  style=[auto/<name>]
#  window_scaling_factor=[auto/1/1.5/2]
#  always_on_top=[true/false]



### Host system settings

#  disable_cache_emptying=[true/false]



EOF
    touch "${pkgdir}/etc/systemback/systemback.includes"
    touch "${pkgdir}/etc/systemback/systemback.excludes"
    install -dm755 "${pkgdir}/usr"
    install -dm755 "${pkgdir}/etc"
}
