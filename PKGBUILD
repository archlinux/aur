# Maintainer: Alonso Rodriguez <alonsorodi20 (at) gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=lilo
pkgver=24.2
pkgrel=3
pkgdesc="A bootloader for Linux"
arch=('i686' 'x86_64')
url="https://alioth.debian.org/projects/lilo/"
license=('BSD')
backup=('etc/lilo.conf')
depends=('device-mapper' 'coreutils')
makedepends=('bin86' 'sharutils')
optdepends=('perl: to use keytab-lilo')
install=lilo.install
options=('!makeflags')
source=("https://alioth-archive.debian.org/releases/lilo/Lilo/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'lilo.conf'
        '01_makefile-adds.patch'
        '03_keytab-lilo.8-debian-based.patch'
        '05_readme.disk-change.patch'
        '06_notinteractive.patch'
        '08_small-typos-in-manpages.patch'
        '09_fix-manpage-lilo-conf-5.patch'
        '10_fix-manpage-lilo-conf-5.patch'
        '11_fix-gcc-10.patch'
        )

md5sums=('fe5e8c9754cee342b958b5fcbbb6eb51'
         'c828942206c191242875d9b5fbeae094'
         '3e9380373e16b930c079ad31376468d9'
         '684ca1867c5a8ad7f6ba44f0fd92ce52'
         '51703dc2a3784974a49d498599f3da04'
         '4ef1ffaa647531de21b689591b38d6bd'
         '2f0a159a767e118a76f8ffa0c7dce48f'
         '96cfca0c181b116de256e990752f5af0'
         'fd26557bc2d704105369c5ad6e3cc38e'
         '112a98527481c4d9ec8e76a0bd30af8e'
        )

prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  pwd
  patch -Np1 -i ../01_makefile-adds.patch
  patch -Np1 -i ../03_keytab-lilo.8-debian-based.patch
  patch -Np1 -i ../05_readme.disk-change.patch
  patch -Np1 -i ../06_notinteractive.patch
  patch -Np1 -i ../08_small-typos-in-manpages.patch
  patch -Np1 -i ../09_fix-manpage-lilo-conf-5.patch
  patch -Np1 -i ../10_fix-manpage-lilo-conf-5.patch
  patch -Np1 -i ../11_fix-gcc-10.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export LC_ALL=C

  sed -i -e 's/strip lilo.static/strip lilo.static || true/' src/Makefile
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}"/lilo.conf "${pkgdir}"/etc/lilo.conf
  install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  # All binaries in /usr/bin
  mkdir "${pkgdir}"/usr/bin
  mv "${pkgdir}"/sbin/lilo "${pkgdir}"/usr/bin/
  mv "${pkgdir}"/usr/sbin/* "${pkgdir}"/usr/bin/
  rm -rf "${pkgdir}"/sbin
  rm -rf "${pkgdir}"/usr/sbin

  # Avoid conflict with syslinux
  mv "${pkgdir}"/usr/bin/keytab-lilo "${pkgdir}"/usr/bin/keytab-lilo.pl

  # Remove Debian specific files
  rm -rf "${pkgdir}"/etc/initramfs
  rm -rf "${pkgdir}"/etc/kernel
}

