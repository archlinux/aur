# Maintainer : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor (ib-bundle): bohoomil <@zoho.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-infinality
_name=cairo
_commit=36b60ecefe1fd0e042cad51105b0ffb29315e577
pkgver=1.14.6
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
provides=("cairo=${pkgver}" 'cairo-ubuntu' 'cairo-xcb')
replaces=('cairo-xcb')
conflicts=('cairo' 'cairo-cleartype' 'cairo-git' 'cairo-gl-git' 'cairo-glitz'
           'cairo-ocaml-git' 'cairo-small' 'cairo-ubuntu')
source=("http://cairographics.org/releases/cairo-${pkgver}.tar.xz"
        "https://raw.githubusercontent.com/bohoomil/fontconfig-ultimate/${_commit}/cairo/cairo-make-lcdfilter-default.patch"
        "https://raw.githubusercontent.com/bohoomil/fontconfig-ultimate/${_commit}/cairo/cairo-respect-fontconfig_pb.patch"
        "https://raw.githubusercontent.com/bohoomil/fontconfig-ultimate/${_commit}/cairo/cairo-server-side-gradients.patch"
        "https://raw.githubusercontent.com/bohoomil/fontconfig-ultimate/${_commit}/cairo/cairo-webkit-html5-fix.patch")
sha1sums=('0a59324e6cbe031b5b898ff8b9e2ffceb9d114f5'
          'b0cc2466cc5479f055ca2148cfa37fe13a1e78a6'
          'd8ffcb4c4745f7e61671109362a80a872ac989d3'
          '72ecf2dda8462e1588512de257ccbe18642d507f'
          '5bff494f52a16114f4cf6d04bfb0b9d7c4e9da23')

prepare(){
  cd "${_name}-${pkgver}"

  patches=('cairo-make-lcdfilter-default.patch'
           'cairo-respect-fontconfig_pb.patch'
           'cairo-server-side-gradients.patch'
           'cairo-webkit-html5-fix.patch')

  for patch in "${patches[@]}"; do
    patch -Np1 -i "${srcdir}/${patch}"
  done
}

build() {
  cd "${_name}-${pkgver}"

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
  cd "${_name}-${pkgver}"
  #make -j1 -k test || /bin/true

  # results:
  # 1.12.8-1   # 162 Passed, 328 Failed [  8 crashed, 10 expected], 26 Skipped
  # 1.12.12-2: #  29 Passed, 464 Failed [460 crashed,  2 expected], 26 Skipped
  # 1.12.16-1: # 144 Passed, 364 Failed [  6 crashed, 12 expected], 27 Skipped
}

package() {
  cd "${_name}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
