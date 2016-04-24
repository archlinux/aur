# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Alexandre BIQUE <bique.alexandre@gmail.com>
pkgname=libreswan
pkgver=3.17
pkgrel=1
pkgdesc="IPsec implementation with IKEv1 and IKEv2 keying protocols"
arch=('i686' 'x86_64')
url="https://libreswan.org/"
license=('GPLv2')
groups=()
depends=(unbound nss libcap-ng curl)
makedepends=('docbook-xsl' 'xmlto' 'flex' 'bison')
checkdepends=()
optdepends=()
provides=()
conflicts=('freeswan' 'openswan' 'strongswan' 'ipsec-tools')
replaces=()
backup=('etc/ipsec.conf' 'etc/ipsec.secrets' 'etc/pam.d/pluto')
options=()
install=
changelog=
source=(https://download.libreswan.org/${pkgname}-${pkgver}.tar.gz
        tmpfiles.conf)
md5sums=('a37ce71229d491f30926788565f82e16'
         '77399a739ee99f8bc54837684d7c39d5')

prepare() {
  cd $pkgname-$pkgver

  # Change install paths to Arch defaults
  sed -i 's|)/sbin|)/bin|' Makefile.inc
  sed -i 's|)/sbin|)/bin|' mk/config.mk
}

build() {
  cd $pkgname-$pkgver

  make \
    USE_XAUTH=true USE_LIBCAP_NG=true INC_USRLOCAL=/usr \
    USE_LEAK_DETECTIVE=false INC_MANDIR=share/man \
    programs
}

# check() {
#   cd $pkgname-$pkgver

#   make -k check
# }

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" \
    USE_XAUTH=true USE_LIBCAP_NG=true INC_USRLOCAL=/usr \
    USE_LEAK_DETECTIVE=false INC_MANDIR=share/man \
    install
  sed -i '1s|python|python2|' $pkgdir/usr/libexec/ipsec/verify
  install -D -m644 ${srcdir}/tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/libreswan.conf
  rm -rf ${pkgdir}/var
}

# vim:set ts=2 sw=2 et:
