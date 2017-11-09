# $Id$
# Maintainer: tobias <tobias@archlinux.org>

pkgbase=gnome-sharp
pkgname=('gnome-sharp' 'art-sharp' 'gconf-sharp' 'gconf-sharp-peditors' 'libgnome-sharp' 'gnome-vfs-sharp')
pkgvermajor=2
pkgverminor=24
pkgverpatch=4
pkgver=${pkgvermajor}.${pkgverminor}.${pkgverpatch}
pkgrel=5
arch=(i686 x86_64)
license=(LGPL)
url="http://gtk-sharp.sourceforge.net"
makedepends=('gtk-sharp-2' 'libgnomeui' 'monodoc')
source=(https://github.com/mono/${pkgbase}/archive/${pkgver}.tar.gz
        06_fix_mono_path.patch)
md5sums=('c3da83bfaa81eb8bac39d7b2232e2604'
         '923434786ec049eed71a68a0825a3d60')

build() {
  # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR="${srcdir}/weird"
  mkdir -p "${MONO_SHARED_DIR}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  patch -Np1 -i ../06_fix_mono_path.patch
  ./bootstrap-${pkgvermajor}.${pkgverminor} --prefix=/usr --sysconfdir=/etc
  make
}

package_gnome-sharp() {
  pkgdesc="GNOME bindings for C#"
  depends=('art-sharp' 'gconf-sharp' 'gconf-sharp-peditors' 'libgnome-sharp' 'gnome-vfs-sharp')
}

package_art-sharp() {
  pkgdesc="Mono bindings for libart"
  depends=('gtk-sharp-2' 'libart-lgpl')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make -C art install DESTDIR="${pkgdir}"
}

package_gconf-sharp() {
  pkgdesc="Mono bindings for GConf"
  depends=('gtk-sharp-2' 'gconf')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make -C gconf/GConf install DESTDIR="${pkgdir}"
  make -C gconf/tools install DESTDIR="${pkgdir}"
}

package_gconf-sharp-peditors() {
  pkgdesc="Mono bindings for GConf - Property Editing classes"
  depends=('gconf-sharp' 'libgnome-sharp')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make -C gconf/GConf.PropertyEditors install DESTDIR="${pkgdir}"
}

package_libgnome-sharp() {
  pkgdesc="Mono bindings for libgnome"
  depends=('art-sharp' 'gnome-vfs-sharp' 'libgnomeui')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make -C gnome install DESTDIR="${pkgdir}"
}

package_gnome-vfs-sharp() {
  pkgdesc="Mono bindings for GNOME-VFS"
  depends=('gtk-sharp-2' 'gnome-vfs')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make -C gnomevfs install DESTDIR="${pkgdir}"
}

