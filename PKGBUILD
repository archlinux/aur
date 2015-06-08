# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=lilo
pkgver=24.1
pkgrel=1
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
source=("http://lilo.alioth.debian.org/ftp/sources/${pkgname}-${pkgver}.tar.gz"
        'lilo.conf')

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

md5sums=('66573ba8629209da694131efbe20c5de'
         'ca2d8cd9b63f11444861939b42df29c1')
