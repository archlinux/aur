# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=msodbcsql
pkgver=17.0.1.1
pkgrel=1
_opensslver=1.0.2k-8
pkgdesc="Microsoft® ODBC Driver 13 for SQL Server®"
arch=('x86_64')
url="https://blogs.msdn.microsoft.com/sqlnativeclient/"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
makedepends=('patchelf')
options=('!strip')
source=(https://packages.microsoft.com/rhel/7/prod/msodbcsql17-$pkgver-1.x86_64.rpm
        http://mirror.centos.org/centos/7/os/x86_64/Packages/openssl-libs-$_opensslver.el7.x86_64.rpm)
sha256sums=('1d116c5ccfbef4b07237aa8a4431273337c8e1fe4274cdd3aea2cc1d6224ad45'
            '3e355d70d78d8578ccc1dc474948dc5a8fd4b4e4c9508ff7321488c0e4796bf1')
install=msodbcsql.install

package() {
  mv usr/lib64/lib*.so.* opt/microsoft/msodbcsql17/lib64/
  install -Dm0644 usr/share/doc/msodbcsql17/RELEASE_NOTES "$pkgdir"/usr/share/doc/$pkgname/RELEASE_NOTES
  install -Dm0644 usr/share/doc/msodbcsql17/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  mv opt "$pkgdir"

  mv "$pkgdir"/opt/microsoft/msodbcsql{17,}

  cd "$pkgdir"/opt/microsoft/msodbcsql
  sed 's/msodbcsql17/msodbcsql/g' -i etc/odbcinst.ini
  patchelf --set-rpath /opt/microsoft/msodbcsql/lib64/ lib64/libmsodbcsql-*
}
