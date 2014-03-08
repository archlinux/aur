# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.16.4
pkgrel=3
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
license=('LGPL')
depends=('cogl' 'mesa' 'json-glib' 'atk' 'libxi' 'libxkbcommon' 'libevdev')
makedepends=('gobject-introspection')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz
        fix_buffer_age.patch
        unref_devices_on_removal.diff
        fix_a_segfault_on_device_removal.diff
        stop_using_deprecated_libevdev_api.diff)
sha256sums=('cf50836ec5503577b73f75f984577610881b3e2ff7a327bb5b6918b431b51b65'
            'e254b26663c88dfba756934f011451c0551e52bb70e2de037835aea267ed7bda'
            '70494fe0b46bbe4157196fd855e3fcef0970e543979018df57676fea00dd38af'
            'a9dabecb727f23654ef622aef8bba92e3dd1381ef6257107da7a689766e9917c'
            '02768f0032f57939caa3f0695723fd3a6b4ab7bb33908ca50502dfc7f49e6c21')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../fix_buffer_age.patch
  
  # fix build with libevdev >= 1.0.x
  # https://git.gnome.org/browse/clutter/commit/?h=clutter-1.18&id=7d8f72a60e4087a4d9e48d3f0e38b669b3717243
  patch -Np1 -i ../unref_devices_on_removal.diff
  # https://git.gnome.org/browse/clutter/patch/?id=05e6bcc666e345ed4619c1a40a298212d1075b99
  patch -Np1 -i ../fix_a_segfault_on_device_removal.diff
  # https://git.gnome.org/browse/clutter/patch/?id=3cd9a70fea1ccf795419a1726c7c279b0aaf237e
  patch -Np1 -i ../stop_using_deprecated_libevdev_api.diff
  
  autoreconf -vfi
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-introspection \
    --enable-wayland-backend --enable-egl-backend --enable-evdev-input \
    --enable-wayland-compositor

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
