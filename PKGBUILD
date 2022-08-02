    # Maintainer: shadichy <shadichy.dev@gmail.com>
    pkgname=("systemback-scheduler")
    pkgver=1.8.9
    pkgrel=2
    pkgdesc='Systemback scheduler'
    arch=('x86_64')
    url='https://github.com/shadichy/systemback-archlinux'
    license=('GPL')
    depends=('libsystemback')
    makedepends=('ncurses' 'qt5-tools' 'make' 'gcc11' 'dpkg' 'debhelper' 'util-linux' 'util-linux-libs' 'qt5-base>=5.5.0' 'gcc-libs' 'procps-ng')
    source=(systemback-archlinux::git+https://github.com/shadichy/systemback-archlinux.git)
    md5sums=('SKIP')

    build() {
        cd "${srcdir}/systemback-archlinux/systemback"
        dpkg-buildpackage -d -us -uc
    }

    package() {
        dpkg-deb -xv "${srcdir}/systemback-archlinux/systemback-scheduler_${pkgver}_amd64.deb" "${srcdir}/systemback-archlinux/systemback-scheduler"
        cp -dr --no-preserve=ownership "${srcdir}/systemback-archlinux/systemback-scheduler/usr" "${pkgdir}/usr"
        mkdir -p "${pkgdir}/usr/share/applications"
        cp "${srcdir}/systemback-archlinux/systemback/systemback.desktop" "${pkgdir}/usr/share/applications/org.systemback.sbsustart.desktop"
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
