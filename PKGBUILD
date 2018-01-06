# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nemesis
pkgver=1.4
pkgrel=6
pkgdesc="command-line network packet crafting and injection utility"
arch=(x86_64)
url="http://nemesis.sourceforge.net/"
license=('BSD')
depends=()
validpgpkeys=('3CA3CBFF30506B07F036E57712AAFCF86923D3FD')
source=(https://downloads.sourceforge.net/sourceforge/nemesis/nemesis-$pkgver.tar.gz{,.asc}
	https://arch.p5n.pp.ru/~sergej/dl/2016/libnet-1.0.2a.tar.gz
	nemesis-proto_tcp.c.diff)
sha256sums=('803f5cf5c7c4af15128b8cd7f7610730cbed1427f062a31c2f5255790fb1bab4'
            'SKIP'
            '7c7f2e8ccb47bb47072c5cd583fea5e90ab892c75889b625346b60d10464459a'
            '47adbf39b5a5e351bc6b0eebaf89d98bb7ad3ab359c04391b782998053ae067d')

package() {
  # build libnet
  cd "$srcdir"/Libnet-1.0.2a
  # very dirty hack
  sed -i 's#malloc(p_size)#malloc(p_size*2)#' src/libnet_packet_mem.c
  [ -f Makefile ] || ./configure --prefix="$srcdir"/libnet
  make
  make MAN_PREFIX="$srcdir"/libnet/usr/man/man3 install

  # build nemesis
  cd "$srcdir"/nemesis-$pkgver
  export PATH="$srcdir/libnet/bin:$PATH"
  export CFLAGS="-D__GLIBC__=0 -I"$srcdir"/libnet/include -DLIBNET_LIL_ENDIAN"
  export LDFLAGS="-L"$srcdir"/libnet/lib"
  patch -Np1 <"$srcdir"/nemesis-proto_tcp.c.diff
  [ -f Makefile ] || ./configure --prefix=/usr --mandir=/usr/share/man \
	    --with-libnet-includes="$srcdir"/libnet/include \
	    --with-libnet-libraries="$srcdir"/libnet/lib
  make
  make DESTDIR="$pkgdir" install
  install -D -m0644 LICENSE "$pkgdir"/usr/share/licenses/nemesis/LICENSE
}
