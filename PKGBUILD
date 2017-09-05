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
        netkit-telnet-ssl.gcc7.patch
        netkit-telnet-ssl.sysusers
        netkit-telnetd{,-ssl}.socket
        netkit-telnetd{,-ssl}@.service
        telnet.xinetd)
sha256sums=('9c80d5c7838361a328fb6b60016d503def9ce53ad3c589f3b08ff71a2bb88e00'
            '3f8b155bc5085e37a0d836867af330f2911953055010e30f30ca46698559a0aa'
            '2d3bf162cbb2e3df4ba6014206d95bbccf84ff4a277fdf9c0935a830f52443ee'
            '79fa821d14e29273da7a0405f7cbc0d8f13a961b168b6b257c71342d06878eb8'
            '25a9cd6c6fd3dd50a20038c05d755c519be1081e42bcb148f71e7a8f182e91a2'
            'a9a14476c43d65a57d50eec7e7d773ff1031cf1c13c12e84a9de5eaa14279434'
            'db921a9ad938ecdb208f6568466950360a892ca0c0754cf51ee082216cd3c8ff'
            '7a3b68541840a8a9ed5c40fbec815ba21f72b9b2726c42fab6b7aa3d1e0e0d9b'
            '9f1506cbe02b48fe7ac53932f068f3ebc8a8441ad92bdec17e2cd40ca7bcbaa8')

prepare() {
  cd netkit-telnet-0.17

  for patch in $(grep '^[^#]' ../debian/patches/series); do
    msg2 "Applying $patch"
    patch -Np1 < ../debian/patches/"$patch"
  done

  msg2 "Applying additional patches"
  patch -Np1 < ../netkit-telnet-ssl.gcc7.patch
}

build() {
  cd netkit-telnet-0.17

  ./configure --prefix=/usr --installroot="$pkgdir"
  make -j1
}

package() { 
  cd netkit-telnet-0.17

  mkdir -p "$pkgdir"/usr/{bin,sbin,share/man/man{1,5,8}}
  make -C telnet INSTALLROOT="$pkgdir" MANDIR=/usr/share/man install
  make -C telnetd INSTALLROOT="$pkgdir" MANDIR=/usr/share/man install
  mv "$pkgdir"/usr/{sbin/in.telnetd,bin/in.telnetd-ssl}
  mv "$pkgdir"/usr/share/man/man8/{in.telnetd,in.telnetd-ssl}.8
  rm "$pkgdir"/usr/share/man/man8/telnetd.8
  rmdir "$pkgdir"/usr/sbin

  install -D -m 644 "$srcdir"/telnet.xinetd \
                    "$pkgdir"/etc/xinetd.d/telnet-ssl

  install -D -m 644 "$srcdir"/netkit-telnet-ssl.sysusers \
                    "$pkgdir"/usr/lib/sysusers.d/netkit-telnet-ssl.sysusers

  for unit in netkit-telnetd{,-ssl}{.socket,@.service}; do
    install -D -m 644 "$srcdir"/"$unit" \
                      "$pkgdir"/usr/lib/systemd/system/"$unit"
  done
}

# cleanbuild: required
# vim: ts=2:sw=2:et:
