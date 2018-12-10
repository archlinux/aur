# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Jure Kobal <j dot kobal at gmx dot com>

pkgname=pgagent
_pkg=pgAgent
pkgver=4.0.0
pkgrel=1
pkgdesc="Job scheduler for PostgreSQL which may be managed using pgAdmin"
url="https://www.pgadmin.org/docs/pgadmin4/3.x/pgagent.html"
arch=('x86_64' 'i686')
license=('custom')
depends=('postgresql-libs' 'boost')
makedepends=('cmake')
source=(https://ftp.postgresql.org/pub/pgadmin/${pkgname}/${_pkg}-${pkgver}-Source.tar.gz
        ${pkgname}@localhost
        ${pkgname}@.service)
sha256sums=('57bd047401629533ac6c5238bc94026f0ea0bf9f1f33a2bccc754b27132ea7e8'
            '27621bcd7b0f9c5ce5a3680e3df5b7696c3573add25a5ae5730ee6cdbd57e759'
            '4bded1fb970358ff7c98d38b28be1568967f22055bc98cb23f9ae4e3385e3610')
backup=('etc/conf.d/pgagent@localhost')
install=${pkgname}.install

build() {
  cd "${srcdir}/${_pkg}-${pkgver}-Source"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DSTATIC_BUILD:BOOL=OFF -DCMAKE_CXX_FLAGS=-pthread
  make
}

package() {
  cd "${srcdir}/${_pkg}-${pkgver}-Source"
  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm ${pkgdir}/usr/{README,LICENSE}
 
  cd ${srcdir}
  install -Dm644 ${pkgname}@localhost "${pkgdir}/etc/conf.d/${pkgname}@localhost"
  install -Dm644 ${pkgname}@.service "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
}
