pkgname=ktls-utils
pkgver=0.9
pkgrel=1
pkgdesc="TLS handshake utilities for NFS (RPC-TLS) and other in-kernel TLS consumers"
url="https://github.com/oracle/ktls-utils"
license=(GPL2)
arch=(x86_64)
depends=(
  glib2
  gnutls
  libkeyutils.so
  libnl-3.so
)
makedepends=(gcc make pkg-config)
#source=("git+https://github.com/oracle/ktls-utils#tag=v$pkgver")
source=("https://github.com/oracle/ktls-utils/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('573f11b6ff02ed6140021085b1e16501afe3583565fd519eed8c91baa9bb5039')
backup=(etc/tlshd.conf)

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr             \
    --sbindir=/usr/bin        \
    --sysconfdir=/etc         \
    --with-systemd            \
    ;
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  #mkdir -p "$pkgdir"/usr/lib/ktls-utils
  #mv "$pkgdir"/usr/{bin,lib/ktls-utils}/tlshd
  sed -i 's,/usr/sbin/,/usr/bin/,g' "$pkgdir"/usr/lib/systemd/system/*.service
}

# vim: ft=sh:ts=2:sw=2:et
