# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgbase=ibus
pkgbase=$_pkgbase-git
pkgname=($pkgbase lib$pkgbase)
pkgver=1.5.23+12+gef4c5c7e
pkgrel=1
pkgdesc="Next Generation Input Bus for Linux"
arch=('x86_64')
url="https://github.com/${_pkgbase}/${_pkgbase}/wiki"
license=('LGPL')
depends=('dconf' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'python-dbus' 'python-gobject'
         'iso-codes' 'librsvg')
makedepends=('gobject-introspection' 'vala' 'intltool' 'gnome-common' 'gtk-doc' 'gtk2' 'qt5-base'
             'unicode-cldr' 'unicode-character-database' 'unicode-emoji' 'git')
options=('!emptydirs')
source=("${_pkgbase}::git+https://github.com/${_pkgbase}/${_pkgbase}")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgbase
  sed -i 's|$(libibus) $(libibus_emoji_dialog)|$(libibus_emoji_dialog) $(libibus)|' ui/gtk3/Makefile.am
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgbase
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/$_pkgbase \
    --sysconfdir=/etc \
    --enable-dconf \
    --enable-wayland \
    --enable-gtk-doc \
    --disable-memconf \
    --enable-ui \
    --disable-python2 \
    --with-python=python3 \
    --with-ucd-dir=/usr/share/unicode/
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_ibus-git() {
  depends+=("lib$pkgbase=$pkgver")
  conflicts=($_pkgbase)
  provides=($_pkgbase)

  cd $_pkgbase
  make DESTDIR="$pkgdir" install
  make -C src DESTDIR="$pkgdir" uninstall
  make -C bindings DESTDIR="$pkgdir" uninstall
  make DESTDIR="$pkgdir" uninstall-pkgconfigDATA
}

package_libibus-git() {
  pkgdesc="IBus support library"
  depends=(libg{lib,object,io}-2.0.so)
  provides=("lib$_pkgbase" "lib$_pkgbase-1.0.so")
  conflicts=("lib$_pkgbase")

  cd $_pkgbase
  make -C src DESTDIR="$pkgdir" install
  make -C bindings DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-pkgconfigDATA
}
