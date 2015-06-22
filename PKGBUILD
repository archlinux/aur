# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Original Package: Vítor Ferreira <vitor.dominor@gmail.com>
pkgname=xboxdrv-git
pkgver=0.9.0.1412.a99985e
pkgrel=1
pkgdesc="An XBox/XBox 360 gamepad driver - as alternative to the xpad-kernel module - with more configurability, runs in userspace and supports a multitude of controllers"
arch=('i686' 'x86_64')
url="http://pingus.seul.org/~grumbel/xboxdrv/"
license=('GPL3')
depends=('libx11' 'dbus-glib' 'libusbx')
makedepends=('git' 'scons' 'boost' 'pkg-config' 'libx11' 'dbus-glib' 'libusb')
provides=('xboxdrv='$pkgver)
conflicts=('xboxdrv')
source=("${pkgname}::git://github.com/Grumbel/xboxdrv.git"
         "xboxdrv.service"
         "xboxdrv.conf")
md5sums=('SKIP'
         'c44dc13f6d34cd7fc61c87ecd8c3a547'
         'c73bb9cf8ff763e7c477366472d19813')

pkgver() {
    cd ${srcdir}/${pkgname}
    ver=$(cat VERSION)
    revision=$(git rev-list --count HEAD)
    hash=$(git log --pretty=format:'%h' -n 1)
    echo $ver.$revision.$hash
}

build() {
    cd ${srcdir}/${pkgname}
    make PREFIX=/usr
}

package() {
    cd ${srcdir}/${pkgname}
    make PREFIX=/usr DESTDIR="$pkgdir/" install
  
    install -D -m755 "$srcdir/xboxdrv.service" "$pkgdir/usr/lib/systemd/system/xboxdrv.service"
    install -D -m644 "$srcdir/xboxdrv.conf" "$pkgdir/etc/conf.d/xboxdrv"
}

# vim:set ts=2 sw=2 et:
