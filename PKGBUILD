# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>

pkgname=g15daemon
pkgver=1.9.5.5
pkgrel=1
pkgdesc="A daemon that makes it possible to use the G-Buttons and draw on the G15 LCD"
arch=('x86_64')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL')
depends=('libg15render>=1.3')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2
        g15daemon.service)
sha512sums=('b5707a4372e9b3993c05d1a7bfb93193cbe928586d0b77247e630c35be81122a13884dd4ea54eefee45f44a27522719e108a94228d4987b610327f5d5d328dbb'
            '45867c1737cbca98c8a069b30b383404c39438d70179fbd53a91f09921205c9739826ea7868388216219a6b24e4dee6814714a6d162c10dfb4a663a4efa8145d')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure --prefix=/usr --sbindir=/usr/bin --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m 644 "${srcdir}/g15daemon.service" \
                    "${pkgdir}/usr/lib/systemd/system/g15daemon.service"
}
