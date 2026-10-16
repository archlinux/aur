# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Laurent Hilsz <laurent.hilsz@laposte.net> 

pkgname=fdutils
pkgver=5.6
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Utilities for the Linux floppy driver, i.e. for formatting extra capacity disks"
url="http://fdutils.linux.lu/index.html"
makedepends=('texinfo' 'texlive-basic' 'texlive-plaingeneric' 'autoconf-archive')
depends=('glibc' 'bash')
source=(http://deb.debian.org/debian/pool/main/f/fdutils/fdutils_${pkgver}.orig.tar.gz
        http://deb.debian.org/debian/pool/main/f/fdutils/fdutils_${pkgver}-2.debian.tar.xz
        destdir_fix.patch
)
md5sums=('85efbd7b9a4cf87687d3270ed2a7e7fd'
         '734bc4ad5e69014b37c2ed2afe3d8c16'
         '22e16c952f64e0a4385db74fc089170b')
options=('!makeflags')
license=('GPL-2.0-or-later')

prepare() {
  cd "${srcdir}/fdutils-${pkgver}"
  chmod -R u+w .
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
  cd "${srcdir}/fdutils-${pkgver}"
  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc
  sed -i 's+-c -s -m+-c -m+g' src/Makefile
  make
}

package() {
  cd "${srcdir}/fdutils-${pkgver}"
  install -d "${pkgdir}/etc"
  make DESTDIR="${pkgdir}" datarootdir="${pkgdir}/usr/share" install install-doc install-info
  rm "${pkgdir}/usr/share/man/man4/fd.4"
}
