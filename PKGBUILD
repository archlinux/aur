# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=jdbc_fdw
pkgver=0.5.0
pkgrel=1
pkgdesc="PostgreSQL Foreign Data Wrapper (FDW) for remote databases using JDBC"
arch=(x86_64)
url="https://github.com/pgspider/jdbc_fdw"
license=('PostgreSQL')
depends=('postgresql<18' 'jre21-openjdk')
makedepends=('jdk21-openjdk')
install=jdbc-fdw.install
source=("https://github.com/pgspider/jdbc_fdw/archive/refs/tags/v${pkgver}.tar.gz"
        "callback.patch")
sha256sums=('28c665d047ab81468839f628300ca5ca3980ebe9a8a30e4ff197ffe6fbeced20'
            'e74b77b735d07b05555a0ee0a6a663e46be467779497ec55b9e8fb19314d03d1')

prepare(){
  cd jdbc_fdw-${pkgver}

  patch -p1 -i ../callback.patch
}

build() {
  cd jdbc_fdw-${pkgver}

  make USE_PGXS=1 LIBDIR=/usr/lib/ LDFLAGS="-L/usr/lib/jvm/java-21-openjdk/lib/server"
}

package() {
  cd jdbc_fdw-${pkgver}

  make DESTDIR=${pkgdir} USE_PGXS=1 install

  install -Dm644 JDBCDriverLoader.class ${pkgdir}/usr/lib/postgresql/JDBCDriverLoader.class
  install -Dm644 JDBCUtils.class ${pkgdir}/usr/lib/postgresql/JDBCUtils.class
  install -Dm644 resultSetInfo.class ${pkgdir}/usr/lib/postgresql/resultSetInfo.class
  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
