# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Laurent Hilsz <laurent.hilsz@laposte.net> 

pkgname=fdutils
pkgver=5.6
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Utilities for the Linux floppy driver, i.e. for formatting extra capacity disks"
url="http://fdutils.linux.lu/index.html"
makedepends=('texinfo' 'tcc' 'texlive-bin' 'texlive-core')
depends=('glibc' 'tcc' 'texinfo')
source=(http://deb.debian.org/debian/pool/main/f/fdutils/fdutils_5.6.orig.tar.gz
        http://deb.debian.org/debian/pool/main/f/fdutils/fdutils_5.6-2.debian.tar.xz
        destdir_fix.patch
)
md5sums=('85efbd7b9a4cf87687d3270ed2a7e7fd'
         '734bc4ad5e69014b37c2ed2afe3d8c16'
         '22e16c952f64e0a4385db74fc089170b')
install=fdutils.install
options=('!strip' '!makeflags' '!buildflags')
license=('GPL')

prepare() {
  cd "${srcdir}/fdutils-5.6"
  while read -r i 
  do
    if echo "$i" | grep -q fdmount-compilation_linux_2.6.patch
    then
      continue
    fi
    patch -p1 -i "${srcdir}/debian/patches/${i}"
  done < "${srcdir}/debian/patches/series"
  patch -p2 -i "${srcdir}/destdir_fix.patch"
}

build() {
  cd "${srcdir}/fdutils-5.6"
  autoreconf
  export CC=tcc
  # ./configure --prefix=/usr --sysconfdir=/etc --infodir=/usr/share/info
  ./configure --prefix=/usr --sysconfdir=/etc
  sed -i 's+-c -s -m+-c -m+g' src/Makefile
  make
}

package() {
  cd "${srcdir}/fdutils-5.6"
  install -d $pkgdir/etc
  make DESTDIR=$pkgdir datarootdir=$pkgdir/usr/share install install-doc install-info
  rm "${pkgdir}/usr/share/man/man4/fd.4"
}
