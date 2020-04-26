# Maintainer: Patryk < patryk at kowalczyk ws>
# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=smartcam
pkgver=1.4.0
pkgrel=15
pkgdesc="utility that turns a Symbian or android phones with bluetooth or wifi and camera into a handy webcam ready to use with your PC"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
url="http://smartcam.sourceforge.net/"
depends=('gconf' 'bluez-libs' 'hicolor-icon-theme' 'intltool')
makedepends=('linux-headers')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}_linux/${pkgname}_linux_v_${pkgver}/${pkgname}-${pkgver}.tar.gz" 
	'smartcam.install' 
	'smartcam_1.4.0-kernel2.6.32.diff' 
	'paolo-assis.patch'
	'smartcam_1.4.0-kernel3.2.patch'
	'smartcam_1.4.0-kernel3.18.patch'
	'smartcam_server1.4.0.patch')

install=smartcam.install
build() {
    cd $srcdir/$pkgname-$pkgver
    # the patch below was working for older kernels
    #patch -p1 < ../smartcam_1.4.0-0ubuntu1.diff
    # this works for 2.6.32 but is a bit dirty
    #patch -p1 < ../smartcam_1.4.0-kernel2.6.32.diff driver_src/smartcam.c
    # so instead i'm going to use a patch by paolo assis
    #patch -p1 < ../paolo-assis.patch driver_src/smartcam.c
    # solves segfault at startup when no bluetooth module loaded (archspeps)
    #sed '47 s:BLUETOOTH:INET:' -i src/UserSettings.h
    # enables to compile on 3.2+ kernels (andrews)
    #sed -i '/\/\/#include <linux\/module.h>/s%//%%' driver_src/smartcam.c
    patch -p1 < ../smartcam_1.4.0-kernel3.2.patch
    #https://github.com/patrykk/smartcam/commits/master
    patch -p1 < ../smartcam_1.4.0-kernel3.18.patch
    #
    patch  -p1 < ../smartcam_server1.4.0.patch 
    CPPFLAGS="-fpermissive" ./configure --prefix=/usr
    make
}

package() {
    mkdir -p ${pkgdir}/usr/lib/modules/`uname -r`/kernel/drivers/video
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="${pkgdir}" install
    cd driver_src/
    make -C /usr/lib/modules/`uname -r`/build M=`pwd`
    install -D -m644 smartcam.ko "${pkgdir}"/usr/lib/modules/`uname -r`/kernel/drivers/video/smartcam.ko
}
md5sums=('6b3eba0c05bbc2b1563529beb0467076'
         '678f10848ef4ed0119adc3b159f3bc46'
         '177de87a5d492370560e7d3a85bf4034'
         'bd42157611a31f19eedf1984e7bb29a7'
         'e8e7633f9d45606a624a7d58050aeea0'
         'fd01241ddecb0153223e9b810858f368'
         '397f3c8379538c32178798a96c1f8358')
