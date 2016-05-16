# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Alexandre BIQUE <bique.alexandre@gmail.com>
# (Co-)Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=libreswan
pkgver=3.17
pkgrel=2
pkgdesc="IPsec implementation with IKEv1 and IKEv2 keying protocols"
arch=('i686' 'x86_64')
url="https://libreswan.org/"
license=('GPL' 'MPL')
depends=('systemd' 'unbound' 'nss' 'libcap-ng' 'curl')
makedepends=('docbook-xsl' 'xmlto' 'flex' 'bison')
conflicts=('freeswan' 'openswan' 'strongswan' 'ipsec-tools')
backup=('etc/ipsec.conf' 'etc/ipsec.secrets' 'etc/pam.d/pluto')
source=(https://download.libreswan.org/${pkgname}-${pkgver}.tar.gz
        tmpfiles.conf)
sha256sums=('28c286f57f6d8d00e1502ea283aac0f9f863edb2d759e50dc89df0e28c0d0d03'
            '78265c690d58228c3bcc1a8793456172c39d493d268e9d9b1816288d0a47f573')

build() {
  cd $pkgname-$pkgver

  # Disable new warning introduced with GCC 6 (-Wunused-const-variable=)
  export CFLAGS="$CFLAGS -Wno-error=unused-const-variable "

  make \
    USE_XAUTH=true USE_LIBCAP_NG=true USE_LEAK_DETECTIVE=false \
    INC_USRLOCAL=/usr INC_MANDIR=share/man \
    FINALSBINDIR=/usr/bin FINALLIBEXECDIR=/usr/lib/ipsec \
    programs
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" \
    USE_XAUTH=true USE_LIBCAP_NG=true USE_LEAK_DETECTIVE=false \
    INC_USRLOCAL=/usr INC_MANDIR=share/man \
    FINALSBINDIR=/usr/bin FINALLIBEXECDIR=/usr/lib/ipsec \
    install

  sed -i '1s|python|python2|' $pkgdir/usr/lib/ipsec/verify
  install -D -m644 ${srcdir}/tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/libreswan.conf
  rm -rf ${pkgdir}/var
}

# vim:set ts=2 sw=2 et:
