# Maintainer: Andrew Kozik <andrewkoz at live dot com>

_pkgbasename=sane-airscan
pkgname=lib32-${_pkgbasename}
pkgver=0.99.29
pkgrel=1
pkgdesc="SANE - SANE backend for AirScan (eSCL) and WSD document scanners (32-bit)"
url="https://github.com/alexpevzner/sane-airscan"
arch=('x86_64')
license=('GPL-2.0-or-later WITH SANE-exception AND MIT')
depends=(${_pkgbasename} 'lib32-sane' 'lib32-avahi' 'lib32-gnutls' 'lib32-libxml2' 'lib32-libjpeg-turbo' 
        'lib32-libpng' 'lib32-libtiff' 'lib32-glibc')
#makedepends=('meson')
optdepends=('ipp-usb: allows to send HTTP requests via a USB connection on devices without Ethernet or WiFi connections')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/alexpevzner/${_pkgbasename}/archive/${pkgver}.tar.gz")
sha256sums=('e8aa43005ed495fc0db65e2ff51b29cef11a45fc6d8c385294b3394b848db65f')

build() {
    export CC="gcc -m32"

    cd ${_pkgbasename}-${pkgver}
    make CC="$CC"
}

package() {
    cd ${_pkgbasename}-${pkgver}
    make DESTDIR="${pkgdir}" install libdir=/usr/lib32
    # Remove conflicting files
    rm -rf "${pkgdir}"/{etc,usr/{share,lib,include,bin}}
    # add license + exception
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" {COPYING,LICENSE}
    # add missing .so symlink
    cd "${pkgdir}"/usr/lib32/sane
    ln -vsf libsane-airscan.so.1 libsane-airscan.so
}
