# vim: set et sw=2:
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=yp-tools
pkgver=4.2.3
pkgrel=6
pkgdesc='Linux NIS Tools'
arch=('i686' 'x86_64')
url='https://github.com/thkukuk/yp-tools'
license=('GPL2')
depends_i686=('libnsl' 'libxcrypt')
depends_x86_64=('libnss_nis' 'libxcrypt')
backup=('etc/nisdomainname' 'etc/nicknames')
install=yp-tools.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'domainname.service'
	'domainname.conf'
        'yp-tools.conf')

prepare() {
  cd $pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 ../domainname.conf "${pkgdir}/etc/nisdomainname"
  install -D -m644 ../domainname.service "${pkgdir}/usr/lib/systemd/system/domainname.service"
  install -D -m644 ../yp-tools.conf "${pkgdir}/usr/lib/tmpfiles.d/yp-tools.conf"
  install -D -m644 "${pkgdir}/var/yp/nicknames" "${pkgdir}/etc/nicknames"
  rm -fr "${pkgdir}/var"
}

md5sums=('b2beee519500c48f27570958b1d6cb86'
         '5a78cd2218936241133e5f61383a2dc8'
         '74298e047121f528a2a5c221afd783ab'
         'd8a5a4634c152423c4969002e8ba590d')
