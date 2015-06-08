# Maintainer: Yuri Bugelli <yuri.bugelli@gmail.com>
pkgname=mysql-connector-net
pkgver=6.8.3
pkgrel=1
pkgdesc="A MySQL database connector for .NET Framework 4.5"
arch=('any')
url="http://dev.mysql.com/downloads/connector/net/"
license=('GPL')
depends=('mono' 'mysql-clients')
conflicts=('mysql-connector-net-2.0' 'mysql-connector-net-4.0')
source=("http://cdn.mysql.com/Downloads/Connector-Net/mysql-connector-net-$pkgver-noinstall.zip"
	MySql.Data.Entity.EF6.pc
	MySql.Data.Entity.EF5.pc
	MySql.Data.pc
	MySql.Web.pc
)
md5sums=('75d93e8c12376fb255648d0f00ae935e'
	bcc68388070e08719f4ede85bf52bb56
	a6670383e74be37e0cb695387e2f2858
	0da037b9ed24ade65a91db148862a01a  
	6282ae4b6efa683532f1c07c7aeada0f  
)
install=$pkgname.install

package() {
  v4=${pkgver}.0
  v4cli=${v4}__c5687fc88969c44d
  gacdir=$pkgdir/usr/lib/mono/gac

  mkdir -p "$pkgdir/usr/lib/pkgconfig"
  sed "s/#VERSION#/${pkgver}.0/;s/#DEB_CLI_ABI_VERSION#/${v4cli}/" ../MySql.Data.pc > $pkgdir/usr/lib/pkgconfig/mysql.data.pc
  sed "s/#VERSION#/${pkgver}.0/;s/#DEB_CLI_ABI_VERSION#/${v4cli}/" ../MySql.Data.Entity.EF6.pc > $pkgdir/usr/lib/pkgconfig/mysql.data.entity.ef6.pc
  sed "s/#VERSION#/${pkgver}.0/;s/#DEB_CLI_ABI_VERSION#/${v4cli}/" ../MySql.Data.Entity.EF5.pc > $pkgdir/usr/lib/pkgconfig/mysql.data.entity.ef5.pc
  sed "s/#VERSION#/${pkgver}.0/;s/#DEB_CLI_ABI_VERSION#/${v4cli}/" ../MySql.Web.pc > $pkgdir/usr/lib/pkgconfig/mysql.web.pc

  install -m 644 -D v4.5/mysql.data.dll $gacdir/MySql.Data/${v4cli}/MySql.Data.dll
  install -m 644 -D v4.5/mysql.data.entity.EF5.dll $gacdir/MySql.Data.Entity.EF5/${v4cli}/MySql.Data.Entity.EF5.dll
  install -m 644 -D v4.5/mysql.data.entity.EF6.dll $gacdir/MySql.Data.Entity.EF6/${v4cli}/MySql.Data.Entity.EF6.dll
  install -m 644 -D v4.5/mysql.web.dll $gacdir/MySql.Web/${v4cli}/MySql.Web.dll

  mdoc update -o en v4.5/mysql.data.dll
  mdoc update -o en v4.5/mysql.web.dll
  mdoc update -o en v4.5/mysql.data.entity.EF5.dll
  mdoc update -o en v4.5/mysql.data.entity.EF6.dll
  mdoc assemble -o mysql-connector-net en

cat > mysql-connector-net.source <<EOF
<?xml version="1.0"?>
<monodoc>
  <node label="MySQL Connector" name="classlib-mysql-connector-net" parent="libraries" />
  <source provider="ecma" basefile="mysql-connector-net" path="classlib-mysql-connector-net"/>
</monodoc>
EOF
  install -m 644 -D mysql-connector-net.source $pkgdir/usr/lib/monodoc/sources/mysql-connector-net.source
  install -m 644 -D mysql-connector-net.tree $pkgdir/usr/lib/monodoc/sources/mysql-connector-net.tree
  install -m 644 -D mysql-connector-net.zip $pkgdir/usr/lib/monodoc/sources/mysql-connector-net.zip

  install -m 664 -D CHANGES $pkgdir/usr/share/doc/$pkgname/CHANGES
  install -m 664 -D COPYING $pkgdir/usr/share/doc/$pkgname/COPYING
  install -m 664 -D README $pkgdir/usr/share/doc/$pkgname/README
  install -m 664 -D "Release Notes.txt" "$pkgdir/usr/share/doc/$pkgname/Release Notes.txt"
  install -m 644 -D Documentation/ConnectorNET.chm $pkgdir/usr/share/doc/$pkgname/ConnectorNET.chm
  install -m 644 Documentation/Licenses\ for\ Third-Party\ Components/* $pkgdir/usr/share/doc/$pkgname

  mkdir "$pkgdir/usr/lib/mono/4.0"
  cd "$pkgdir/usr/lib/mono/4.0"
  ln -s ../gac/MySql.Data/${v4cli}/MySql.Data.dll .
  ln -s ../gac/MySql.Data.Entity.EF5/${v4cli}/MySql.Data.Entity.EF5.dll .
  ln -s ../gac/MySql.Data.Entity.EF6/${v4cli}/MySql.Data.Entity.EF6.dll .
  ln -s ../gac/MySql.Web/${v4cli}/MySql.Web.dll .
}
