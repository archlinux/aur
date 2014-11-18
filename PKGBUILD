# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.20.0
pkgrel=2
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
license=('LGPL')
depends=('cogl' 'mesa' 'json-glib' 'atk' 'libxi' 'libxkbcommon' 'libinput')
makedepends=('gobject-introspection' 'python2')
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz
        closure-annotation.patch
        evdev-flush-event-queue.patch
        dont-update-pangocontext.patch
        create-pangocontext-per-actor.patch)
sha256sums=('cc940809e6e1469ce349c4bddb0cbcc2c13c087d4fc15cda9278d855ee2d1293'
            'af2931bfd1f444244edd84e49e926ee82d434703d56ae77759ce0635f5f72475'
            '0d2508da28d5032c4ec7531396f490e4f16c98cbf99fae3c878ed3012f65dcba'
            'cdee1e269e0c11ceea3b32a3345f62e052516bb4e4be6337ae4bfec735c8750f'
            'a3e0a47f0fe5bff8bc1170cf07c16ca6722ea49b00c704d4d00b16e2781923cd')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../closure-annotation.patch
  patch -Np1 -i ../evdev-flush-event-queue.patch
  patch -Np1 -i ../dont-update-pangocontext.patch
  patch -Np1 -i ../create-pangocontext-per-actor.patch
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
