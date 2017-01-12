# $Id$
# Maintainer: John Lane <archlinux at jelmail dot com>

pkgname=ssmtp-plain
_pkgupstream=ssmtp
pkgver=2.64
pkgrel=8
pkgdesc="Patched ssmtp MTA with support for PLAIN authentication"
arch=('i686' 'x86_64')
license=('GPL')
url="http://packages.debian.org/stable/mail/ssmtp"
depends=('openssl' 'inetutils')
conflicts=('exim' 'smtp-forwarder' 'ssmtp')
provides=('smtp-forwarder' 'ssmtp')
backup=('etc/ssmtp/ssmtp.conf' 'etc/ssmtp/revaliases')
options=('!makeflags' '!emptydirs')
source=("http://ftp.debian.org/debian/pool/main/s/ssmtp/${_pkgupstream}_${pkgver}.orig.tar.bz2"
        'opessl_crypto.patch'
	'build-idempotency.patch'
        'auth_method_plain.patch')
md5sums=('65b4e0df4934a6cd08c506cabcbe584f'
         'aeb4ed09a26eefea9a5f6ac755c4dff0'
	 '589925d042ab01bd692ba68cb25d404f'
         'eab8cd3124746a9c4d6664c8156b53e1')

prepare() {
  cd "${srcdir}/${_pkgupstream}-${pkgver}"
  patch -p1 -i "${srcdir}/opessl_crypto.patch"
  patch -p1 -i "${srcdir}/build-idempotency.patch"
  patch -p1 -i "${srcdir}/auth_method_plain.patch"
}

build() {
  cd "${srcdir}/${_pkgupstream}-${pkgver}"

  autoreconf
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --mandir=/usr/share/man \
              --enable-md5auth \
              --enable-ssl \
	      --enable-inet6
  make
}

package() {
  cd "${srcdir}/${_pkgupstream}-${pkgver}"
  yes | make prefix="${pkgdir}/usr" mandir="${pkgdir}/usr/share/man/man8" etcdir="${pkgdir}/etc" install

  install -D -m644 ssmtp.conf.5 "${pkgdir}/usr/share/man/man5/ssmtp.conf.5"

  ln -s ssmtp "${pkgdir}/usr/sbin/sendmail"
  ln -s ssmtp "${pkgdir}/usr/sbin/newaliases"
  ln -s ssmtp "${pkgdir}/usr/sbin/mailq"
  # usrmove
  cd "$pkgdir"
  mv usr/sbin usr/bin
}
