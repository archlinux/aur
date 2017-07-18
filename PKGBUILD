# Maintainer: Gabriel Morrison Lima Dantas <gabrielmldantas@gmail.com>
# Contributor: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
pkgname=mssql-server
pkgver=14.0.800.90
_prodver=${pkgver}-2
pkgrel=1
pkgdesc="Microsoft SQL Server for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('unknown')
depends=(python2-configparser numactl sssd 'openssl-1.0>=1.0.2.l')
source=("https://packages.microsoft.com/ubuntu/16.04/mssql-server/pool/main/m/mssql-server/${pkgname}_${_prodver}_amd64.deb"
        "http://mirrors.kernel.org/ubuntu/pool/universe/j/jemalloc/libjemalloc1_3.6.0-9ubuntu1_amd64.deb"
        "http://mirrors.kernel.org/ubuntu/pool/universe/libc/libc++/libc++1_3.7.0-1_amd64.deb")

sha256sums=('d6090108af8788df23fd54fffc41876a39372a51a7abf2afed58fc8978c7b9cb'
            '50fd3720d129ad7d659b311bb8436169b851f3671112ef53bf5d03580d4947f1'
            '416f5c17bd9ac8727808918dd2e1af04078691772c5f3f16afb497e33dfc9fd6')
noextract=('libjemalloc1_3.6.0-9ubuntu1_amd64.deb'
           'libc++1_3.7.0-1_amd64.deb')
install=$pkgname.install

package() {
  tar -xf data.tar.xz
  mkdir jemalloc
  cd jemalloc
  ar x $srcdir/libjemalloc1_3.6.0-9ubuntu1_amd64.deb
  tar -xf data.tar.xz
  cd $srcdir
  mkdir libc++
  cd libc++
  ar x $srcdir/libc++1_3.7.0-1_amd64.deb
  tar -xf data.tar.xz
  cd $pkgdir
  mv $srcdir/opt .
  mv $srcdir/usr .
  mv $srcdir/lib usr/
  mv $srcdir/jemalloc/usr/lib/x86_64-linux-gnu/libjemalloc.so.1 opt/mssql/lib/
  mv $srcdir/libc++/usr/lib/x86_64-linux-gnu/libc++.so.1 opt/mssql/lib/
  mv $srcdir/libc++/usr/lib/x86_64-linux-gnu/libc++.so.1.0 opt/mssql/lib/
  for i in $(ls opt/mssql/lib/mssql-conf/*.py); do
      sed 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' $i -i
  done
}
