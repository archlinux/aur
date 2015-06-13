# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: John McKnight <jmcknight@gmail.com>

pkgname=monkey-bubble
pkgver=0.4.0
pkgrel=2
pkgdesc="A Puzzle Bobble clone for one or two players"
arch=('i686' 'x86_64')
url="http://www.happypenguin.org/show?Monkey%20Bubble"
license=('GPL')
depends=('esound' 'gstreamer0.10' 'libgnomeui' 'librsvg')
makedepends=('gnome-doc-utils' 'perl-xml-parser')
source=("http://home.gna.org/monkeybubble/downloads/${pkgname}-${pkgver}.tar.gz"
        "desktop-fixes.patch"
        "fix-xml.patch")
md5sums=('0de8a05c8c15e08326d244534dc30f22'
         '7c747f07e295e2c20313e920180710f0'
         'ead203bdc023d3ff69e4355064a2cbea')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Apply Ubuntu patches
  patch -Np1 -i ../desktop-fixes.patch
  patch -Np1 -i ../fix-xml.patch

  # Fix compilation error
  sed -i "s_glib/gthread.h_glib.h_" \
    src/net/message-handler.c \
    src/net/simple-server.c \
    src/ui/main.c

  # Compile
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-schemas-install \
              --disable-scrollkeeper
  make LDFLAGS="-lm" \
       CFLAGS="-Wno-error=deprecated-declarations -Wno-error=unused-but-set-variable"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
