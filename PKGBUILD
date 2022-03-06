# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: TryA <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libproxy
pkgver=0.4.17
pkgrel=2
pkgdesc='A library that provides automatic proxy configuration management'
arch=(x86_64)
url=https://libproxy.github.io/libproxy/
license=(LGPL)
depends=(
  lib32-dbus
  lib32-gcc-libs
  lib32-zlib
  libproxy
)
makedepends=(
  cmake
  git
  ninja
)
_tag=e78a5ccfe0a2340f2c73e419767f8492ffc2787a
source=(git+https://github.com/libproxy/libproxy.git#tag=${_tag})
b2sums=(SKIP)

pkgver() {
  cd libproxy

  git describe --tags
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  cmake -S libproxy -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    -DCMAKE_SKIP_RPATH=ON \
    -DLIB_SUFFIX=32 \
    -DWITH_{DOTNET,GNOME3,KDE,MOZJS,NM,PERL,VALA,WEBKIT,WEBKIT3}=OFF
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
