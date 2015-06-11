# Maintainer: Jure Kobal  <j dot kobal at gmx dot com>
pkgname=pgagent
pkgver=3.4.0
pkgrel=1
pkgdesc="Job scheduler for PostgreSQL"
url="http://www.pgadmin.org"
arch=('x86_64' 'i686')
license=('custom')
depends=('wxgtk' 'postgresql-libs')
makedepends=('cmake')
source=(http://ftp.postgresql.org/pub/pgadmin3/release/pgagent/pgAgent-${pkgver}-Source.tar.gz
        ${pkgname}@localhost
        ${pkgname}@.service)
sha256sums=('0da0ac8f453cf34ab6f708eee036bed0fd0e5fa311de283b92d2ff06600bbb3d'
            '27621bcd7b0f9c5ce5a3680e3df5b7696c3573add25a5ae5730ee6cdbd57e759'
            '4bded1fb970358ff7c98d38b28be1568967f22055bc98cb23f9ae4e3385e3610')
backup=('etc/conf.d/pgagent@localhost')

build() {
  cd "${srcdir}/pgAgent-${pkgver}-Source"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DSTATIC_BUILD:BOOL=OFF 
  make
}

package() {
  install=pgagent.install

  cd "${srcdir}/pgAgent-${pkgver}-Source"
  make DESTDIR="${pkgdir}" install
 
  cd ${srcdir}
  install -D -m644 ${pkgname}@localhost "${pkgdir}/etc/conf.d/pgagent@localhost"
  install -D -m644 ${pkgname}@.service "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
}
