# Contributor: <alexandre.becoulet@free.fr>
# Contributor: <netbug@ftp.uk.linux.org>
# Contributor: Fluke <fluke.l at gmail.com>

pkgname=netkit-telnet-ssl
_debver=0.17.41+0.2
_debrel=3
pkgver=$_debver
pkgrel=1
pkgdesc="telnet client and server with ssl enabled"
arch=('i686' 'x86_64')
depends=('glibc' 'openssl' 'ncurses')
license=('BSD')
url="http://www.hcs.harvard.edu/~dholland/computers/netkit.html"
source=(https://deb.debian.org/debian/pool/main/n/${pkgname}/${pkgname}_${_debver}.orig.tar.gz
        https://deb.debian.org/debian/pool/main/n/${pkgname}/${pkgname}_${_debver}-${_debrel}.debian.tar.xz
        netkit-telnet-ssl.sysusers
        telnet.xinetd)
sha256sums=('9c80d5c7838361a328fb6b60016d503def9ce53ad3c589f3b08ff71a2bb88e00'
            '3f8b155bc5085e37a0d836867af330f2911953055010e30f30ca46698559a0aa'
            '79fa821d14e29273da7a0405f7cbc0d8f13a961b168b6b257c71342d06878eb8'
            '9f1506cbe02b48fe7ac53932f068f3ebc8a8441ad92bdec17e2cd40ca7bcbaa8')

prepare() {
  cd netkit-telnet-0.17

  for patch in $(grep '^[^#]' ../debian/patches/series); do
    msg2 "Applying $patch"
    patch -Np1 < ../debian/patches/"$patch"
  done
}

build() {
  cd netkit-telnet-0.17

  ./configure --prefix=/usr --installroot="$pkgdir"
  make -j1
}

package() { 
  cd netkit-telnet-0.17

  mkdir -p "$pkgdir"/usr/{bin,sbin,man/man1,man/man5,man/man8}
  make install

  mv "$pkgdir"/usr/sbin/in.telnetd-ssl "$pkgdir"/usr/bin/in.telnetd-ssl
  rmdir "$pkgdir"/usr/sbin

  install -D -m 644 "$srcdir"/telnet.xinetd \
                    "$pkgdir"/etc/xinetd.d/telnet-ssl

  install -D -m 644 "$srcdir"/netkit-telnet-ssl.sysusers \
                    "$pkgdir"/usr/lib/sysusers.d/netkit-telnet-ssl.sysusers
}

# vim: ts=2:sw=2:et:
