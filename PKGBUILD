
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: John McKnight <jmcknight@gmail.com>

pkgname=monkey-bubble
pkgver=0.4.0
pkgrel=3
pkgdesc="A Puzzle Bobble clone for one or two players"
arch=('i686' 'x86_64')
url="http://www.happypenguin.org/show?Monkey%20Bubble"
license=('GPL')
depends=('esound' 'gstreamer0.10' 'libgnomeui' 'librsvg')
makedepends=('gnome-doc-utils' 'perl-xml-parser')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/m/$pkgname/${pkgname}_$pkgver.orig.tar.gz"
        "desktop-fixes.patch"
        "fix-xml.patch")
sha256sums=('eb96293a0fadbbfc3cd3ae0bbb557d9bf8a4dd8edccdd8ce1b913e8ba49a1c89'
            '039a57e7b70f457e80cb8084e8b1c972c491b02d47ab68ab5477ee01ef8ca482'
            '5c133152fda6446d7fd1d8b6b530056226c72b81c4aa72fe69e43939b622dd20')

prepare() {
  cd $pkgname-$pkgver

  # Apply Ubuntu patches
  patch -Np1 -i ../desktop-fixes.patch
  patch -Np1 -i ../fix-xml.patch

  # Fix compilation error
  sed "s|glib/gthread.h|glib.h|" \
    -i src/net/message-handler.c src/net/simple-server.c src/ui/main.c
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc \
    --disable-schemas-install --disable-scrollkeeper
  make LDFLAGS="-lm" \
       CFLAGS="-Wno-error=deprecated-declarations -Wno-error=unused-but-set-variable"
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
