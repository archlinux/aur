# Maintainer: James Harvey <jamespharvey20@gmail.com>

# _use_mysql_package valid values:
#    none
#    mariadb
#    mysql
_use_mysql_package="none"

pkgname=sysbench-git
_pkgname=sysbench
pkgver=0.5.r212.0257f50
pkgrel=1
pkgdesc='Multi-threaded benchmark for evaluating OS parameters for database-loads (git)'
arch=('x86_64' 'i686')
license=('GPL2')
url='https://github.com/akopytov/sysbench'
depends=('glibc')
if [[ "${_use_mysql_package}" == "mariadb" ]]; then
   depends=('glibc' 'mariadb')
elif [[ "${_use_mysql_package}" == "mysql" ]]; then
   depends=('glibc' 'mysql')
elif [[ "${_use_mysql_package}" != "none" ]]; then
   echo "_use_mysql_package is \"${_use_mysql_package}\", but valid values are \"none\", \"mariadb\", or \"mysql\""
   exit
fi
optdepends=('mariadb' 'mysql')
makedepends=('git')
source=('git+https://github.com/akopytov/sysbench')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(cat sysbench/sb_win.h | grep "define PACKAGE_VERSION" | sed 's|^#define PACKAGE_VERSION "||' | sed 's|"$||').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh

   if [[ "${_use_mysql_package}" == "mariadb" ]]; then
      ./configure --prefix=/usr
   elif [[ "${_use_mysql_package}" == "mysql" ]]; then
      ./configure --prefix=/usr
   elif [[ "${_use_mysql_package}" == "none" ]]; then
      ./configure --without-mysql --prefix=/usr
   else
      echo "_use_mysql_package is \"${_use_mysql_package}\", but valid values are \"none\", \"mariadb\", or \"mysql\""
      exit
   fi

   make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  install -Dm644 README.md "${pkgdir}/usr/share/${_pkgname}/README.md"
}
