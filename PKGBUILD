# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Markus Meissner <markus@meissna.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=nvclock
pkgver=0.8b4
pkgrel=4
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
        'nvclock.desktop-use-gksu.patch'
        'gcc10-build.patch')
md5sums=('23f1b3ebf40f35d76d5fdac50f66ab11'
         '1da24b50dd6a8c4704fa550a3e1a8b53'
         'b812646787ea44e693fd2288612f25ad'
         '98fc1995721d0b0e8ff6d448869eee6d'
         '096769701c5a1442fadd69d6f09962f5')
         
prepare(){
  cd "${srcdir}/${pkgname}${pkgver}"

  # build and link fixes from Fedora
  patch -Np1 -i "${srcdir}/nvclock-0.8b4-buildfix.patch"
  patch -Np1 -i "${srcdir}/nvclock-0.8b4-linkfix.patch"
  
  # Make ".desktop" file use gksu(1).
  patch -Np0 -i "${srcdir}/nvclock.desktop-use-gksu.patch"
  sed -i 's:${prefix}/man:${prefix}\/share\/man:' "${srcdir}/${pkgname}${pkgver}/Makefile.in"
  
  #Fix build with gcc 10
  patch -Np1 -i "${srcdir}/gcc10-build.patch"
}

build(){
  cd "${srcdir}/${pkgname}${pkgver}"
  ./configure --prefix=/usr --bindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}${pkgver}"
  make DESTDIR="${pkgdir}" install
}
