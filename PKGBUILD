# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jack Mitchell <jack@embed.me.uk>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>

pkgname=xboxdrv
pkgver=0.8.8
pkgrel=2
pkgdesc='Userspace gamepad driver for Linux'
url='http://pingus.seul.org/~grumbel/xboxdrv'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libx11' 'dbus-glib' 'libusb' 'python2-dbus')
makedepends=('scons' 'boost' 'pkg-config' 'libx11')
backup=("etc/default/${pkgname}")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/xboxdrv/${pkgname}/archive/v${pkgver}.tar.gz
        ${pkgname}.service
        ${pkgname}.default)
sha512sums=('3f27856da211a14e27a84fa5919da7965262adc36da16c75eed9bae891098183b5751a3e707573b4ab64e69096ea74d455e8f64827c88b38b65af94cc13b34ad'
            'f1a4e7b1a06e951c3a4f5bcdec5f14db542b34963950619f0d4b1ee324d64b18ca2f63642719ef65a63e424702fb0eb33e0259937906732e587b96a9582c2e6b'
            '4f6e9a12b208254e19daba477dd7787147a8b2c8a83007d92f8cfce6212c21ce3306f23a2669080f0e46986ca102ab08c262b42c678caf1a891326b4e2c40b5f')

prepare() {
  cd ${pkgname}-${pkgver}
  sed 's|python|python2|g' -i examples/*.py
}

build() {
  cd ${pkgname}-${pkgver}
  scons \
    LINKFLAGS="${LDFLAGS}" \
    CXXFLAGS="${CPPFLAGS} ${CXXFLAGS}" \
    "${MAKEFLAGS}"
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm 644 "${srcdir}/${pkgname}.default" "${pkgdir}/etc/default/${pkgname}"
  install -Dm 644 README.md NEWS PROTOCOL -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 examples/* -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
  install -Dm 644 data/org.seul.Xboxdrv.conf -t "${pkgdir}/etc/dbus-1/system.d"
}

# vim: ts=2 sw=2 et:
