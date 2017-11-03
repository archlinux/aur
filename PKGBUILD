# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=cegui-0.7
pkgver=0.7.9
pkgrel=5
pkgdesc="A free library providing windowing and widgets for graphics APIs/engines (legacy version)"
arch=('i686' 'x86_64')
url="http://cegui.org.uk"
license=("MIT")
depends=('glew' 'freetype2' 'libxml2' 'devil' 'freeglut' 'lua51' 'silly' 'mesa' 'glm' 'glfw' 'freeimage')
makedepends=('python2' 'doxygen' 'gtk2' 'boost' 'graphviz')
optdepends=("python2: python bindings"
            "boost-libs: renderer with python2"
            "gtk2: gtk2 module")
conflicts=('cegui')
source=("http://downloads.sourceforge.net/crayzedsgui/CEGUI-$pkgver.tar.gz"
        "$pkgname-compilation-fix.diff")
sha256sums=('7c3b264def08b46de749c2acaba363e907479d924612436f3bd09da2e474bb8c'
            '95b747470a2419bc9d0df7ade7d45ef0acb694609172d3b4110c1836b256ca39')

prepare() {
  patch -Np0 < $pkgname-compilation-fix.diff
}

build() {
  cd CEGUI-$pkgver

  ./bootstrap
  Lua_CFLAGS="$(pkg-config --cflags lua51)" \
  Lua_LIBS="$(pkg-config --libs lua51)" \
  PYTHON="/usr/bin/python2" ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-null-renderer --with-gtk2 --disable-samples \
    --disable-ogre-renderer --disable-irrlicht-renderer
  make
}

package() {
  cd CEGUI-$pkgver

  make DESTDIR="$pkgdir/" install

  install -Dm644 doc/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
