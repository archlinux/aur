# Contributor: <alexandre.becoulet@free.fr>
# Contributor: <netbug@ftp.uk.linux.org>
# Contributor: Fluke <fluke.l at gmail.com>

pkgname=netkit-telnet-ssl
_debver=0.17.41+really0.17
_debrel=4
epoch=1
pkgver=${_debver//+/.}
pkgrel=1
pkgdesc="Telnet client and server with TLS support (Debian Netkit version)"
arch=('i686' 'x86_64')
depends=('glibc' 'openssl' 'ncurses')
makedepends=('cmake')
license=('BSD')
url="http://www.hcs.harvard.edu/~dholland/computers/netkit.html"
source=(https://deb.debian.org/debian/pool/main/n/${pkgname}/${pkgname}_${_debver}.orig.tar.gz
        https://deb.debian.org/debian/pool/main/n/${pkgname}/${pkgname}_${_debver}-${_debrel}.debian.tar.xz
        netkit-telnet-ssl.arch.patch
        netkit-telnet-ssl.sysusers
        netkit-telnet-ssl.tmpfiles
        netkit-telnetd{,-ssl}.socket
        netkit-telnetd{,-ssl}@.service)
sha256sums=('9c80d5c7838361a328fb6b60016d503def9ce53ad3c589f3b08ff71a2bb88e00'
            '6ecf88a521f693cded55eb2f54c0827edef3297e87b6e0e95ea479ae5880cba3'
            'f0db9be559e90d7711fb73109b20497325e03917a8e2f85780f95a17c28bdc9c'
            'be6cc69383e1326a9aa49d36bfda856d049f16512655ea83b991910800d540ba'
            '202fbfc51e6f6b92246853342a7ef47a731d64d012c8a8a026f9e9b154b9ade5'
            '25a9cd6c6fd3dd50a20038c05d755c519be1081e42bcb148f71e7a8f182e91a2'
            'a9a14476c43d65a57d50eec7e7d773ff1031cf1c13c12e84a9de5eaa14279434'
            '6e45cfed7968af48b59f172523934db421964e58fdb624872a831160e2848284'
            'b4220954373f5431b127509b4344dad32d5c692871c536106507fa8b052ef40a')

prepare() {
  cd netkit-telnet-0.17

  for patch in $(grep '^[^#]' ../debian/patches/series); do
    echo "=> Applying $patch"
    patch -Np1 < ../debian/patches/"$patch"
  done

  echo "=> Applying additional patches"
  patch -Np1 < ../netkit-telnet-ssl.arch.patch
}

build() {
  cd netkit-telnet-0.17

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build .
}

package() { 
  cd netkit-telnet-0.17

  DESTDIR="$pkgdir" cmake --install .

  # Fix paths
  mkdir -p "$pkgdir"/usr/lib
  mv "$pkgdir"/usr/{bin,lib}/telnetlogin
  mv "$pkgdir"/usr/{sbin,bin}/in.telnetd
  rmdir "$pkgdir"/usr/sbin

  # Add -ssl suffix
  mv "$pkgdir"/usr/bin/{in.telnetd,in.telnetd-ssl}
  mv "$pkgdir"/usr/share/man/man8/{in.telnetd,in.telnetd-ssl}.8

  # Add distro configs
  install -D -m 644 "$srcdir"/netkit-telnet-ssl.sysusers \
                    "$pkgdir"/usr/lib/sysusers.d/netkit-telnet-ssl.conf

  install -D -m 644 "$srcdir"/netkit-telnet-ssl.tmpfiles \
                    "$pkgdir"/usr/lib/tmpfiles.d/netkit-telnet-ssl.conf

  for unit in netkit-telnetd{,-ssl}{.socket,@.service}; do
    install -D -m 644 "$srcdir"/"$unit" \
                      "$pkgdir"/usr/lib/systemd/system/"$unit"
  done

  install -D -m 644 /dev/stdin \
                    "$pkgdir"/etc/telnetd-ssl/README <<EOF
For the Telnet server, both the TLS certificate and private key (i.e.
fullchain.pem + privkey.pem) must be concatenated to a single file and
installed to:

    /etc/telnetd-ssl/telnetd.pem

This file must be readable by the '_telnetd' user.
EOF
}

# cleanbuild: required
# vim: ts=2:sw=2:et:
