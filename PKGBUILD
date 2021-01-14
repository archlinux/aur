# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>

pkgname=hidapi-git
pkgver=0.10.1.r3.gfb4135c
pkgrel=1
epoch=1
pkgdesc='Simple library for communicating with USB and Bluetooth HID devices'
arch=(x86_64)
url='https://github.com/libusb/hidapi'
license=('GPL3' 'BSD' 'custom')
makedepends=('git' 'systemd' 'systemd-libs' 'libusb')
optdepends=('libusb: for the libusb backend -- hidapi-libusb.so'
            'libudev.so: for the hidraw backend -- hidapi-hidraw.so')
conflicts=('hidapi')
provides=('hidapi')
source=("$pkgname::git+$url" 'autoconf-2.70.patch')
sha256sums=('SKIP' 'aeb7706401fc6e9b5b042217622e74ce314142141c91ebc41e185c7bd4a48d57')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/hidapi\.//'
}

build() {
    cd "$srcdir/$pkgname"
    git apply ../autoconf-2.70.patch
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    rm -f "${pkgdir}/usr/share/doc/hidapi/"LICENSE*
    install -m0644 LICENSE.txt LICENSE-bsd.txt LICENSE-orig.txt "$pkgdir/usr/share/licenses/$pkgname"
}
