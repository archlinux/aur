# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Unknown47 <unknown47r@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

_pkgname=libfm
pkgname=libfm-gtk2
pkgver=1.4.0
pkgrel=1
pkgdesc='GTK+ 2 library for file management'
url='https://lxde.org/'
arch=('x86_64')
license=('GPL')
depends=('gtk2' 'menu-cache' "libfm=$pkgver")
replaces=('lxshortcut')
provides=('lxshortcut')
conflicts=('lxshortcut')
makedepends=('intltool' 'gtk-doc' 'vala' 'glib2-devel')
source=(https://github.com/lxde/libfm/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('7d7b616411992389a4b7f35796109d605f30bc2ceab84d4081d1665254ebbf82')

prepare() {
  cd $_pkgname-$pkgver
  # Update xarchiver option
  # https://github.com/lxde/libfm/issues/35
  sed -i 's/create=xarchiver --add-to %F/create=xarchiver --compress %F/' data/archivers.list

  autoreconf -fi
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-gnu-ld \
    --enable-gtk-doc

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/include/libfm
  rm -rf "$pkgdir"/usr/include/libfm-1.0
  rm -rf "$pkgdir"/usr/include/libfm/fm-{extra,version,xml-file}.h
  rm -rf "$pkgdir"/usr/lib/libfm-extra.*
  rm -rf "$pkgdir"/usr/lib/pkgconfig/libfm-extra.pc

  # Split libfm-gtk2
  [[ -d "$srcdir/libfm-gtk2" ]] && rm -r "$srcdir/libfm-gtk2/"
  mkdir "$srcdir"/libfm-gtk2
  mv "$pkgdir/usr/bin" \
     "$pkgdir"/usr/lib/libfm-gtk.* \
     "$pkgdir"/usr/lib/libfm/modules/gtk-* \
     "$pkgdir/usr/lib/pkgconfig/libfm-gtk.pc" \
     "$pkgdir/usr/share/applications" \
     "$pkgdir/usr/share/man" \
     "$srcdir/libfm-gtk2/"

  rm -rf "$pkgdir"
  mkdir "$pkgdir"

  cd "$srcdir"/libfm-gtk2
  mkdir -p "$pkgdir"/usr/{lib/{libfm/modules,pkgconfig},share}
  mv bin "$pkgdir/usr"
  mv libfm-gtk.so* "$pkgdir"/usr/lib
  mv gtk-* "$pkgdir"/usr/lib/libfm/modules
  mv libfm-gtk.pc "$pkgdir/usr/lib/pkgconfig"
  mv applications "$pkgdir/usr/share"
  mv man "$pkgdir/usr/share"
}

