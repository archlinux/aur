# Maintainer: Jack Mitchell <jack@embed.me.uk>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>

pkgname=xboxdrv
pkgver=0.8.5
pkgrel=3
url="http://pingus.seul.org/~grumbel/${pkgname}/"
pkgdesc="Userspace gamepad driver for Linux"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('libx11' 'dbus-glib' 'libusbx' 'python2')
makedepends=('scons' 'boost' 'pkg-config' 'libx11' 'dbus-glib' 'libusb')
backup=("etc/default/${pkgname}")

source=("http://pingus.seul.org/~grumbel/${pkgname}/${pkgname}-linux-${pkgver}.tar.bz2"
        "${pkgname}.service"
        "${pkgname}.default")

sha512sums=('954a3664462dfeff63a455f3dfea4bc14f8c3e07fa9b0c299bb523b4089faad7f8d634511eb66c023bd289adbbf18e96ce26cbcf5b8ffc9bb3088f1afe532601'
            'f1094119372512b29c070949606d6ee7ebd119195a717ddac8a60a0c94016b7d82b569283f02e05ad3e5e76227e8437c7072d346b30960d1eb2a4a681894d5d3'
            '4f6e9a12b208254e19daba477dd7787147a8b2c8a83007d92f8cfce6212c21ce3306f23a2669080f0e46986ca102ab08c262b42c678caf1a891326b4e2c40b5f')

prepare() {
  cd ${pkgname}-linux-${pkgver}
  sed -e 's/env python$/env python2/g' -i xboxdrvctl
}

build() {
  cd ${pkgname}-linux-${pkgver}
  scons $MAKEFLAGS
}

package() {
  install -Dm644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 ${pkgname}.default "${pkgdir}/etc/default/${pkgname}"
  cd ${pkgname}-linux-${pkgver}
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
