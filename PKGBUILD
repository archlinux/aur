# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-gstreamer0.10
pkgver=0.10.36.1
pkgrel=3
pkgdesc='GStreamer Multimedia Framework'
arch=('x86_64')
license=('LGPL')
url='http://gstreamer.freedesktop.org/'
depends=('gstreamer0.10' 'lib32-glib2' 'lib32-libxml2')
makedepends=('gcc-multilib' 'git' 'intltool' 'python2' 'flex')
source=('git://github.com/GStreamer/gstreamer.git#branch=0.10'
        'git://github.com/GStreamer/common.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/gstreamer" || exit 1

  git submodule init
  git config submodule.common.url "$srcdir/common"
  git submodule update 

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$srcdir/gstreamer" || exit 1

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --libexecdir='/usr/lib32' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --with-package-name='GStreamer (Archlinux Multilib)' \
    --with-package-origin='http://www.archlinux.org/' \
    --disable-examples \
    --disable-introspection \
    --disable-static \
    --disable-tests
  make
}

package() {
  cd "$srcdir/gstreamer" || exit 1

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir:?}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
