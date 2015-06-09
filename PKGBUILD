#Mantainer: Marcello "mereghost" Rocha <marcello.rocha@gmail.com>
#Contributor: Gianni Vialetto <gianni at rootcube dot net>
#Contributor: Stefan J. Betz <info at stefan-betz dot net>
#Contributor: p2k <Patrick dot Schneider at uni-ulm dot de>
#Contributor: Jonathan Liu <net147@gmail.com>
#Contributor: Christopher Grebs <cg@webshox.org>
#Contributor: mutantmonkey

pkgname=rabbitmq
pkgver=3.5.3
pkgrel=3
pkgdesc="Highly reliable and performant enterprise messaging implementation of AMQP written in Erlang/OTP"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://rabbitmq.com"
license=('MPL')
depends=('erlang-nox' 'systemd')
provides=('rabbitmq-systemd-unit')
conflicts=('rabbitmq-systemd-unit')
backup=('etc/rabbitmq/rabbitmq-env.conf')
source=("http://www.rabbitmq.com/releases/${pkgname}-server/v${pkgver}/${pkgname}-server-generic-unix-${pkgver}.tar.gz"{,.asc}
  "rabbitmq-env.conf"
  "rabbitmq.service")
validpgpkeys=('F78372A06FF50C80464FC1B4F7B8CEA6056E8E56') 
sha256sums=('8f250cd87e7403b73bd84baea104e8254e46c9c0f6fb53d5b2b68cf2ed335154'
            'SKIP'
            '50731fc6958d5672de1d3313a91717b32f5ffd721a1c3c3cf553f88ae2f2c935'
            'f96423feb5049e16575690f1cd1bfd6338d2286cdd991bf5bddaae54f6ebf2d0')
install="${pkgname}.install"

package() {
  local libdir=$pkgdir/usr/lib/rabbitmq/lib/rabbitmq-server-$pkgver
  install -d $pkgdir/usr/bin
  install -dm 755 $libdir 
  install -dm 755 $pkgdir/var/rabbitmq
  install -dm 755 $pkgdir/var/log/rabbitmq
   
  cp -R $srcdir/rabbitmq_server-$pkgver/ebin $libdir/
  cp -R $srcdir/rabbitmq_server-$pkgver/include $libdir/
  cp -R $srcdir/rabbitmq_server-$pkgver/plugins $libdir/
  cp -R $srcdir/rabbitmq_server-$pkgver/sbin $libdir/
  cp -R $srcdir/rabbitmq_server-$pkgver/share $pkgdir/usr/

  for script in $libdir/sbin/*; do
    ln -s ${script#${pkgdir}} $pkgdir/usr/bin/
  done
 
  install -D rabbitmq-env.conf "${pkgdir}/etc/rabbitmq/rabbitmq-env.conf"
  sed -i 's#^SYS_PREFIX=.*$#SYS_PREFIX="${libdir}"#' "${libdir}/sbin/rabbitmq-defaults"

  install -m 644 -D "${srcdir}/rabbitmq.service" "${pkgdir}/usr/lib/systemd/system/rabbitmq.service"
}

# vim:set ts=2 sw=2 et:
