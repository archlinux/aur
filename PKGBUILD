# Maintainer: Richard Schneider <richard@schneiderbox.net>
# Contributor: Fan Jiang <i@fanjiang.me>

# IMPORTANT: You must download the VMware-Remote-Console .bundle from
# https://www.vmware.com/go/download-vmrc and place it in the directory
# with this PKGBUILD.

pkgname=vmware-vmrc
pkgver=12.0.5
pkgrel=1
pkgdesc='VMware Remote Console'
arch=('x86_64')
url="https://www.vmware.com/go/download-vmrc"
license=('custom:vmware')
depends=()
optdepends=('vmware-keymaps')

source=(
    "VMware-Remote-Console-$pkgver-22744838.x86_64.bundle"
    'bootstrap'
    'config'
)

sha256sums=('022e6a4a2766e80c6fb15224c71d19b180d31780e9aab665cdd48e58b3e1531d'
            '22282e8643d8a20e63773435161e5a5d01c6acce53aa81f27a4d20f111acd228'
            'c5643ebad140391622c57ab88d6071b91d1ea9a8379c1aec573c845a00be30d4')

build() {
    cd "$srcdir"
    rm -fr ./bundle
    sh ../${source[0]} -x ./bundle
    cd "$srcdir/bundle"
}

package () {
    # Remove files provided by vmware-keymaps
    rm -r $srcdir/bundle/vmware-vmrc-app/lib/xkeymap

    cd "$srcdir/bundle"
    mkdir -p "$pkgdir/usr/share" "$pkgdir/usr/bin" "$pkgdir/usr/lib/vmware" "$pkgdir/usr/lib/vmware/setup"
    cp -r \
        vmware-vmrc/share/* \
        vmware-player-core/share/* \
        vmware-vmrc-app/share/* \
        "$pkgdir/usr/share"

    cp -r \
        vmware-usbarbitrator/bin/* \
        vmware-vmrc-app/bin/* \
        "$pkgdir/usr/bin"

    cp -r \
        vmware-player-core/lib/* \
        vmware-vmrc-app/lib/* \
        vmware-vmrc/lib/* \
        "$pkgdir/usr/lib/vmware"
    
    cp -r \
        vmware-vmrc-setup/vmware-config \
        "$pkgdir/usr/lib/vmware/setup"
    
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

    install -Dm644 "vmware-vmrc/doc/EULA" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
