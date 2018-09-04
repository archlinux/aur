# vim:set ts=2 sw=2 et:
# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=addrwatch
pkgver=1.0.1
pkgrel=3
pkgdesc='A tool similar to arpwatch for IPv4/IPv6 and ethernet address pairing monitoring'
arch=('x86_64' 'i686')
url="https://github.com/fln/addrwatch"
license=('GPL')
depends=('libpcap' 'libevent')
source=("https://github.com/fln/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.rules")

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man --sbindir=/usr/bin
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 /dev/stdin "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf <<-END
    d /var/lib/addrwatch 0755 - - -
END
  install -Dm644 ../$pkgname.service "$pkgdir"/usr/lib/systemd/system/${pkgname}\@.service
  install -Dm644 ../$pkgname.rules "$pkgdir"/usr/lib/udev/rules.d/99-${pkgname}.rules
}

sha512sums=('bc6f9193bc5dec3b2716ba220d274409fc0a220f5441dcdae5b1fef5e2e1d405898023944fe45263d2869861bb4dec3691d0de04a36eb89cb835e118341a0c8d'
            '2bc8cdb4b0b8906fd52c5b9e56e1cd2b1d8416a38ced1d33f8b0c9e0f739cde0ecc2e9267e1b1256c0e189fe53c66b69f8ab5a64addb77adf87ffa327f84b5c6'
            '69e2213923ada91ac32191f7747a6314f5a12fe8b644b07725d8d6441e411e6b597017eaf6f9336a26de0cb6bf7c46bb241462933d5b483dc3a026c499d999bd')
