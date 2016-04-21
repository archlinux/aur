# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Isaac C. Aronson <isaac@pingas.org> (original PKGBUILD)
# Contributor: Sergio Correia <sergio@correia.cc> (modifications derived from icecream-git package)

# This package is currently under version control here:
# https://gitlab.com/bwidawsk/pkgbuild-icecream
#
# It is "built" against:
# 7b4c22ce2e99c6e18c986bd28d31e9e17c85d5ea

pkgname=icecream
pkgver=1.1rc2
pkgrel=1
pkgdesc="takes compile jobs from your build and distributes it to remote machines allowing a parallel build on several machines."
url="http://en.opensuse.org/Icecream"
license=('GPL2')
makedepends=('')
depends=('bash' 'libcap-ng' 'lzo')
provides=('icecream')
optdepends=('iceberg-git: A QT based monitor for icecream nodes'
            'ccache: ccache enabled remote builds.')
conflicts=('icecream-git')
backup=('etc/icecream.conf')
arch=('i686' 'x86_64')
install=icecream.install
source=("https://github.com/icecc/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        icecream.conf
        icecream.service
        icecream-scheduler.service
        icecreamd
        icecream-schedulerd
        ld-icecream.conf)
sha256sums=('479d4dd3bc752b3ac5289c9bcfe0270ef3522a325c0945ddb273ded767688958'
            '4c1b993761600955a2be53e945a698638ef861a513258956d8aac0e0f8df3dfe'
            '3bd9286e2a4ef29a41fe414caf3ffb56ae24e2287272dc0d60d62599d20d8cf9'
            '9b756a140ac3983efa4cddf6590af72d3681834b95ef1f879f34da775dd418cd'
            'cdb7794bf53486eb46716e57172c58cd4cb97b7649cd98178f0eefe03444a88a'
            'c6807f49ac0e191136047d22d01639b04fad9b009d829528dafe02665712eb0f'
            '2221f16c3293dfd86e4d0442745b104380a4a1623ca3c9eb6bfe5771552fac65')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr/lib/icecream --enable-shared --disable-static --without-man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -D -m755 "$srcdir"/icecream.conf "$pkgdir/etc/icecream.conf"
  install -D -m755 "$srcdir"/icecreamd "$pkgdir/usr/lib/icecream/icecreamd"
  install -D -m755 "$srcdir"/icecream-schedulerd "$pkgdir/usr/lib/icecream/icecream-schedulerd"
  install -D -m644 "$srcdir"/icecream-scheduler.service "$pkgdir/usr/lib/systemd/system/icecream-scheduler.service"
  install -D -m644 "$srcdir"/icecream.service "$pkgdir/usr/lib/systemd/system/icecream.service"
  install -D -m644 "$srcdir"/ld-icecream.conf "${pkgdir}/etc/ld.so.conf.d/icecream.conf"

  # moving pkg-config file to its usual place
  install -D -m644 "${pkgdir}/usr/lib/icecream/lib/pkgconfig/icecc.pc" "${pkgdir}/usr/lib/pkgconfig/icecc.pc"
  rm -rf "${pkgdir}/usr/lib/icecream/lib/pkgconfig"
}
# vim:set ts=2 sw=2 et:
