# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=msodbcsql
pkgver=17.4.2.1
pkgrel=1
_opensslver=1.0.2k-19
pkgdesc="Microsoft® ODBC Driver 17 for SQL Server®"
arch=('x86_64')
url="https://blogs.msdn.microsoft.com/sqlnativeclient/"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
makedepends=('patchelf')
options=('!strip')
source=(https://packages.microsoft.com/rhel/7/prod/msodbcsql17-$pkgver-1.x86_64.rpm
        http://mirror.centos.org/centos/7/os/x86_64/Packages/openssl-libs-$_opensslver.el7.x86_64.rpm)
sha256sums=('9a4e717e10c6c47fde8dad9cf6c13e1cee59709b26d02606d8b8fd5abcfd56fa'
            '8a907020f9b1697cb8971158b3a5279e5b54e5637f55dcce751f1610a2ed6452')
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
