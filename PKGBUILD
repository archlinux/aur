# Contributor: <alexandre.becoulet@free.fr>
# Contributor: <netbug@ftp.uk.linux.org>
# Contributor: Fluke <fluke.l at gmail.com>

pkgname=netkit-telnet-ssl
pkgver=0.17.24+0.1
pkgrel=4
pkgdesc="telnet client and server with ssl enabled"
arch=('i686' 'x86_64')
depends=('glibc' 'openssl' 'ncurses')
license=('BSD')
url="http://www.hcs.harvard.edu/~dholland/computers/netkit.html"
source=(https://deb.debian.org/debian/pool/main/n/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz
        netkit-telnet-ssl-0.17.24+0.1_arch.diff
        netkit-telnet-ssl.sysusers
        telnet.xinetd)
sha256sums=('1a4b45826b37bea4d8e1ac3e3ae8f7727ce87efd239038a439c80ad52c33bed7'
            'e583e3d0cfde716d2ef9690072a0095494209716368597e0fa54a7fc286fe521'
            '79fa821d14e29273da7a0405f7cbc0d8f13a961b168b6b257c71342d06878eb8'
            '9f1506cbe02b48fe7ac53932f068f3ebc8a8441ad92bdec17e2cd40ca7bcbaa8')

prepare() {
  cd "$pkgname-$pkgver.orig"

  patch -p1 < ../netkit-telnet-ssl-0.17.24+0.1_arch.diff
}

build() {
  cd "$pkgname-$pkgver.orig"

  ./configure --prefix=/usr --installroot="$pkgdir"
  make -j1
}

package() { 
  cd "$pkgname-$pkgver.orig"

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
