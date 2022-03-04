# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=kstart
pkgver=4.3
pkgrel=7
pkgdesc="Kerberos kinit supporting AFS and ticket refreshing"
arch=(i686 x86_64)
url="https://www.eyrie.org/~eagle/software/kstart/"
license=(custom)
depends=(krb5)
source=("https://archives.eyrie.org/software/kerberos/$pkgname-$pkgver.tar.gz"
        "https://archives.eyrie.org/software/kerberos/$pkgname-$pkgver.tar.gz.asc"
        "krenew.service"
        "kstart.service"
        "nm-dispatcher.sh")
sha256sums=('9527702a48789084e314e5c08d4115129467ca7ef25983d7214c9439d31ef2a6'
            'SKIP'
            'a496742d7cb2f00e8714d2b36da6adc09efd8a62e4892572b69b458b6e790a4e'
            '2730d02cc606c3019540fa907696bfa20b375ff3e1fb273cdb80c7c480b9081b'
            '514010cea54d80d1d41fe1885dbdd49225e52192be466e88979f91bac37c8022')
validpgpkeys=('E784364E8DDE7BB370FBD9EAD15D313882004173')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$srcdir"
  install -Dm644 krenew.service "$pkgdir"/usr/lib/systemd/user/krenew.service
  install -Dm644 kstart.service "$pkgdir"/usr/lib/systemd/user/kstart.service
  install -Dm755 nm-dispatcher.sh "$pkgdir"/usr/lib/NetworkManager/dispatcher.d/80-k5start
}

# vim: ts=2:sw=2:et:ft=sh
