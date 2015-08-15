# Maintainer : Rob McCathie <korrode at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_name=metacity
pkgname=metacity2
pkgver=2.34.13
pkgrel=1
pkgdesc="Legacy GNOME window manager"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'libcanberra' 'libgtop' 'libsm' 'gsettings-desktop-schemas' 'gtk2' 'startup-notification' 'zenity')
makedepends=('intltool' 'itstool')
url="https://wiki.gnome.org/Projects/Metacity"
provides=("${_name}=${pkgver}")
conflicts=("${_name}")
install=metacity.install
source=(http://ftp.gnome.org/pub/gnome/sources/$_name/${pkgver%.*}/$_name-$pkgver.tar.xz
        fix_compositing_startup.patch
        fix_force_quit.patch
        fix_shadows.patch
        enable_compositing.patch
        application-switcher.patch)
sha256sums=('8cf4dbf0da0a6f36357ce7db7f829ec685908a7792453c662fb8184572b91075'
            '5094a0ffe3eb8289ed752829877c2e1b743eddf938ad3fc92fb4574b42765ae2'
            '917760ac3375894ebb4052dfc7c8dff1ac556fb81033d7a7caf02123ceede50d'
            'a0981477e9b3fd108fd03b7637bfd1f17a1f6cb13ec703d86b424b55076096f3'
            'e53c1c20e19cd3d94d05d08045c7a9a373ce52051928ccc69bf3068081f30f9a'
            '177ded8203c3ff25f59a24445145cb54da9aba4216a0014c34979b7c12f3c099')

prepare() {
  cd "$_name-$pkgver"

  # https://bugzilla.gnome.org/show_bug.cgi?id=658036
  patch -Np1 -i "$srcdir/fix_compositing_startup.patch"

  # https://bugzilla.gnome.org/show_bug.cgi?id=687938
  patch -Np1 -i "$srcdir/fix_force_quit.patch"

  # https://bugzilla.gnome.org/show_bug.cgi?id=648340
  patch -Np1 -i "$srcdir/fix_shadows.patch"

  # Enable compositing by default (required for the desktop rendering feature of nautilus)
  patch -Np1 -i "$srcdir/enable_compositing.patch"

  # Rename switch-windows to switch-applications (required for GNOME 3.8 compatibility)
  patch -Np1 -i "$srcdir/application-switcher.patch"
}

build() {
  cd "$_name-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$_name \
              --disable-static --disable-schemas-compile
  make
}

package() {
  cd "$_name-$pkgver"
  make DESTDIR="$pkgdir" install
}
