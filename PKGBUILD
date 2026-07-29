# Maintainer: Josephine Pfeiffer <hi@josie.lol>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
# Contributor: Matrix <thysupremematrix at tuta dot io>
# Contributor: Yurii Kolesnykov <yurikoles@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=gstreamer0.10
_pkgname=gstreamer
pkgver=0.10.36
pkgrel=21
pkgdesc="Legacy GStreamer 0.10 multimedia framework"
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL-2.0-or-later')
url='https://gstreamer.freedesktop.org'
depends=('bash' 'glib2' 'glibc' 'libxml2')
makedepends=('glib2-devel')
provides=('libgstreamer-0.10.so' 'libgstbase-0.10.so' 'libgstcheck-0.10.so'
          'libgstcontroller-0.10.so' 'libgstdataprotocol-0.10.so' 'libgstnet-0.10.so')
source=("https://gstreamer.freedesktop.org/src/gstreamer/${_pkgname}-${pkgver}.tar.xz"
        'bison3.patch')
sha256sums=('9151aa108c177054387885763fa0e433e76780f7c5655c70a5390f2a6c6871da'
            'ed154e280abf59b24d98a8ab0fe868b449b26aa61f7ae3813fab8ac615fcaefa')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -Np1 -i ../bison3.patch
  sed -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' -i configure.ac
  sed -e 's/static volatile gsize gonce_data/static gsize gonce_data/g' -i gst/gstutils.h

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --libexecdir=/usr/lib \
              --disable-gtk-doc \
              --disable-static \
              --disable-introspection

  make
}

check() {
  cd "${_pkgname}-${pkgver}"
  make check-exports check-enum-gettypes
  make -C tests/check check CFLAGS="${CFLAGS} -std=gnu17" \
    TESTS='gst/gstbuffer gst/gstcaps gst/gststructure'
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -f "${pkgdir}"/usr/bin/gst-{feedback,inspect,launch,typefind,xmlinspect,xmllaunch}
}
