# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-gstreamer0.10
pkgver=0.10.36
pkgrel=5
pkgdesc='GStreamer Multimedia Framework'
arch=('x86_64')
license=('LGPL')
url='http://gstreamer.freedesktop.org/'
depends=('gstreamer0.10' 'lib32-glib2' 'lib32-libxml2')
makedepends=('gcc-multilib' 'git' 'intltool' 'python2')
source=('git://anongit.freedesktop.org/gstreamer-sdk/gstreamer#commit=3ddc31eaa18c3be1613e43430eca78a3e445639e'
        'bison3.patch')
sha256sums=('SKIP'
            'ed154e280abf59b24d98a8ab0fe868b449b26aa61f7ae3813fab8ac615fcaefa')

prepare() {
  cd gstreamer

  patch -Np1 -i ../bison3.patch
  sed 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' -i configure.ac

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd gstreamer

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
  cd gstreamer

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
