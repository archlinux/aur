# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: TryA <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libproxy
pkgver=0.4.18
pkgrel=1
pkgdesc="Automatic proxy configuration management library (32-bit)"
url="https://libproxy.github.io/libproxy/"
arch=(x86_64)
license=(LGPL)
depends=(
  lib32-dbus
  lib32-gcc-libs
  lib32-glib2
  lib32-zlib
  libproxy
)
makedepends=(
  cmake
  git
  ninja
)
_commit=caccaf28e3df6ea612d2d4b39f781c4324019fdb  # tags/0.4.18
source=("git+https://github.com/libproxy/libproxy#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd libproxy
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd libproxy

  # Fix building without duktape
  git cherry-pick -n c9b1f19c486b6ec590441b9c46965ab961d2677d
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake -S libproxy -B build -G Ninja \
    -DBIPR=1 \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DLIBEXEC_INSTALL_DIR=/usr/lib \
    -DLIB_SUFFIX=32 \
    -DWITH_{DUKTAPE,PERL,WEBKIT}=OFF
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/{bin,include,lib,share}
}

# vim:set sw=2 sts=-1 et:
