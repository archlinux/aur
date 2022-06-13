# Maintainer: Otto Sabart <aur@seberm.com>

# Ref.: https://github.com/QubesOS/qubes-core-agent-linux/tree/master/archlinux

pkgbase=qubes-core-agent-linux
pkgname=(qubes-vm-core qubes-vm-networking qubes-vm-keyring)
_gitname=${pkgname%-git*}
pkgver=4.0.65
pkgrel=1
pkgdesc="The Qubes core files for installation inside a Qubes VM."
arch=("x86_64")
url="https://github.com/QubesOS/qubes-core-agent-linux"
license=('GPL')
groups=()
makedepends=(gcc make pkg-config qubes-vm-utils qubes-libvchan qubes-db-vm qubes-vm-xen libx11 python python-setuptools lsb-release pandoc)
validpgpkeys=('0AF64C3B1F1214B38C8C57861FA2DBE674387CC3'  # Otto Sabart
              '0064428F455451B3EBE78A7F063938BA42CFA724'  # Marek Marczykowski-Górecki
              '427F11FD0FAA4B080123F01CDDFA1A3E36879494'  # Qubes Master Signing Key
)

source=(
    "$_gitname::git+https://github.com/QubesOS/qubes-core-agent-linux.git?signed#tag=v${pkgver}"
    PKGBUILD.qubes-ensure-lib-modules.service PKGBUILD.qubes-update-desktop-icons.hook
    PKGBUILD-qubes-pacman-options.conf
    PKGBUILD-qubes-repo-4.0.conf
    PKGBUILD-keyring-keys
    PKGBUILD-keyring-trusted
    PKGBUILD-keyring-revoked
)
sha512sums=(
    'SKIP'
    'a120135245847c387e940024dff5b6a744b80d8863373ecfe646cb8eeedf1316e223f3b7bb75f153185cb3d9e5fed9bcc14a3cd81448dd1c2d35531c5f8c7195'
    '1299ac686fa791436359ad33bb2de79f05a3c6059987b30e883a0c18bb7abaacf25ecc7ceeb762f2c1d5bcb9857aa88c106d36ca0977a2c1157bca6e3daee832'
    '1b45b221f5482dd3fca65169664fc008b976904e14da883cd2d690fe0568086f3cc0a3ee1bc48bccb644c3a8627969be5a4b86bdfa0526e5415fcef6ca4742ed'
    '3c7322fc5507e5ef8d3c8bbf55de2e23790142622be00aaf27ea8037dbd744895440dce814b7b4e86e9bc82be25a783fc858e86ff44b115e8330dc5580a608ad'
    'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e'
    'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e'
    '9bb8027d893ea92cf85788a1389a52da0b7d49cbd355e437a278cc2de0c1f229d7cee871767ffd0eda57dca6ca8d5cc1cd453316983e4cad13d3fc373be11675'
)

# Ref.: https://github.com/QubesOS/qubes-builder/blob/master/example-configs/qubes-os-master.conf#L9
qubes_backend_vmm=xen

