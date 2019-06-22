# Maintainer: Gomasy <nyan@gomasy.jp>
# Contributor: Alexandre BIQUE <bique.alexandre@gmail.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=libreswan
pkgver=3.29
pkgrel=1
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
md5sums=('5b35b39a04f63a8e528b965aad515c01'
         '77399a739ee99f8bc54837684d7c39d5')

build() {
  cd $pkgname-$pkgver

  # Disable new warning introduced with GCC 6 (-Wunused-const-variable=)
  export CFLAGS="$CFLAGS -Wno-error=sign-compare -Wno-error=unused-const-variable -Wno-error=implicit-fallthrough -Wno-error=maybe-uninitialized -Wno-error=pointer-compare -Wno-error=format-truncation"

  make \
    USE_XAUTH=true USE_LIBCAP_NG=true USE_LEAK_DETECTIVE=false USE_LABELED_IPSEC=false USE_DNSSEC=false \
    INC_USRLOCAL=/usr INC_MANDIR=share/man \
    FINALSBINDIR=/usr/bin FINALLIBEXECDIR=/usr/lib/ipsec \
    programs
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" \
    USE_XAUTH=true USE_LIBCAP_NG=true USE_LEAK_DETECTIVE=false USE_LABELED_IPSEC=false USE_DNSSEC=false \
    INC_USRLOCAL=/usr INC_MANDIR=share/man \
    FINALSBINDIR=/usr/bin FINALLIBEXECDIR=/usr/lib/ipsec \
    install

  sed -i '1s|python|python2|' $pkgdir/usr/lib/ipsec/verify
  install -D -m644 ${srcdir}/tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/libreswan.conf
  rm -rf ${pkgdir}/var
}

# vim:set ts=2 sw=2 et:
