# $Id: PKGBUILD 63680 2012-02-05 12:06:13Z ibiru $
# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Markus Meissner <markus@meissna.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=nvclock
pkgver=0.8b4
pkgrel=3
pkgdesc='A small utility which allows users to overclock NVIDIA based video cards.'
arch=('i686' 'x86_64')
url='http://www.linuxhardware.org/nvclock/'
license=('GPL')
depends=('gtk2')
optdepends=('gksu: to start nvclock via the desktop menu entry')
install='nvclock.install'
options=('!makeflags')
source=("http://www.linuxhardware.org/${pkgname}/${pkgname}${pkgver}.tar.gz"
        'nvclock-0.8b4-buildfix.patch'
        'nvclock-0.8b4-linkfix.patch'
        'nvclock.desktop-use-gksu.patch')
md5sums=('23f1b3ebf40f35d76d5fdac50f66ab11'
         '1da24b50dd6a8c4704fa550a3e1a8b53'
         'b812646787ea44e693fd2288612f25ad'
         '98fc1995721d0b0e8ff6d448869eee6d')

build(){
  cd "${srcdir}/${pkgname}${pkgver}"

  # build and link fixes from Fedora
  patch -Np1 -i "${srcdir}/nvclock-0.8b4-buildfix.patch"
  patch -Np1 -i "${srcdir}/nvclock-0.8b4-linkfix.patch"

  # Make ".desktop" file use gksu(1).
  patch -Np0 -i "${srcdir}/nvclock.desktop-use-gksu.patch"

  sed -i 's:${prefix}/man:${prefix}\/share\/man:' "${srcdir}/${pkgname}${pkgver}/Makefile.in"

  ./configure --prefix=/usr --bindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}${pkgver}"
  make DESTDIR="${pkgdir}" install
}
