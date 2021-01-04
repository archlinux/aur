# Maintainer: Fan Jiang <i@fanjiang.me>

# WARNING: You can get the software bundle from https://www.vmware.com/go/download-vmrc
# And put it under the same directory as this PKGBUILD!

pkgname=vmware-vmrc
pkgver=11.2.0
pkgrel=1
pkgdesc="VMWare VMRC Client."
arch=('x86_64')
url="https://www.vmware.com/go/download-vmrc"
license=('custom:vmware')
depends=('vmware-keymaps')
optdepends=()

# Note you can change this path to match a newer (or older) version of VMRC
source=("local://VMware-Remote-Console-12.0.0-17287072.x86_64.bundle"
        "bootstrap"
        "config")

sha256sums=('3429d897256e80d7e087ff9fc7b5e679695db06a9af2596b40d303e61c5000aa'
            '22282e8643d8a20e63773435161e5a5d01c6acce53aa81f27a4d20f111acd228'
            'c5643ebad140391622c57ab88d6071b91d1ea9a8379c1aec573c845a00be30d4')

build() {
    cd "$srcdir"
    sh ../VMware-Remote-Console-12.0.0-17287072.x86_64.bundle -x ./files
    cd "$srcdir/files"
}

package ()
{
    local vmware_installer_version=$(cat "$srcdir/files/vmware-installer/manifest.xml" | grep -oPm1 "(?<=<version>)[^<]+")
    # mkdir -p "$pkgdir/var/log"
    # mkdir -p "$pkgdir/etc/init.d"

    # Depend on vmware-keymaps
    rm -r $srcdir/files/vmware-vmrc-app/lib/xkeymap

    cd "$srcdir/files"
    mkdir -p "$pkgdir/usr/share" "$pkgdir/usr/bin" "$pkgdir/usr/lib/vmware" "$pkgdir/usr/lib/vmware/setup"
    cp -r \
        vmware-vmrc/share/* \
        vmware-player-core/share/* \
        vmware-vmrc-app/share/* \
        "$pkgdir/usr/share"

    cp -r \
        vmware-installer/bin/* \
        vmware-usbarbitrator/bin/* \
        vmware-vmrc-app/bin/* \
        "$pkgdir/usr/bin"

    cp -r \
        vmware-installer/lib/* \
        vmware-player-core/lib/* \
        vmware-vmrc-app/lib/* \
        vmware-vmrc/lib/* \
        "$pkgdir/usr/lib/vmware"
    
    cp -r \
        vmware-vmrc-setup/vmware-config \
        "$pkgdir/usr/lib/vmware/setup"
    
    # install -Dm 644 vmware-installer/bootstrap "$pkgdir/etc/vmware-installer/bootstrap"
    install -Dm 644 "$srcdir/bootstrap" "$pkgdir/etc/vmware/bootstrap"
    install -Dm 644 "$srcdir/config" "$pkgdir/etc/vmware/config"

    chmod +x \
        "$pkgdir/usr/bin"/* \
        "$pkgdir/usr/lib/vmware/bin"/* \
        "$pkgdir/usr/lib/vmware/setup"/* \
        "$pkgdir/usr/lib/vmware/lib"/libvmware-gksu.so/gksu-run-helper

    for link in \
        vmrc \
        vmware-gksu \
        vmware-setup-helper
    do
        ln -s /usr/lib/vmware/bin/appLoader "$pkgdir/usr/lib/vmware/bin/$link"
    done

    sed -i 's,@@BINARY@@,/usr/bin/vmrc,' "$pkgdir/usr/share/applications/vmware-vmrc.desktop"

    ln -s '/usr/lib/vmware/lib/libvmplayer.so/libvmplayer.so' "$pkgdir/usr/lib/vmware/lib/libvmplayer.so/libvmrc.so"
    ln -s '/usr/lib/vmware/lib/libvmplayer.so' "$pkgdir/usr/lib/vmware/lib/libvmrc.so"

    sed \
        -e "s/@@VERSION@@/$vmware_installer_version/" \
        -e "s,@@VMWARE_INSTALLER@@,/usr/lib/vmware-installer/$vmware_installer_version," \
        -i "$pkgdir/etc/vmware/bootstrap"
}
