# $Id$
# Maintainer  : Pedro Brito <pedroembrito@gmail.com>
# Contributor : Tom Gundersen <teg@jklm.no>
# Contributor : Ionut Biru <ibiru@archlinux.org>

pkgname=transmission-cli-ipv6
pkgdesc='Fast, easy, and free BitTorrent client (CLI tools, daemon and web client, IPv6 RPC server patch)'
pkgver=2.92
pkgrel=2
arch=(x86_64 armv7h)
url="http://www.transmissionbt.com/"
license=(MIT)
depends=(curl libevent systemd)
makedepends=(intltool curl libevent systemd)
provides=(transmission-cli)
conflicts=(transmission-cli)

source=(https://github.com/transmission/transmission-releases/raw/master/transmission-${pkgver}.tar.xz
	transmission-daemon-rce-fix.patch
        transmission-2.90-libsystemd.patch
        transmission-2.92-openssl-1.1.0.patch
        transmission-cli-ipv6.sysusers
        transmission-cli-ipv6.tmpfiles
        0001-Allow-the-RPC-server-to-listen-on-an-IPv6-address.patch)
sha256sums=('3a8d045c306ad9acb7bf81126939b9594553a388482efa0ec1bfb67b22acd35f'
            '622e40013c8442ed9fae006eeb18f5c5662ab7462d387d845cd51f2b5afe71bf'
            '9f8f4bb532e0e46776dbd90e75557364f495ec95896ee35900ea222d69bda411'
            'efd41985f60c977a95744ee44dfbb628424765caee83c6af3e29a5b1cbfadc98'
            '641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
            '1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451'
            '2f68455290b869f86a4067f86a0056394d137dd55dcff748ec520048daad3c2a')

prepare() {
  cd transmission-$pkgver
  patch -p1 -i "$srcdir/transmission-2.90-libsystemd.patch"
  patch -p1 -i "$srcdir/transmission-2.92-openssl-1.1.0.patch"
  patch -p1 -i "$srcdir/transmission-daemon-rce-fix.patch"
  patch -p1 -i "$srcdir/0001-Allow-the-RPC-server-to-listen-on-an-IPv6-address.patch"

  rm -f m4/glib-gettext.m4
  autoreconf -fi
}

build() {
  cd transmission-$pkgver
  ./configure --prefix=/usr --without-gtk
  make
}

package() {
  cd transmission-$pkgver

  for dir in daemon cli web utils; do
    make -C "$dir" DESTDIR="$pkgdir" install
  done

  install -Dm644 daemon/transmission-daemon.service \
    "$pkgdir/usr/lib/systemd/system/transmission.service"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-cli/COPYING"

  install -Dm644 "$srcdir/transmission-cli-ipv6.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/transmission.conf"
  install -Dm644 "$srcdir/transmission-cli-ipv6.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/transmission.conf"
}
