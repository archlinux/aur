# Maintainer: Alex Potapenko <opotapenko@gmail.com>

pkgname=libusb0-debian
_pkgname=libusb
pkgver=0.1.12
pkgrel=1
pkgdesc="Library to enable user space application programs to communicate with USB devices. 0.x branch. With Debian's patches."
arch=('i686' 'x86_64')
url="https://libusb.info/"
license=('LGPL')
provides=('libusb-compat' 'libusb0')
conflicts=('libusb-compat' 'libusb0')
_debianver_="35"
_debianver="${pkgver}-${_debianver_}"
depends=('glibc' 'sh')
makedepends=('automake')
source=("http://deb.debian.org/debian/pool/main/libu/libusb/libusb_${pkgver}.orig.tar.gz"
        "http://deb.debian.org/debian/pool/main/libu/libusb/libusb_${_debianver}.debian.tar.xz")
sha256sums=('37f6f7d9de74196eb5fc0bbe0aea9b5c939de7f500acba3af6fd643f3b538b44'
            '82636fa4e49fe8a886f5dbab4756e6c6855f1cb5173fa567848e3de9f47bf2bd')

prepare() {
    cd "${_pkgname}-${pkgver}"

     local patches=(
            00_packed.diff
            01_ansi.diff
            02_usbpp.diff
            03_const_buffers.diff
            04_infinite_loop.diff
            05_emdebian_libs.diff
            06_bsd.diff
            07_altsetting_alloc.diff
            08_bus_location.diff
            09_dummy.diff
            10_hurd.diff
            11_transfer_timeout.diff
            12_ENAMETOOLONG.diff
            91_ac_prog_cxx.diff

    )

    for i in "${patches[@]}"; do
        msg "Applying ${i} ..."
        patch -p1 -i "../debian/patches/${i}"
    done

    autoreconf -vif
}

build() {
    cd "${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr
    make
}

package() {
    cd "${_pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
    rm -f "$pkgdir"/usr/lib/libusbpp.a "$pkgdir"/usr/lib/libusbpp.so "$pkgdir"/usr/lib/libusbpp-0.1.so.*
}
