# Maintainer: Janek <precomp666@gmail.com>
pkgname=aic8800-linux7-dkms
pkgver=1.0.9
pkgrel=1
pkgdesc="AIC8800 (AX300) Wi-Fi driver with kernel 7.x.x support (DKMS)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/precomp666/aic8800-driver"
license=('GPL')
depends=('dkms')
makedepends=('patch')
provides=('aic8800')
conflicts=('aic8800')
install="aic8800-dkms.install"

source=("https://github.com/precomp666/aic8800-driver/archive/refs/heads/main.tar.gz"
        "kernel-7.x.patch"
        "dkms.conf")
sha256sums=('bd040773025cfebf6f252a24864b5e7797b92e023fb4e34e0035cbdc05987c82'
            '701ba39a185158b1e30b0ea48ff251d01b19d6c404ff5d5b77eca096482fab12'
            'c6f0ed565247bfb04ba06898b0c41557684b2481410443d9d5b01ac2e37426dd')

prepare() {
    cd "$srcdir/aic8800-driver-main"
    patch -p0 < "$srcdir/kernel-7.x.patch"
}

package() {
    cd "$srcdir/aic8800-driver-main"

    # Copy source code to DKMS directory
    install -dm755 "$pkgdir/usr/src/aic8800-${pkgver}"
    cp -r aic8800_fdrv aic_load_fw Kconfig Makefile "$pkgdir/usr/src/aic8800-${pkgver}/"
    
    # Setup dkms.conf
    install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/aic8800-${pkgver}/dkms.conf"
    sed -i "s/#MODULE_VERSION#/${pkgver}/" "$pkgdir/usr/src/aic8800-${pkgver}/dkms.conf"
    
    # Install firmware
    install -dm755 "$pkgdir/usr/lib/firmware/aic8800"
    cp -r aic8800-dkms/firmware/* "$pkgdir/usr/lib/firmware/" 2>/dev/null || true
}
