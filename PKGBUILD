# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Sampson Crowley <sampsonsprojects at gmail dot com>
# Contributor: Trương Xuân Tính <xuantinh@gmail.com>
# Contributor: henning mueller <henning@orgizm.net>
# Contributor: Jerome Rose <jrose dot pub at gmail dot com>

pkgname=pgpool-ii
_pkgname=pgpool-II
pkgver=4.4.0
pkgrel=1
pkgdesc="Middleware that works between PostgreSQL servers and a PostgreSQL database client."
url="https://www.pgpool.net"
arch=(i686 x86_64)
license=(custom)
depends=(openssl postgresql-libs)
makedepends=(clang llvm)
#makedepends=(clang llvm postgresql)
options=(!libtool)
replaces=(pgpool)
backup=(etc/conf.d/${pkgname})
source=(
  ${pkgname}-${pkgver}.tar.gz::https://www.pgpool.net/download.php?f=${_pkgname}-${pkgver}.tar.gz
  ${pkgname}.{service,conf.d,diff}
)

sha256sums=('85d50996b421ef0a3f362dd6c12854d553d4034a068e9281c65b6d4cc5887f23'
            '6c797a94c1648890a613e201c2ce2e3e2b602103daecc009ebf189578e8e15a0'
            '9d0c12d735595424fad799499d50bc4da8b7f1e7ffc2c21317f8824559bb7aea'
            'c62fc1e31383b875701ffa40c07a5b9d7c8ff36d4a9c9356e831fab612ca8b20')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/pgpool \
    --mandir=/usr/share/man \
    --with-openssl=openssl
  make
  
  cd ${srcdir}/${_pkgname}-${pkgver}/src/sql/pgpool-recovery
  make
}

package() {
  install -D ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  install -D ${srcdir}/${pkgname}.conf.d ${pkgdir}/etc/conf.d/${pkgname}

  cd ${srcdir}/${_pkgname}-${pkgver}

	make DESTDIR="${pkgdir}/" install

  mkdir -p ${pkgdir}/{run/pgpool,usr/share/doc}

  install -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cp -r doc ${pkgdir}/usr/share/doc/${pkgname}

  mv ${pkgdir}/usr/share/${_pkgname} ${pkgdir}/usr/share/${pkgname}
  cd ${srcdir}/${_pkgname}-${pkgver}/src/sql/pgpool-recovery
	make DESTDIR="${pkgdir}/" install
}
