# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jack Mitchell <jack@embed.me.uk>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>

pkgname=xboxdrv
pkgver=0.8.7
pkgrel=1
pkgdesc="Userspace gamepad driver for Linux"
url="http://pingus.seul.org/~grumbel/xboxdrv"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libx11' 'dbus-glib' 'libusbx' 'python2')
makedepends=('scons' 'boost' 'pkg-config' 'libx11' 'dbus-glib' 'libusb')
backup=("etc/default/${pkgname}")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/xboxdrv/${pkgname}/archive/v${pkgver}.tar.gz
        ${pkgname}.service
        ${pkgname}.default)
sha512sums=('7d72d3e55be048ee005ee4c6383eb8620811d949a02005ce6c01b2866e836040392cef0691ce8cfd8402264c071c9088485ab15b47655578206962b4d3fc280a'
            'f1094119372512b29c070949606d6ee7ebd119195a717ddac8a60a0c94016b7d82b569283f02e05ad3e5e76227e8437c7072d346b30960d1eb2a4a681894d5d3'
            '4f6e9a12b208254e19daba477dd7787147a8b2c8a83007d92f8cfce6212c21ce3306f23a2669080f0e46986ca102ab08c262b42c678caf1a891326b4e2c40b5f')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -r 's|(env python)$|\12|g' -i xboxdrvctl
}

build() {
  cd ${pkgname}-${pkgver}
  scons \
    BUILD=custom \
    LINKFLAGS="${LDFLAGS}" \
    CXXFLAGS="${CPPFLAGS} ${CXXFLAGS}" \
    "${MAKEFLAGS}"
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm 644 "${srcdir}/${pkgname}.default" "${pkgdir}/etc/default/${pkgname}"
}

# vim: ts=2 sw=2 et:
