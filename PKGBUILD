# Maintainer: Chocobo1

pkgname=libtorrent-rasterbar-1_0-git
pkgver=1.0.10.r7.geec6957
pkgrel=1
pkgdesc='A C++ BitTorrent library that aims to be a good alternative to all the other implementations around (git branch RC_1_0)'
url='http://www.libtorrent.org/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('boost-libs')
makedepends=('boost' 'python2' 'python')
provides=('libtorrent-rasterbar')
conflicts=('libtorrent-rasterbar')
source=('git+https://github.com/arvidn/libtorrent.git#branch=RC_1_0'
         Fix_out_of_srcdir_build.patch)
sha256sums=('SKIP'
            'e4dfe4363eb5f196363d3b477377046d6241c7e8277d475dc8f74ef612d77850')


pkgver() {
    cd "libtorrent"

    git describe --long --tags | sed 's/^[A-Za-z]*-//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

prepare() {
  mkdir -p py2 py3
  cd "libtorrent"

  patch -p1 -i ../Fix_out_of_srcdir_build.patch
  ./autotool.sh
}

_build() (
  cd "py$1"

  # https://bugs.archlinux.org/task/50745
  _boost="boost_python"
  if [ $1 = "3" ]; then _boost="boost_python3"; fi

  # https://github.com/qbittorrent/qBittorrent/issues/5265#issuecomment-220007436
  CXXFLAGS="$CXXFLAGS -std=c++11" \
  PYTHON="/usr/bin/python$1" \
  ../libtorrent/configure \
    --prefix=/usr \
    --enable-python-binding \
    --disable-static \
    --with-libiconv \
    --with-boost-python="$_boost"

  make
)

build() {
  _build 2
  _build 3
}

package() {
  make -C py2 DESTDIR="$pkgdir" install
  make -C py3 DESTDIR="$pkgdir" install
  install -Dm644 "libtorrent/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
