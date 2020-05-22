# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=taoframework
pkgver=2.1.0
pkgrel=4
pkgdesc="A collection of bindings to facilitate cross-platform game-related development utilizing the .NET platform"
arch=('any')
url="http://sourceforge.net/projects/taoframework/"
license=('MIT')
depends=('mono')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('5d771f73036e94472c5939b3db78c2bf1f97ed3dc07600a467ecb2e2b96606e2')

prepare() {
  cd $pkgname-$pkgver/source
  sed -i 's/for v in 11 10 9 8 7 6 5; do/for v in 16 15 14 13 12 11 10 9 8 7 6 5; do/' bootstrap
  sed -i 's/AC_PATH_PROG(CSC, gmcs, no)/AC_PATH_PROG(CSC, dmcs, no)/' configure.ac
  sed -i 's|monodocer --assembly:$$x/$$x.dll --path:doc/$$x;|monodocer -assembly:$$x/$$x.dll -path:doc/$$x;|' src/Makefile.am
  sed -i 's/SUBDIRS = src tests examples/SUBDIRS = src examples/' Makefile.am

  sed -i 's|libavcodec.so.1d|libavcodec.so.53|
          s|libavformat.so.1d|libavformat.so.53|
          s|libavutil.so.1d|libavutil.so.51|' src/Tao.FFmpeg/Tao.FFmpeg.dll.config
  sed -i 's|liblua5.1.so.0|liblua.so.5.1|' src/Tao.Lua/Tao.Lua.dll.config
  sed -i 's|libode.so.0debian1|libode.so.4|' src/Tao.Ode/Tao.Ode.dll.config
  sed -i 's|libopenal.so.0|libopenal.so.1|' src/Tao.OpenAl/Tao.OpenAl.dll.config
  sed -i 's|libphysfs-1.0.so.0|libphysfs.so.1|' src/Tao.PhysFs/Tao.PhysFs.dll.config
  sed -i 's|libSDL_gfx.so.4|libSDL_gfx.so.15|' src/Tao.Sdl/Tao.Sdl.dll.config
  chmod 755 ./bootstrap
}

build() {
  cd $pkgname-$pkgver/source
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $pkgname-$pkgver/source
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
