pkgname='sac-core'
pkgver='9.1.7'
pkgrel='3'
pkgdesc='Safenet Authentication Client for Alladin eToken, stripped core package'
arch=('x86_64')
depends=('pcsclite' 'libusb-compat' 'openssh' 'nss')
makedepends=('libarchive')
license=('custom')
source_x86_64=('http://packages.mirohost.net/etoken/Linux/Core/SafenetAuthenticationClient-core-9.1.7-0_amd64.deb')
sha256sums_x86_64=('bafd836ade7524ce5634525b7fc89b99c7ba4b2d0b908d21d960e11714204300')
source+=('eToken.conf')
sha256sums+=('85b850b820610e029428e577ca0e48f6fb7b4148ae8d702ca20b191963046c6c')

build() {
    bsdtar -xf "$srcdir/data.tar.gz"
}

package() {
    mkdir -p "$pkgdir/usr/lib/pcsc/drivers"
    cp -dpr --no-preserve=ownership "$srcdir/usr/share/eToken/drivers/aks-ifdh.bundle" "$pkgdir/usr/lib/pcsc/drivers"
    rm "$pkgdir/usr/lib/pcsc/drivers/aks-ifdh.bundle/Contents/Linux/readme.txt"

    mkdir -p "$pkgdir/usr/lib"
    cp --no-preserve=ownership "$srcdir/lib/libeToken.so.9.1.7" "$pkgdir/usr/lib/libeToken.so.9.1.7"

    mkdir -p "$pkgdir/etc"
    cp "$srcdir/eToken.conf" "$pkgdir/etc/eToken.conf"

    cd "$pkgdir/usr/lib/"
    ln -sf libeToken.so.9.1.7 libeTPkcs11.so
    ln -sf libeToken.so.9.1.7 libeToken.so.9.1
    ln -sf libeToken.so.9.1.7 libeToken.so.9
    ln -sf libeToken.so.9.1.7 libeToken.so

    cd "$pkgdir/usr/lib/pcsc/drivers/aks-ifdh.bundle/Contents/Linux/"
    ln -sf libAksIfdh.so.9.1 libAksIfdh.so
    ln -sf libAksIfdh.so.9.1 libAksIfdh.so.9
}

post_install() {
    ldconfig >& /dev/null
    systemctl daemon-reload
    systemctl restart pcscd.service
}

post_upgrade() {
    ldconfig >& /dev/null
    systemctl daemon-reload
    systemctl restart pcscd.service
}
