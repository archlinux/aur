# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Isaac C. Aronson <isaac@pingas.org> (original PKGBUILD)
# Contributor: Sergio Correia <sergio@correia.cc> (modifications derived from icecream-git package)

# This package is currently under version control here:
# https://gitlab.com/bwidawsk/pkgbuild-icecream
#
# It is "built" against:
# 7b4c22ce2e99c6e18c986bd28d31e9e17c85d5ea

pkgname=icecream
pkgver=1.1rc1
pkgrel=2
pkgdesc="Icecream takes compile jobs from your build and distributes it to remote machines allowing a parallel build on several machines."
url="http://en.opensuse.org/Icecream"
license="GPL2"
builddepends=('docbook2x')
depends=('gcc' 'bash' 'libcap-ng')
provides=('icecream')
optdepends=('iceberg-git: A QT based monitor for icecream nodes'
            'ccache: ccache enabled remote builds.')
conflicts=('icecream-git')
backup=('etc/icecream.conf')
arch=('i686' 'x86_64')
install=icecream.install
source=("https://github.com/icecc/$pkgname/archive/1.1rc1/$pkgname-$pkgver.tar.gz"
        icecream.conf
        icecream.service
        icecream-scheduler.service
        icecreamd
        icecream-schedulerd
        ld-icecream.conf)
sha256sums=('95bdb66228cc8f5d97a829f1ee4e3f2d32caf064e9614919e8af0f708a13c654'
            'a170a26e8e12181bf491cfc238e60158088b660ce6139faca502a400365a3632'
            '538797a229695d4c36e83c78c712b300bbc294238ec7964f427a73ecdf23aadc'
            '81a549dcf071cef98ea8a0fdab1aee0686555eb3c67c709a9d90c1e2c9e4b685'
            'e9bf8f0bb2b32c34fe99786fe82a058c4a326149d5f58dd1e3dc8f26e7d2fa04'
            '461c8445438cf9688684ef547cad61f3c389dbc160086e214a28adba97d5afa1'
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
