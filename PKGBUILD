# Maintainer: Gabriel Morrison Lima Dantas <gabrielmldantas@gmail.com>
# Contributor: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
pkgname=mssql-server
pkgver=14.0.900.75
_prodver=${pkgver}-1
pkgrel=1
_libcpp='libc++1_3.9.1-3_amd64.deb'
_libcppabi='libc++abi1_3.9.1-3_amd64.deb'
_jemalloc=libjemalloc1_3.6.0-10_amd64.deb
pkgdesc="Microsoft SQL Server for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('unknown')
depends=(python2-configparser numactl sssd 'openssl-1.0>=1.0.2.l')
source=("https://packages.microsoft.com/ubuntu/16.04/mssql-server/pool/main/m/mssql-server/${pkgname}_${_prodver}_amd64.deb"
        "http://mirrors.kernel.org/ubuntu/pool/universe/j/jemalloc/${_jemalloc}"
        "http://mirrors.kernel.org/ubuntu/pool/universe/libc/libc++/${_libcpp}"
        "http://mirrors.kernel.org/ubuntu/pool/universe/libc/libc++/${_libcppabi}")

sha256sums=('6365e7a479d94a07e074093e895b02b6dc2a3a158f0d5e22aa70a246cd9a7094'
            '5e31b5dfb21525b9207ff0c70c34c69366300de342edb37070e816e0fbc27ad0'
            'acf4594581ff04532c8da7427646e904393791ef7671fff95cde480d7269eafd'
            'a3c8214afae4fd966ba277f47ae8554641999634f2b7d40e27705eb7c0d52be3')
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
