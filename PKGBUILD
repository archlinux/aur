# $Id$
# Maintainer: tobias <tobias@archlinux.org>

pkgbase=gnome-sharp
pkgname=('gnome-sharp' 'art-sharp' 'gconf-sharp' 'gconf-sharp-peditors' 'libgnome-sharp' 'gnome-vfs-sharp')
pkgver=2.24.2
pkgrel=4
arch=(i686 x86_64)
license=(LGPL)
url="http://gtk-sharp.sourceforge.net"
makedepends=('gtk-sharp-2' 'libgnomeui' 'monodoc')
source=(https://download.gnome.org/sources/gnome-sharp/2.24/${pkgbase}-${pkgver}.tar.bz2
        02_fix_pkg-config_paths.patch
        04_initialize_dbus_glib_threading.patch)
md5sums=('3b38f53960c736d4afb8f04204efe98b'
         'a8c1bf57a384f5fc20a5890f9f1cef5a'
         '90cd7ea88aaa3011522376153433d115')

build() {
  # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR="${srcdir}/weird"
  mkdir -p "${MONO_SHARED_DIR}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  patch -Np1 -i ../04_initialize_dbus_glib_threading.patch
  patch -Np1 -i ../02_fix_pkg-config_paths.patch
  ./configure --prefix=/usr --sysconfdir=/etc
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
