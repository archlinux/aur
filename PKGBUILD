# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=msodbcsql
pkgver=17.2.0.1
pkgrel=2
_opensslver=1.0.2k-16
pkgdesc="Microsoft® ODBC Driver 17 for SQL Server®"
arch=('x86_64')
url="https://blogs.msdn.microsoft.com/sqlnativeclient/"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
makedepends=('patchelf')
options=('!strip')
source=(https://packages.microsoft.com/rhel/7/prod/msodbcsql17-$pkgver-1.x86_64.rpm
        http://mirror.centos.org/centos/7/os/x86_64/Packages/openssl-libs-$_opensslver.el7.x86_64.rpm)
sha256sums=('b04c5a527dee06b36990707244144045c36e3e2517f8d412010e0754f6517800'
            'd4dca8d352ef0cf6fdff9be8f5894bc8b61fda3e5c901f286375360b291bf5bf')
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
