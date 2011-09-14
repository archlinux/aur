# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: scj <scj(at)archlinux(dot)us>

pkgname=incron
pkgver=0.5.9
pkgrel=2
pkgdesc="Like the regular cron but is driven by filesystem events instead of time periods"
arch=('i686' 'x86_64')
url="http://incron.aiken.cz/"
license=('GPL')
depends=('gcc-libs' 'bash')
install=incron.install
source=("http://inotify.aiken.cz/download/incron/$pkgname-$pkgver.tar.gz"
    	'incron.init')
options=('emptydirs')
md5sums=('a285b9e14af7bf9f9524fe051a06255f'
         '648e1ca1a4b1e624401d9d71aa3756b3')

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  
  install -D -m 755 "${srcdir}"/incron.init "${pkgdir}"/etc/rc.d/incrond
  install -d "${pkgdir}"/usr/share/man "${pkgdir}"/usr/{s,}bin

  sed -i '1,1i#include <stdio.h>' icd-main.cpp inotify-cxx.cpp usertable.cpp appargs.cpp
  sed -i 's|strchr(s,|(char*)strchr(s,|' incroncfg.cpp

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  make PREFIX="${pkgdir}"/usr \
    MANPATH="${pkgdir}"/usr/share/man \
    USERDATADIR="${pkgdir}"/var/spool/incron \
    CFGDIR="${pkgdir}"/etc \
    SYSDATADIR="${pkgdir}"/etc/incron.d install
}
