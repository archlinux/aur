# Maintainer Yurii Kolesnykov <yurikoles@gmail.com>
# Credit: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10
_pkgname=gstreamer
pkgver=0.10.36
pkgrel=6
pkgdesc="GStreamer Multimedia Framework"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gstreamer.com"
depends=('libxml2' 'glib2')
makedepends=('intltool' 'pkgconfig' 'gobject-introspection' 'git')
source=('https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-0.10.36.tar.xz'
        tests-remove-silly-test_fail_abstract_new-check.patch
        bison3.patch)
sha256sums=('9151aa108c177054387885763fa0e433e76780f7c5655c70a5390f2a6c6871da'
            'd3d3f4f04453831fdb4244bfe174a38c4e6f9f4da5c8c9050dcfa1a6097aad52'
            'ed154e280abf59b24d98a8ab0fe868b449b26aa61f7ae3813fab8ac615fcaefa')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../tests-remove-silly-test_fail_abstract_new-check.patch
  patch -Np1 -i ../bison3.patch
  sed -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' -i configure.ac
}
build() {
  cd $_pkgname-$pkgver
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib \
    --with-package-name="GStreamer (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/" \
    --disable-gtk-doc --disable-static
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install

  #Remove unversioned gst-* binaries to get rid of conflicts
  cd "${pkgdir}/usr/bin"
  for bins in `ls *-0.10`; do
    rm -f ${bins/-0.10/}
  done
}
