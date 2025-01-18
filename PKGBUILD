# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Jure Kobal <j dot kobal at gmx dot com>

pkgname=pgagent
_pkg=pgAgent
pkgver=4.2.3
pkgrel=1
pkgdesc="Job scheduler for PostgreSQL which may be managed using pgAdmin"
url="https://www.pgadmin.org/docs/pgadmin4/latest/pgagent.html"
arch=('x86_64' 'i686' 'aarch64')
license=('custom')
depends=('postgresql-libs' 'boost')
makedepends=('cmake')
source=(https://github.com/pgadmin-org/pgagent/archive/refs/tags/${pkgname}-${pkgver}.tar.gz
        ${pkgname}@localhost
        ${pkgname}@.service)
sha256sums=('d4af82e8b4063aa1ca9c407562a3bbc9c9951353538f83d82a7e523f40276388'
            '27621bcd7b0f9c5ce5a3680e3df5b7696c3573add25a5ae5730ee6cdbd57e759'
            '4bded1fb970358ff7c98d38b28be1568967f22055bc98cb23f9ae4e3385e3610')
backup=('etc/conf.d/pgagent@localhost')
install=${pkgname}.install

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DSTATIC_BUILD:BOOL=OFF -DCMAKE_CXX_FLAGS=-pthread
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm ${pkgdir}/usr/{README,LICENSE}
 
  cd ${srcdir}
  install -Dm644 ${pkgname}@localhost "${pkgdir}/etc/conf.d/${pkgname}@localhost"
  install -Dm644 ${pkgname}@.service "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
}
