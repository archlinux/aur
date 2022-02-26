# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=kstart
pkgver=4.3
pkgrel=5
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
            '75ca839c4b0f452d597cb1b004c80d55614f51bb3a00b0b082fd2ca2138fc21b'
            '13684ab17853ddfbf5a0b438faa916cd360d2811043ece88dcf68c3d2e5a302a')
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