build() {
    cd "${srcdir}/${_gitname}/"

    # Fix for network tools paths
    sed 's:/sbin/ifconfig:ifconfig:g' -i network/*
    sed 's:/sbin/route:route:g' -i network/*
    sed 's:/sbin/ethtool:ethtool:g' -i network/*
    sed 's:/sbin/ip:ip:g' -i network/*
    sed 's:/bin/grep:grep:g' -i network/*

    # Fix for archlinux sbindir
    sed 's:/usr/sbin/ntpdate:/usr/bin/ntpdate:g' -i qubes-rpc/sync-ntp-clock
    sed 's:/usr/sbin/qubes-firewall:/usr/bin/qubes-firewall:g' -i vm-systemd/qubes-firewall.service

    # Remove SELinux specific options from sudoers file
    sed 's:ROLE=unconfined_r TYPE=unconfined_t::g' -i misc/qubes.sudoers

    for dir in qubes-rpc qrexec misc; do
        make BACKEND_VMM="${qubes_backend_vmm}" -C "$dir"
    done
}


#This package provides:
# * qrexec agent
# * qubes rpc scripts
# * core linux tools and scripts
# * core systemd services and drop-ins
# * basic network functionality (setting IP address, DNS, default gateway)
package_qubes-vm-core() {
    depends=(qubes-vm-utils python-xdg ethtool ntp net-tools
             gnome-packagekit imagemagick fakeroot notification-daemon dconf
             zenity qubes-libvchan qubes-db-vm haveged python-gobject
             python-dbus xdg-utils notification-daemon gawk sed procps-ng librsvg
             socat pacman-contrib icu
            # Block updating if there is a major python update as the python API will be in the wrong PYTHONPATH
            #'python<3.10'
            'python<3.11'
             )
    optdepends=(gnome-keyring gnome-settings-daemon python-nautilus gpk-update-viewer qubes-vm-networking qubes-vm-keyring)
    install=PKGBUILD.install

    cd "${srcdir}/${_gitname}/"

    # Note: Archlinux removed use of directory such as /sbin /bin /usr/sbin (https://mailman.archlinux.org/pipermail/arch-dev-public/2012-March/022625.html)
    # shellcheck disable=SC2154
    make -C qrexec install DESTDIR="$pkgdir" SBINDIR=/usr/bin LIBDIR=/usr/lib SYSLIBDIR=/usr/lib

    make install-corevm DESTDIR="$pkgdir" SBINDIR=/usr/bin LIBDIR=/usr/lib SYSLIBDIR=/usr/lib SYSTEM_DROPIN_DIR=/usr/lib/systemd/system USER_DROPIN_DIR=/usr/lib/systemd/user DIST=archlinux

    # Remove things non wanted in archlinux
    rm -r "$pkgdir/etc/yum"*
    rm -r "$pkgdir/etc/dnf"*
    rm -r "$pkgdir/etc/init.d"
    # Remove fedora specific scripts
    rm "$pkgdir/etc/fstab"

    # Install systemd script allowing to automount /lib/modules
    install -m 644 "$srcdir/PKGBUILD.qubes-ensure-lib-modules.service" "${pkgdir}/usr/lib/systemd/system/qubes-ensure-lib-modules.service"

    # Install pacman hook to update desktop icons
    mkdir -p "${pkgdir}/usr/share/libalpm/hooks/"
    install -m 644 "$srcdir/PKGBUILD.qubes-update-desktop-icons.hook" "${pkgdir}/usr/share/libalpm/hooks/qubes-update-desktop-icons.hook"

    # Install pacman.d drop-ins (at least 1 drop-in must be installed or pacman will fail)
    mkdir -p "${pkgdir}/etc/pacman.d"
    install -m 644 "$srcdir/PKGBUILD-qubes-pacman-options.conf" "${pkgdir}/etc/pacman.d/10-qubes-options.conf"

    # Install pacman repository
    release=$(echo "$pkgver" | cut -d '.' -f 1,2)
    echo "Installing repository for release ${release}"
    install -m 644 "$srcdir/PKGBUILD-qubes-repo-${release}.conf" "${pkgdir}/etc/pacman.d/99-qubes-repository-${release}.conf.disabled"

    # Archlinux specific: enable autologin on tty1
    mkdir -p "$pkgdir/etc/systemd/system/getty@tty1.service.d/"
    cat <<EOF > "$pkgdir/etc/systemd/system/getty@tty1.service.d/autologin.conf"
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin user --noclear %I 38400 linux
EOF

    # Archlinux packaging guidelines: /var/run is a symlink to a tmpfs. Don't create it
    rm -r "$pkgdir/var/run"
}


#This package provides:
# * proxy service used by TemplateVMs to download updates
# * qubes-firewall service (FirewallVM)
#
#Integration of NetworkManager for Qubes VM:
# * make connections config persistent
# * adjust DNS redirections when needed
# * show/hide NetworkManager applet icon
#
package_qubes-vm-networking() {
    pkgdesc="Qubes OS tools allowing to use a Qubes VM as a NetVM/ProxyVM"
    depends=(qubes-vm-core qubes-vm-utils python ethtool net-tools
             qubes-db-vm networkmanager iptables tinyproxy nftables
             conntrack-tools
             )
    install=PKGBUILD-networking.install

    cd "${srcdir}/${_gitname}/"

    # shellcheck disable=SC2154
    make install-netvm DESTDIR="$pkgdir" SBINDIR=/usr/bin LIBDIR=/usr/lib SYSLIBDIR=/usr/lib SYSTEM_DROPIN_DIR=/usr/lib/systemd/system USER_DROPIN_DIR=/usr/lib/systemd/user DIST=archlinux
}


package_qubes-vm-keyring() {
    pkgdesc="Qubes OS Binary Repository Activation package and Keyring"
    install=PKGBUILD-keyring.install

    # Install keyring (will be activated through the .install file)
    install -dm755 "${pkgdir}/usr/share/pacman/keyrings/"
    install -m0644 PKGBUILD-keyring-keys "${pkgdir}/usr/share/pacman/keyrings/qubesos-vm.gpg"
    install -m0644 PKGBUILD-keyring-trusted "${pkgdir}/usr/share/pacman/keyrings/qubesos-vm-trusted"
    install -m0644 PKGBUILD-keyring-revoked "${pkgdir}/usr/share/pacman/keyrings/qubesos-vm-revoked"
}
