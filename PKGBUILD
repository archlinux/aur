# Maintainer: Gabriel Morrison Lima Dantas <gabrielmldantas@gmail.com>
# Contributor: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
pkgname=mssql-server
pkgver=15.0.2000.5
_prodver=${pkgver}-5
pkgrel=1
pkgdesc="Microsoft SQL Server for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('unknown')
depends=(python2-configparser numactl sssd 'openssl-1.0>=1.0.2.l')
source=("https://packages.microsoft.com/rhel/7/mssql-server-2019/${pkgname}-${_prodver}.x86_64.rpm")

sha256sums=('09de140c0ca7a9b8f97c0db580e2ac2d406c7ac9ad85017bac3e72721f361fef')

install=$pkgname.install

package() {
  cd $pkgdir
  mv $srcdir/opt .
  mv $srcdir/usr .

  for i in $(ls opt/mssql/lib/mssql-conf/*.py); do
      sed 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' $i -i
  done

  # workaround for SQL Server OpenSSL version problems (see https://stackoverflow.com/a/57453901)
  ln -s /usr/lib/openssl-1.0/libssl.so opt/mssql/lib/libssl.so
  ln -s /usr/lib/openssl-1.0/libcrypto.so opt/mssql/lib/libcrypto.so
}
