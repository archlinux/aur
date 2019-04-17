pkgname='sac-core'
pkgver='10.0.37'
pkgrel='11'
pkgdesc='Safenet Authentication Client for Alladin eToken, stripped core package'
arch=('x86_64')
depends=('pcsclite' 'libusb-compat' 'openssh' 'nss')
makedepends=('libarchive')
license=('custom')
install=$pkgname.install
source_x86_64=('https://storage.spidlas.cz/public/soft/safenet/SafenetAuthenticationClient-core-10.0.37-0_amd64.deb')
sha256sums_x86_64=('b4f8ffd030363693540bd494c3825ebd901937565cdd1c6455f95005571a27e5')
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
    cp --no-preserve=ownership "$srcdir/lib/libeToken.so.10.0.37" "$pkgdir/usr/lib/libeToken.so.10.0.37"
    cp --no-preserve=ownership "$srcdir/lib/libcardosTokenEngine.so.10.0.37" "$pkgdir/usr/lib/libcardosTokenEngine.so.10.0.37"

    mkdir -p "$pkgdir/etc"
    cp "$srcdir/eToken.conf" "$pkgdir/etc/eToken.conf"

    cd "$pkgdir/usr/lib/"
    ln -sf libeToken.so.10.0.37 libeTPkcs11.so
    ln -sf libeToken.so.10.0.37 libeToken.so.10.0
    ln -sf libeToken.so.10.0.37 libeToken.so.10
    ln -sf libeToken.so.10.0.37 libeToken.so
    ln -sf libcardosTokenEngine.so.10.0.37 libcardosTokenEngine.so.10.0
    ln -sf libcardosTokenEngine.so.10.0.37 libcardosTokenEngine.so.10
    ln -sf libcardosTokenEngine.so.10.0.37 libcardosTokenEngine.so

    cd "$pkgdir/usr/lib/pcsc/drivers/aks-ifdh.bundle/Contents/Linux/"
    ln -sf libAksIfdh.so.10.0 libAksIfdh.so
    ln -sf libAksIfdh.so.10.0 libAksIfdh.so.10
}

# To add eToken to Firefox eval output of this cmd:
#  find ~ -name secmod.db -type f -printf "modutil -dbdir %h -add eToken -libfile /usr/lib/libeToken.so -mechanisms RSA:DES -force\n"

# To add eToken to Chromium run this cmd:
#  modutil -dbdir sql:.pki/nssdb/ -add "eToken" -libfile /usr/lib/libeToken.so
#  modutil -dbdir sql:.pki/nssdb/ -list
