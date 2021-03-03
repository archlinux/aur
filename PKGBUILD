# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>

pkgname=g15daemon
pkgver=3.0
pkgrel=1
pkgdesc="A daemon that makes it possible to use the G-Buttons and draw on the G15 LCD"
arch=('x86_64')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL')
depends=('libg15render>=3.0')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('761deaa4be4f0ef7fb17f660862afc47de60a0341428642e1da059bf80f50bd213297618ec3b66acf100192ebbb944122e19795da93064a30b5d2ba9e8a2abc5')

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
