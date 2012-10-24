# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: scj <scj(at)archlinux(dot)us>

pkgname=incron
pkgver=0.5.10
pkgrel=3
pkgdesc='Like the regular cron but is driven by filesystem events instead of time periods'
arch=('i686' 'x86_64')
url="http://incron.aiken.cz/"
license=('GPL')
depends=('gcc-libs' 'bash')
install=incron.install
options=('emptydirs')
source=("http://inotify.aiken.cz/download/incron/$pkgname-$pkgver.tar.gz"
	'incron.init'
	'incrond.service')
md5sums=('67f8b671db8169edccc8ef11c7d2c8be'
         '648e1ca1a4b1e624401d9d71aa3756b3'
         '859a90af9e4efe40db381ea07167a66a')

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  sed -i '1,1i#include <unistd.h>' inotify-cxx.cpp icd-main.cpp
  sed -i '1,1i#include <stdio.h>' icd-main.cpp inotify-cxx.cpp usertable.cpp appargs.cpp
  sed -i 's|strchr(s,|(char*)strchr(s,|' incroncfg.cpp
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -d "${pkgdir}"/usr/share/man "${pkgdir}"/usr/{s,}bin

  make PREFIX="${pkgdir}"/usr \
    MANPATH="${pkgdir}"/usr/share/man \
    USERDATADIR="${pkgdir}"/var/spool/incron \
    CFGDIR="${pkgdir}"/etc \
    SYSDATADIR="${pkgdir}"/etc/incron.d install

  install -Dm0755 "${srcdir}"/incron.init "${pkgdir}"/etc/rc.d/incrond
  install -Dm0644 "${srcdir}/incrond.service" "${pkgdir}/usr/lib/systemd/system/incrond.service"
}
