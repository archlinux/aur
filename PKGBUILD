# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Ross Eldridge <ptepid@ptepid.org>
pkgname=crashtest
pkgver=1.1
pkgrel=5
pkgdesc="Educational car crash simulation"
arch=(x86_64)
url="https://stolk.org/crashtest/"
license=(GPL-1.0-or-later)
depends=(fltk glibc glu libgcc libglvnd libstdc++ ode)
makedepends=(plib)
source=("https://stolk.org/$pkgname/$pkgname-$pkgver.tar.gz"
        fltk-1.4-x11.patch)
sha256sums=('55c5ce29857263ceebc1c3f42c153f275dfc47711e9248395fd4398d6ef52ab9'
            '149a7f01bb3699e88798fb39fb1eae28c84dbcc0b783500dc20b44709a774e0a')

prepare() {
  cd "$pkgname-$pkgver"
  # force X11 backend, plib needs GLX (fixes crash on Wayland)
  patch -Np1 -i ../fltk-1.4-x11.patch
  # remove stale objects left over from previous builds in $srcdir
  make -C src-crashtest clean
}

build() {
  cd "$pkgname-$pkgver/src-crashtest"
  # use system flags, add cairo include path needed by fltk 1.4 headers and link against shared libode instead of the static archive
  make \
    CXX="${CXX:-g++}" \
    CXXFLAGS="$CXXFLAGS $(pkg-config --cflags cairo) -I../src-common" \
    LFLAGS="$LDFLAGS" \
    LIBS="-lode -lplibssgaux -lplibssg -lplibsg -lplibpu -lplibfnt -lplibul -lGLU -lGL $(fltk-config --use-gl --ldflags)"
}

package() {
  cd "$pkgname-$pkgver/src-crashtest"
  make DESTDIR="$pkgdir" install
  install -Dm755 "$pkgdir/usr/games/crashtest" "$pkgdir/usr/bin/crashtest"
  rm -r "$pkgdir/usr/games"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
