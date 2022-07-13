# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=yoctopuce
pkgver=1.10.50357
pkgrel=1
pkgdesc="C++ library for interfacing with Yoctopuce devices"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/yoctopuce/yoctolib_cpp"
license=('custom')
groups=('yoctopuce-libs')
depends=('gcc-libs' 'libusb')
provides=('libyocto.so' 'libyapi.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'LICENSE'
        'Makefile.patch')
sha256sums=('9824dfd81e4f67f53528afe1773fb8c459ed58de3d56eac775f06a3f42207d18'
            '2b22a5342677bd71e40e9fadab57146a8662ded89e97ac98b8726fb9a0e22e30'
            '66f99adc2a693645dfe1e92961f075d0abbb65b748e5ffb64be8e67188ffeb4d')

prepare() {
	patch -p1 -d "yoctolib_cpp-$pkgver/" < Makefile.patch
}

build() {
	make -C "yoctolib_cpp-$pkgver/Binaries"
}

package() {
	local x86_64=64bits i686=32bits armv7h=armhf
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	cd "yoctolib_cpp-$pkgver"
	install -Dm644 "Binaries/linux/${!CARCH}/"libyocto.so.* -t "$pkgdir/usr/lib/"
	install -Dm644 "Binaries/linux/${!CARCH}/yapi/"libyapi.so.* -t "$pkgdir/usr/lib/"
	install -Dm644 udev_conf/51-yoctopuce_group.rules -t "$pkgdir/usr/lib/udev/rules.d/"
}
