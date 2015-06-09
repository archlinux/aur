# Maintainer: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Firmicus <firmicus@gmx.net>

pkgname=sunclock
pkgver=3.57
pkgrel=3
pkgdesc="An astronomical world map that shows day and night and the Sun and Moon positions"
arch=('i686' 'x86_64')
url="https://github.com/mdoege/Sunclock"
license=('GPL')
depends=('libjpeg-turbo' 'libpng' 'libxpm')
makedepends=('imake' 'git' 'tar')
source=("git://github.com/mdoege/Sunclock.git"
        "disable_zlib.patch"
        "${pkgname}.desktop")
md5sums=('SKIP'
         '04b25149d5f2f2573c65192e6d6b0b0e'
         '1857fc30b03ca09d8d9babc8c9857dc6')

build() {
  cd "${srcdir}/Sunclock"

  # Apply a Debian patch to disable zlib
  patch -N ${srcdir}/Sunclock/sunclock-3.57/Imakefile ${srcdir}/disable_zlib.patch

  # Fix path to 'emx' binary
  sed -i "s_/share/sunclock/bin_/bin_" sunclock-3.57/Imakefile
  cd sunclock-3.57
  xmkmf
  make
}

package() {
  cd "${srcdir}/Sunclock"
  tar xjf medium_images_270804.tar.bz2 
  tar xjf big_images_270804.tar.bz2

  # Install program files
  cd "${srcdir}/Sunclock/sunclock-3.57"
  make DESTDIR="${pkgdir}" \
       BINDIR=/usr/bin \
       EMXBINDIR=/usr/bin \
       SHAREDIR=/usr/share/${pkgname} \
       MANDIR=/usr/share/man/man1 install

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${pkgname}/earthmaps/jpeg"
  install -m644 ../images/medium/*.jpg ../huge.jpg "${pkgdir}/usr/share/${pkgname}/earthmaps/jpeg"
  install -m644 ../images/big/*.jpg "${pkgdir}/usr/share/${pkgname}/earthmaps/jpeg"
  install -Dm644 README "$pkgdir/usr/share/doc/sunclock/README"

  # Install a desktop entry
  install -Dm644 wm_icons/sunclock2.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm644 ${srcdir}/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
