# maintainer: libele <libele@disroot.org>

pkgname=ifbabel
pkgver=0.6
pkgrel=1
pkgdesc="Treaty of Babel software suite."
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'pentium4' 'x86_64')
url="https://babel.ifarchive.org/program.html"
license=('CC-BY-4.0')
depends=('curl' 'glibc')
makedepends=('dos2unix' 'unzip')
source=("https://babel.ifarchive.org/downloads/babel-${pkgver}.zip")
noextract=("babel-${pkgver}.zip")

md5sums=('28ce74370dc90bbdd2aa21f602a4f348')

prepare() {
  cd "${srcdir}"
  unzip "babel-${pkgver}.zip" -d "babel-${pkgver}"
}

build() {
  cd "${srcdir}"/"babel-${pkgver}"
  make

  cd "${srcdir}"/"babel-${pkgver}"/babel-get
  make

  cd "${srcdir}"/"babel-${pkgver}"/test
  make test-alan test-bronze test-sensory test-twine

  cd "${srcdir}"/"babel-${pkgver}"/extras

  gcc -c -I.. babel-list.c
  gcc -o babel-list babel-list.o ../babel.a ../ifiction.a

  gcc -c -I.. ifiction-aggregate.c
  gcc -o ifiction-aggregate ifiction-aggregate.o ../babel.a ../ifiction.a

  gcc -c -I.. ifiction-xtract.c
  gcc -o ifiction-xtract ifiction-xtract.o ../babel.a ../ifiction.a

  dos2unix *.pl
  sed -i 's,^#!.*,#!/usr/bin/env perl,g' babel-cache.pl
  sed -i 's,^#!.*,#!/usr/bin/env perl,g' babel-infocom.pl
  sed -i 's,^#!.*,#!/usr/bin/env perl,g' babel-marry.pl
  sed -i 's,^#!.*,#!/usr/bin/env perl,g' babel-wed.pl
}

package() {
  cd "${srcdir}"/"babel-${pkgver}"
  install -D -m755 babel "${pkgdir}"/usr/bin/babel

  cd "${srcdir}"/"babel-${pkgver}"/babel-get
  install -D -m755 babel-get "${pkgdir}"/usr/bin/babel-get

  cd "${srcdir}"/"babel-${pkgver}"/extras
  install -D -m755 babel-cache.pl "${pkgdir}"/usr/bin/babel-cache.pl
  install -D -m755 babel-infocom.pl "${pkgdir}"/usr/bin/babel-infocom.pl
  install -D -m755 babel-list "${pkgdir}"/usr/bin/babel-list
  install -D -m755 babel-marry.pl "${pkgdir}"/usr/bin/babel-marry.pl
  install -D -m755 babel-wed.pl	"${pkgdir}"/usr/bin/babel-wed.pl
  install -D -m755 ifiction-aggregate "${pkgdir}"/usr/bin/ifiction-aggregate
  install -D -m755 ifiction-xtract "${pkgdir}"/usr/bin/ifiction-xtract
}
