# Maintainer:Samuel Fernando Mesa Giraldo <samuelmesa [at] linuxmail.org>

pkgname=tinyows
pkgver=1.1.1
pkgrel=1
pkgdesc="A lightweight and fast implementation of the OGC WFS-T specification."
arch=('i686' 'x86_64')
url=('http://mapserver.org/tinyows')
install=tinyows.install 
license=('MIT')
depends=( 'libxml2' 'postgis' 'apache' 'fcgi' )
optdepends=()
makedepends=('git' 'cmake')
provides=('mapserver')
conflicts=('tinyows')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mapserver/${pkgname}/archive/v.${pkgver}.tar.gz")
md5sums=('4093a4899ce661fcb27342fdb5676206')

build() {
  
  cd ${pkgname}-v.${pkgver}

  msg "Compiling ...."
	
  autoconf
  ./configure --prefix=/$pkgdir/usr \
              --with-xml2-config=/usr/bin/xml2-config \
              --with-pg_config=/usr/bin/pg_config \
              --with-shp2pgsql=/usr/bin/shp2pgsql \
              --with-fastcgi

        make
}

package() {  
  
  cd $pkgname-v.${pkgver}
  make DESTDIR=$pkgdir install  

  install -Dm755 tinyows ${pkgdir}/usr/bin/tinyows
  install -d  ${pkgdir}/usr/share/tinyows/demo
  install -d  ${pkgdir}/usr/share/tinyows/test
  install -Dm755 ${srcdir}/$pkgname-v.${pkgver}/demo/* ${pkgdir}/usr/share/tinyows/demo
  cp -rfv ${srcdir}/$pkgname-v.${pkgver}/test/* ${pkgdir}/usr/share/tinyows/test
}

