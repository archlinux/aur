# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Sergio A. Morales <sergiomorales@archlinux.cl>

pkgname=389-admin
pkgver=1.1.42
pkgrel=1
pkgdesc="389 Administration Server HTTP agent"
arch=('i686' 'x86_64')
url="http://directory.fedoraproject.org/"
license=('GPL')
depends=('389-ds-base' '389-adminutil' 'mod_nss' 'perl-mozldap')
source=("http://directory.fedoraproject.org/sources/$pkgname-$pkgver.tar.bz2")
sha256sums=('4caf0671ca5f456a9778ba547c8d3e3b370005fa7bdc37b229c546d0f57850c1')

build() {
  cd $pkgname-$pkgver
  
  [ "${CARCH}" == "x86_64" ] && export USE_64=1

  msg2 "Running configure..."
  ./configure --disable-rpath \
              --prefix=/usr \
              --sysconfdir=/etc \
	      --sbindir=/usr/bin \
	      --with-ldapsdk-inc=/usr/include/mozldap \
	      --with-ldapsdk-lib=/usr/lib/mozldap \
              --with-adminutil=/usr

  msg2 "Running make..."
  make
}

package() {
  cd $pkgname-$pkgver
  
  msg2 "Running make install..."
  make install DESTDIR="$pkgdir"

  mv "$pkgdir"/etc/rc.d/init.d/dirsrv-admin "$pkgdir"/etc/rc.d/dirsrv-admin
  rm -rf "$pkgdir"/etc/rc.d/init.d
}

# vim:set ts=2 sw=2 et:
