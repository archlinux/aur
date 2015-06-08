# Maintainer: Yuri Bugelli <yuri.bugelli@gmail.com>
pkgname=mysql-connector-net-2.0
_basename=mysql-connector-net
_pkgbasever=${pkgver/rc/-rc}
pkgver=6.8.3
pkgrel=1
pkgdesc="A MySQL database connector for .NET Framework (version 2.0 libs)"
arch=('any')
url="http://dev.mysql.com/downloads/connector/net/"
license=('GPL')
depends=('mono' 'mysql-clients')
provides=("mysql-connector-net=$pkgver")
conflicts=('mysql-connector-net-4.0' 'mysql-connector-net')
source=("http://cdn.mysql.com/Downloads/Connector-Net/mysql-connector-net-$pkgver-noinstall.zip"
	MySql.Data.CF.pc
	MySql.Data.Entity.pc
	MySql.Data.pc
	MySql.Web.pc
)
md5sums=('75d93e8c12376fb255648d0f00ae935e'
	efb0cfc2c3f325d80887df4f3ca8bcd0
	b1ef6985da0bcf1bfceb730da6dcd7ab
	0da037b9ed24ade65a91db148862a01a  
	6282ae4b6efa683532f1c07c7aeada0f  
)
install=$pkgname.install

build() {

  v2=${pkgver}.0
  v2cli=${v2}__c5687fc88969c44d
  gacdir=$pkgdir/usr/lib/mono/gac

  mkdir -p "$pkgdir/usr/lib/pkgconfig"
  sed "s/#VERSION#/${pkgver}.0/;s/#DEB_CLI_ABI_VERSION#/${v2cli}/" ../MySql.Data.pc > $pkgdir/usr/lib/pkgconfig/mysql.data.pc
  sed "s/#VERSION#/${pkgver}.0/;s/#DEB_CLI_ABI_VERSION#/${v2cli}/" ../MySql.Data.CF.pc > $pkgdir/usr/lib/pkgconfig/mysql.data.cf.pc
  sed "s/#VERSION#/${pkgver}.0/;s/#DEB_CLI_ABI_VERSION#/${v2cli}/" ../MySql.Data.Entity.pc > $pkgdir/usr/lib/pkgconfig/mysql.data.entity.pc
  sed "s/#VERSION#/${pkgver}.0/;s/#DEB_CLI_ABI_VERSION#/${v2cli}/" ../MySql.Web.pc > $pkgdir/usr/lib/pkgconfig/mysql.web.pc

  install -m 644 -D v2.0/mysql.data.dll $gacdir/MySql.Data/${v2cli}/MySql.Data.dll
  install -m 644 -D v2.0/mysql.data.cf.dll $gacdir/MySql.Data.CF/${v2cli}/MySql.Data.CF.dll
  install -m 644 -D v2.0/mysql.data.entity.dll $gacdir/MySql.Data.Entity/${v2cli}/MySql.Data.Entity.dll
  install -m 644 -D v2.0/mysql.web.dll $gacdir/MySql.Web/${v2cli}/MySql.Web.dll

  mdoc update -o en v2.0/mysql.data.dll
  mdoc update -o en v2.0/mysql.web.dll
  mdoc update -o en v2.0/mysql.data.entity.dll
  mdoc update -o en v2.0/mysql.data.cf.dll
  mdoc assemble -o mysql-connector-net en
cat > mysql-connector-net.source <<EOF
<?xml version="1.0"?>
<monodoc>
  <node label="MySQL Connector" name="classlib-mysql-connector-net" parent="libraries" />
  <source provider="ecma" basefile="mysql-connector-net" path="classlib-mysql-connector-net"/>
</monodoc>
EOF
  install -m 644 mysql-connector-net.source -D $pkgdir/usr/lib/monodoc/sources/mysql-connector-net.source
  install -m 644 mysql-connector-net.tree -D $pkgdir/usr/lib/monodoc/sources/mysql-connector-net.tree
  install -m 644 mysql-connector-net.zip -D $pkgdir/usr/lib/monodoc/sources/mysql-connector-net.zip

  install -m 664 -D CHANGES $pkgdir/usr/share/doc/$pkgname/CHANGES
  install -m 664 -D COPYING $pkgdir/usr/share/doc/$pkgname/COPYING
  install -m 664 -D README $pkgdir/usr/share/doc/$pkgname/README
  install -m 664 -D "Release Notes.txt" "$pkgdir/usr/share/doc/$pkgname/Release Notes.txt"
  install -m 644 -D Documentation/ConnectorNET.chm $pkgdir/usr/share/doc/$pkgname/ConnectorNET.chm
  install -m 644 Documentation/Licenses\ for\ Third-Party\ Components/* $pkgdir/usr/share/doc/$pkgname

  mkdir "$pkgdir/usr/lib/mono/2.0"
  cd "$pkgdir/usr/lib/mono/2.0"
  ln -s ../gac/MySql.Data/${v2cli}/MySql.Data.dll .
  ln -s ../gac/MySql.Data.CF/${v2cli}/MySql.Data.CF.dll .
  ln -s ../gac/MySql.Data.Entity/${v2cli}/MySql.Data.Entity.dll .
  ln -s ../gac/MySql.Web/${v2cli}/MySql.Web.dll .
}
