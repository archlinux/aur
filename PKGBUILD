# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: Federico Cinelli <cinelli.federico@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=lilo-git
pkgver=140.05bc1df
pkgrel=1
pkgdesc="Current git tree of a bootloader for Linux"
arch=('i686' 'x86_64')
url="https://alioth.debian.org/projects/lilo/"
license=('BSD')
backup=('etc/lilo.conf')
depends=('device-mapper' 'coreutils')
makedepends=('bin86' 'sharutils' 'git')
optdepends=('perl: to use keytab-lilo')
install=lilo.install
options=('!makeflags')
provides=('lilo')
replaces=('lilo')
source=('git+https://salsa.debian.org/joowie-guest/maintain_lilo.git'
        'lilo.conf')

pkgver() {
  cd "${srcdir}"/maintain_lilo
  echo `git rev-list --count master`.`git rev-parse --short master`
}

build() {
  cd "${srcdir}"/maintain_lilo
  export LC_ALL=C

  sed -i -e 's/strip lilo.static/strip lilo.static || true/' src/Makefile
  make all
}

package() {
  cd "${srcdir}"/maintain_lilo
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

md5sums=('SKIP' 'ca2d8cd9b63f11444861939b42df29c1')
