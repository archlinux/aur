# Maintainer: Alvaro F. García <alvarofernandogarcia@gmail.com>

pkgbase=ibus-clean
pkgname=(ibus-clean libibus-clean)
pkgver=1.5.21
pkgrel=3
pkgdesc="ibus without gtk2 nor python2"
arch=('x86_64')
url="https://github.com/ibus/ibus/wiki"
license=('LGPL')
depends=('dconf' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'python-dbus' 'python-gobject'
         'iso-codes' 'librsvg')
makedepends=('gobject-introspection' 'vala' 'intltool' 'gnome-common' 'gtk-doc' 'qt5-base'
             'cldr-emoji-annotation' 'unicode-character-database' 'unicode-emoji')
options=('!emptydirs')
source=("ibus-$pkgver.tar.gz::https://github.com/ibus/ibus/archive/$pkgver.tar.gz")
sha512sums=('39f5ffe0727af3254e060b82cc99a60126489271863272775e5b1d0e26f31d42d2f9a0cbfe1cb797854f2ae66d5b6c8cdf83bab800af8576b82250ec1e6fb33f')

prepare() {
  cd ibus-$pkgver
  sed -i 's|$(libibus) $(libibus_emoji_dialog)|$(libibus_emoji_dialog) $(libibus)|' ui/gtk3/Makefile.am
}

build() {
  cd ibus-$pkgver
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
  make
}

package_ibus-clean() {
  depends+=("libibus-clean=$pkgver")
  provides+=('ibus=$pkgver')
  conflicts+=('ibus')
  replaces+=('ibus')
  install=ibus.install

  cd ibus-$pkgver
  make DESTDIR="$pkgdir" install
  make -C src DESTDIR="$pkgdir" uninstall
  make -C bindings DESTDIR="$pkgdir" uninstall
  make DESTDIR="$pkgdir" uninstall-pkgconfigDATA
}

package_libibus-clean() {
  pkgdesc="IBus support library"
  depends=('glib2')
  provides+=('libibus=$pkgver')
  conflicts+=('libibus')
  replaces+=('libibus')

  cd ibus-$pkgver
  make -C src DESTDIR="$pkgdir" install
  make -C bindings DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-pkgconfigDATA
}
