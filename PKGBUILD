# Maintainer: Marco Pompili
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=steghide
pkgver=0.5.1
pkgrel=9
pkgdesc='Embeds a message in a file by replacing some of the least significant bits'
arch=('x86_64')
url='http://steghide.sourceforge.net'
license=('GPL')
depends=('libmcrypt' 'gcc-libs' 'mhash' 'libjpeg' 'zlib')
source=("steghide-${pkgver}.tar.gz::https://sourceforge.net/projects/steghide/files/steghide/${pkgver}/steghide-${pkgver}.tar.gz/download"
        'buildsystem.patch'
        'gcc-4.2.patch'
         "${pkgname}-climits.patch"
         steghide-gcc6.patch)
md5sums=('5be490e24807d921045780fd8cc446b3'
         '14f5e054d71c91262bb1140288043df8'
         'fd861dc5a0a392c6c94a61e85ad74f29'
         '897ce18edd008293a3328bc3f88775b3'
         '6dd60a84fccca270fa7315f1102454ff')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 < ../buildsystem.patch

  # this patch courtesy gentoo bug tracker #178134
  patch -Np1 -i ../gcc-4.2.patch
  patch -Np1 -i ../steghide-climits.patch

  patch -p1 -i ../steghide-gcc6.patch # Fix build with GCC 6

  # touch files needed by GNU Autotools
  touch NEWS AUTHORS ChangeLog

  # autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
