# Maintainer (ib-bundle): bohoomil <@zoho.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-infinality
_name=cairo
pkgver=1.14.4
pkgrel=1
pkgdesc="Cairo vector graphics library"
arch=('armv7h' 'i686' 'x86_64')
license=('LGPL' 'MPL')
changelog=CHANGELOG
url="http://cairographics.org/"
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0'
         'glib2' 'mesa' 'libgl' 'lzo')
makedepends=('mesa-libgl' 'librsvg' 'gtk2' 'poppler-glib' 'libspectre'
             'gtk-doc' 'valgrind' 'git')
             # for the test suite:
             #'ttf-dejavu' 'gsfonts' 'xorg-server-xvfb' ) # 'libdrm')
#optdepends=('xcb-util: for XCB backend') # really needed?
groups=('infinality-bundle')
provides=("cairo=$pkgver" 'cairo-ubuntu' 'cairo-xcb')
replaces=('cairo-xcb')
conflicts=('cairo' 'cairo-cleartype' 'cairo-git' 'cairo-gl-git' 'cairo-glitz'
           'cairo-ocaml-git' 'cairo-small' 'cairo-ubuntu')
source=(http://cairographics.org/releases/cairo-$pkgver.tar.xz
        cairo-respect-fontconfig_pb.patch
        cairo-server-side-gradients.patch
        cairo-webkit-html5-fix.patch)
sha1sums=('5b44471e7c328f96de6830baf8ea65030de797f9'
          'd8ffcb4c4745f7e61671109362a80a872ac989d3'
          '72ecf2dda8462e1588512de257ccbe18642d507f'
          '5bff494f52a16114f4cf6d04bfb0b9d7c4e9da23')

prepare(){
  cd $_name-$pkgver

  patch -Np1 -i "${srcdir}"/cairo-respect-fontconfig_pb.patch
  patch -Np1 -i "${srcdir}"/cairo-server-side-gradients.patch
  patch -Np1 -i "${srcdir}"/cairo-webkit-html5-fix.patch
}

build() {
  cd $_name-$pkgver

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --disable-lto \
    --enable-tee \
    --enable-gl \
    --enable-egl \
    --enable-svg \
    --enable-ps \
    --enable-pdf \
    --enable-gobject \
    --enable-gtk-doc

    #--disable-xlib-xcb \
    #--enable-test-surfaces \ takes ages
    #--enable-drm # breaks build

  make
}

check() {
  cd $_name-$pkgver
  #make -j1 -k test || /bin/true

  # results:
  # 1.12.8-1   # 162 Passed, 328 Failed [  8 crashed, 10 expected], 26 Skipped
  # 1.12.12-2: #  29 Passed, 464 Failed [460 crashed,  2 expected], 26 Skipped
  # 1.12.16-1: # 144 Passed, 364 Failed [  6 crashed, 12 expected], 27 Skipped
}

package() {
  cd $_name-$pkgver
  make DESTDIR="$pkgdir" install
}
