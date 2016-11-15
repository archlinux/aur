pkgname='sac-core'
pkgver='9.0.43'
pkgrel='1'
pkgdesc='Safenet Authentication Client for Alladin eToken'
arch=('i686' 'x86_64')
depends=('pcsclite' 'pcsc-tools' 'libusb-compat' 'openssh')
makedepends=('libarchive')
license=('custom')
source_i686=('http://packages.mirohost.net/etoken/Linux/Core/SafenetAuthenticationClient-core-9.0.43-0_i386.deb')
source_x86_64=('http://packages.mirohost.net/etoken/Linux/Core/SafenetAuthenticationClient-core-9.0.43-0_amd64.deb')
sha256sums_i686=('665cf6b1b1acdefdb6a3eca2845305c2ca03146e27fdf3c446ddcc0b5fe9d7da')
sha256sums_x86_64=('43c0ddb2e4e7eaa2de530e5236661bef748401316679bc231a0620d89badbfdc')
source+=('eToken.conf'
         'etoken.service'
         'etoken.module')
sha256sums+=('85b850b820610e029428e577ca0e48f6fb7b4148ae8d702ca20b191963046c6c'
             'a45c4456fdfb397bf5483bd0cdb6d30cc0ad5a7cde633c31784007b0d5e26974'
             'eb3b127fdd4f2e5b41f8b8e9f155343e525e6c7121c21758e856422a7e67d2b2')
build() {
    bsdtar -xf "$srcdir/data.tar.gz"
}

package() {
    mkdir -p "$pkgdir/usr/lib/pcsc/drivers"
    mkdir -p "$pkgdir/var/cache/eToken"
    cp -dpr --no-preserve=ownership "$srcdir/usr/bin" "$pkgdir/usr"
    cp -dpr --no-preserve=ownership "$srcdir/usr/share/eToken/drivers/aks-ifdh.bundle" "$pkgdir/usr/lib/pcsc/drivers"
    cp -dpr --no-preserve=ownership "$srcdir/lib" "$pkgdir/usr"
    rm "$pkgdir/usr/lib/pcsc/drivers/aks-ifdh.bundle/Contents/Linux/readme.txt"

    mkdir -p "$pkgdir/etc"
    cp "$srcdir/eToken.conf" "$pkgdir/etc/eToken.conf"

    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    cp "$srcdir/etoken.service" "$pkgdir/usr/lib/systemd/system/etoken.service"

    mkdir -p "$pkgdir/usr/share/p11-kit/modules/"
    cp "$srcdir/etoken.module" "$pkgdir/usr/share/p11-kit/modules/etoken.module"

    cd "$pkgdir/usr/lib/pcsc/drivers/aks-ifdh.bundle/Contents/Linux/"
    ln -sf libAksIfdh.so.9.0 libAksIfdh.so

    cd "$pkgdir/usr/lib/"
    ln -sf libeToken.so.9.0.43 libeTPkcs11.so
    ln -sf libeToken.so.9.0.43 libeToken.so
    ln -sf libcardosTokenEngine.so.9.0.43 libcardosTokenEngine.so
    ln -sf libeTokenHID.so.9.0.43 libeTokenHID.so
    ln -sf libetvTokenEngine.so.9.0.43 libetvTokenEngine.so
    ln -sf libiKeyTokenEngine.so.9.0.43 libiKeyTokenEngine.so
    ln -sf libSACLog.so.9.0.43 libSACLog.so

    mkdir -p "$pkgdir/usr/lib/pkcs11/"
    cd "$pkgdir/usr/lib/pkcs11/"
    ln -sf /usr/lib/libeTPkcs11.so libeTPkcs11.so
}

post_install() {
    echo "Enabling systemd services"
    systemctl enable pcscd.service
    systemctl enable etoken.service
    echo "Starting systemd services"
    systemctl start pcscd.service
    systemctl start etoken.service
}

post_upgrade() {
    echo "Reloading systemd"
    systemctl daemon-reload
}
