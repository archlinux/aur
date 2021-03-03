# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>

pkgname=g15daemon
pkgver=3.0
pkgrel=2
pkgdesc="A daemon that makes it possible to use the G-Buttons and draw on the G15 LCD"
arch=('x86_64')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL')
depends=('libg15render>=3.0')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('06dcb460584ef5d8051e1cbf36785be5385eea2ea431abc845ccbb7dde204acf2a1ca4c2905bb36cdd38128b6b54a1b9c6bc7ec93b6aa2c40cf36f4576bb471a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure --prefix=/usr --sbindir=/usr/bin --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/contrib/init/g15daemon.service" \
                    "${pkgdir}/usr/lib/systemd/system/g15daemon.service"
}
