# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=pygtk
pkgver=2.24.0
pkgrel=12
pkgdesc="Python bindings for the GTK widget set"
url="http://www.pygtk.org/"
arch=('x86_64')
license=('LGPL')
depends=('libglade' 'python2-cairo' 'python2-gobject2')
makedepends=('python2-numpy' 'pygobject2-devel' 'wget')
optdepends=('python2-numpy')
source=("https://download.gnome.org/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2"
        "https://gitlab.gnome.org/Archive/pygtk/-/commit/4aaa48eb80c6802aec6d03e5695d2a0ff20e0fc2.patch"
        'python27.patch'
        'fix-leaks-of-pango-objects.patch')
sha512sums=('64f4344fcf7636e0b2016ffd5310250b5c02a1bf87e44aef39b5d4cf4a5fc50d27cb4f030d4c6802cff61fffb88dee7752821e3d8a4cd1c34dc3745d9ff2f0da'
         '121df3804ab4f3356c726a1adfcea1aedfef73bf04cc91241c48fdc32cd53b8082df4919cefd14945090d8a2e9ae7ff397eb7735f9cd4f0a72feadefb303462c'
         'badc250bfc592408a14e321060f087e3c28f81c5b40f60468737267ad4cae85a3fff2842fc9a488fe884390b2f33d58525eeebca56499a612de4f05cea3dccc8'
         'bc385060c0b0cfee406d245c26bf7895be43db36160cf976c4def6416d7c06284a4d1eea0332fbe10e4065a1a3f1ca49ef3286a557e027fb953910a2aaa8359c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # https://bugzilla.gnome.org/show_bug.cgi?id=623965
  patch -Np1 -i "${srcdir}/python27.patch"
  # https://bugzilla.gnome.org/show_bug.cgi?id=660216
  patch -Np1 -i "${srcdir}/fix-leaks-of-pango-objects.patch"
  # fix build with new pango:
  # https://gitlab.gnome.org/Archive/pygtk/-/merge_requests/1
  patch -p1 -i ../4aaa48eb80c6802aec6d03e5695d2a0ff20e0fc2.patch
  # Python 2
  sed -i -e 's#env python$#env python2#' examples/pygtk-demo/{,demos/}*.py
  # No docs
  sed -i '/^SUBDIRS =/s/docs//' Makefile.in
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --disable-docs
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m644 gtk/gtk-extrafuncs.defs "${pkgdir}/usr/share/pygtk/2.0/defs/"
}