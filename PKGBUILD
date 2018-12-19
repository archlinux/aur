# Maintainer: Gabriel Morrison Lima Dantas <gabrielmldantas@gmail.com>
# Contributor: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
pkgname=mssql-server
pkgver=14.0.3048.4
_prodver=${pkgver}-1
pkgrel=1
_libcpp='libc++1_3.7.0-1ubuntu0.1_amd64.deb'
_libcppabi='libc++abi1_3.7.0-1ubuntu0.1_amd64.deb'
_jemalloc=libjemalloc1_3.6.0-9ubuntu1_amd64.deb
pkgdesc="Microsoft SQL Server for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('unknown')
depends=(python2-configparser numactl sssd 'openssl-1.0>=1.0.2.l')
source=("https://packages.microsoft.com/ubuntu/16.04/mssql-server-2017/pool/main/m/mssql-server/${pkgname}_${_prodver}_amd64.deb"
        "http://mirrors.kernel.org/ubuntu/pool/universe/j/jemalloc/${_jemalloc}"
        "http://mirrors.kernel.org/ubuntu/pool/universe/libc/libc++/${_libcpp}"
        "http://mirrors.kernel.org/ubuntu/pool/universe/libc/libc++/${_libcppabi}")

sha256sums=('31a327993f8d60becad12f7db87e8fe09449d01f36f6b05fae6cfb17b34e1b1a'
            '50fd3720d129ad7d659b311bb8436169b851f3671112ef53bf5d03580d4947f1'
            'e929f077b6cce54a09593c328f230d96fc8b4983be671db73ee6cdaeaab8f138'
            '9ad2bfaa8fecd5bf6a1138f059fe5fbc28a87b8dcfcefe53f51819a60c919f54')
noextract=('${pkgname}_${_prodver}_amd64.deb'
           '${_jemalloc}'
           '${_libcpp}'
           '${_libcppabi}')
install=$pkgname.install

package() {
  ar x $srcdir/${pkgname}_${_prodver}_amd64.deb
  tar -xf data.tar.xz
 
  mkdir jemalloc
  cd jemalloc
  ar x $srcdir/$_jemalloc
  tar -xf data.tar.xz
 
  cd $srcdir
  mkdir libc++
  cd libc++
  ar x $srcdir/$_libcpp
  tar -xf data.tar.xz
 
  cd $srcdir
  mkdir libc++abi
  cd libc++abi
  ar x $srcdir/$_libcppabi
  tar -xf data.tar.xz
  
  cd $pkgdir
  mv $srcdir/opt .
  mv $srcdir/usr .
  mv $srcdir/lib usr/
  mv $srcdir/jemalloc/usr/lib/x86_64-linux-gnu/libjemalloc.so.1 opt/mssql/lib/
  mv $srcdir/libc++/usr/lib/x86_64-linux-gnu/libc++.so.1 opt/mssql/lib/
  mv $srcdir/libc++/usr/lib/x86_64-linux-gnu/libc++.so.1.0 opt/mssql/lib/
  mv $srcdir/libc++abi/usr/lib/x86_64-linux-gnu/libc++abi.so.1 opt/mssql/lib
  mv $srcdir/libc++abi/usr/lib/x86_64-linux-gnu/libc++abi.so.1.0 opt/mssql/lib

  for i in $(ls opt/mssql/lib/mssql-conf/*.py); do
      sed 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' $i -i
  done
}
