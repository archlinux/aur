# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Isaac C. Aronson <isaac@pingas.org> (original PKGBUILD)
# Contributor: Sergio Correia <sergio@correia.cc> (modifications derived from icecream-git package)

pkgname=icecream
pkgver=1.4
pkgrel=4
pkgdesc="takes compile jobs from your build and distributes it to remote machines allowing a parallel build on several machines."
url="https://github.com/icecc/icecream"
license=('GPL2')
makedepends=('docbook2x' 'clang')
depends=('bash' 'libcap-ng' 'libarchive' 'lzo' 'zstd')
provides=('icecream')
optdepends=('icecream-sundae: A commandline monitor for Icecream'
            'icemon: Icecream GUI monitor'
            'ccache: ccache enabled remote builds.'
            'clang: clang enabled remote builds.')
conflicts=('icecream-git')
backup=('etc/icecream.conf')
arch=('x86_64')
install=icecream.install
source=("https://github.com/icecc/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        icecream.conf
        icecream.service
        icecream-scheduler.service
        icecreamd
        icecream-schedulerd
        ld-icecream.conf)
sha256sums=('249dcf74f0fc477ff9735ff0bdcdfaa4c257a864c4db5255d8b25c9f4fd20b6b'
            '4c1b993761600955a2be53e945a698638ef861a513258956d8aac0e0f8df3dfe'
            '3bd9286e2a4ef29a41fe414caf3ffb56ae24e2287272dc0d60d62599d20d8cf9'
            '9b756a140ac3983efa4cddf6590af72d3681834b95ef1f879f34da775dd418cd'
            'cdb7794bf53486eb46716e57172c58cd4cb97b7649cd98178f0eefe03444a88a'
            'c6807f49ac0e191136047d22d01639b04fad9b009d829528dafe02665712eb0f'
            '2221f16c3293dfd86e4d0442745b104380a4a1623ca3c9eb6bfe5771552fac65')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh
  if command -v clang >/dev/null;
  then
    ./configure --prefix=/usr/lib/icecream --enable-shared --disable-static --enable-clang-wrappers --enable-clang-rewrite-includes --mandir=/usr/share/man
  else
    ./configure --prefix=/usr/lib/icecream --enable-shared --disable-static --mandir=/usr/share/man
  fi
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
