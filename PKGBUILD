# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=jdbc_fdw
pkgver=0.1.0
pkgrel=1
pkgdesc="PostgreSQL Foreign Data Wrapper (FDW) for remote databases using JDBC"
arch=('x86_64')
url="https://github.com/pgspider/jdbc_fdw"
license=('PostgreSQL')
depends=('postgresql')
makedepends=('jdk8-openjdk')
source=("https://github.com/pgspider/jdbc_fdw/archive/refs/tags/v${pkgver}.tar.gz"
         "openjdk8.patch")
sha256sums=('552fc5cb2f27ae48182bf7fe24a2c993c4a6dacd91d86cfaeb501c45586d2e27'
            'fe77b21484362c837f6b76cea2eb4748dd08c084965afa011eff20eb407a7cd5')

prepare(){
  cd jdbc_fdw-${pkgver}

  patch -p1 -i ../openjdk8.patch
}

package() {
  cd jdbc_fdw-${pkgver}

  make USE_PGXS=1 pkglibdir=./ DESTDIR="$pkgdir" prefix=/usr libdir=/usr/lib install

  install -Dm644 JDBCDriverLoader.class ${pkgdir}/usr/lib/postgresql/JDBCDriverLoader.class
  install -Dm644 JDBCUtils.class ${pkgdir}/usr/lib/postgresql/JDBCUtils.class
  install -Dm644 resultSetInfo.class ${pkgdir}/usr/lib/postgresql/resultSetInfo.class
  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mv ${pkgdir}/../jdbc_fdw./* ${pkgdir}/usr/lib/postgresql/
  rmdir ${pkgdir}/../jdbc_fdw.
}
