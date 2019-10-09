# Maintainer: Gabriel Morrison Lima Dantas <gabrielmldantas@gmail.com>
# Contributor: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
pkgname=mssql-server
pkgver=14.0.3238.1
_prodver=${pkgver}-19
pkgrel=1
pkgdesc="Microsoft SQL Server for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('unknown')
depends=(python2-configparser numactl sssd 'openssl-1.0>=1.0.2.l')
source=("https://packages.microsoft.com/rhel/7/mssql-server-2017/${pkgname}-${_prodver}.x86_64.rpm"
        "openssl_version_workaround.service")

sha256sums=('cedc65fb122520eb7e8e7bc90057a5a6b813d41ded416fecf0534e9cd0f80d6b'
            'ef29e36c5303feef18f671b9ef4a62b00c4a90dfe0c8496e390f3d623772f1c3')

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
