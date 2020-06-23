# Maintainer: Alvaro F. García <alvarofernandogarcia@gmail.com>

pkgbase=ibus-clean
pkgname=(ibus-clean libibus-clean)
pkgver=1.5.22+8+gf591381e
pkgrel=2
pkgdesc="ibus without gtk2 nor python2"
arch=('x86_64')
url="https://github.com/ibus/ibus/wiki"
license=('LGPL')
depends=('dconf' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'python-dbus' 'python-gobject'
         'iso-codes' 'librsvg')
makedepends=('gobject-introspection' 'vala' 'intltool' 'gnome-common' 'gtk-doc' 'qt5-base'
             'cldr-emoji-annotation' 'unicode-character-database' 'unicode-emoji' 'git')
options=('!emptydirs')
_commit=f591381e3c892947ecaffe9131b9039ab9014498  # master
source=("git+https://github.com/ibus/ibus#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd ibus
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd ibus
  ./autogen.sh \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus \
    --sysconfdir=/etc \
    --enable-dconf \
    --enable-wayland \
    --enable-gtk-doc \
    --disable-gtk2 \
    --disable-python2 \
    --disable-memconf \
    --enable-ui \
    --enable-python-library \
    --with-python=python3 \
    --with-ucd-dir=/usr/share/unicode/
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_ibus-clean() {
  depends+=("libibus-clean=$pkgver")
  provides+=("ibus=$pkgver")
  conflicts+=('ibus')
  replaces+=('ibus')
  install=ibus.install

  cd ibus
  make DESTDIR="$pkgdir" install
  make -C src DESTDIR="$pkgdir" uninstall
  make -C bindings DESTDIR="$pkgdir" uninstall
  make DESTDIR="$pkgdir" uninstall-pkgconfigDATA
}

package_libibus-clean() {
  pkgdesc="libibus without gtk2 nor python2"
  depends=(libg{lib,object,io}-2.0.so)
  provides+=('libibus')
  provides+=('libibus-1.0.so')
  conflicts+=('libibus')
  replaces+=('libibus')

  cd ibus
  make -C src DESTDIR="$pkgdir" install
  make -C bindings DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-pkgconfigDATA
}
