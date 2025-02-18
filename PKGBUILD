# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: orumin <dev at orum dot in>

_basename=check
pkgname="lib32-$_basename"
pkgver=0.15.2
pkgrel=5
pkgdesc="A unit testing framework for C (32-bit)"
arch=('x86_64')
url="https://libcheck.github.io/check/"
license=('LGPL-2.1-or-later')
depends=('lib32-glibc' "${_basename}" 'lib32-gcc-libs')
makedepends=('git' 'gcc-multilib' 'lib32-gcc-libs' 'cmake' 'ninja')
_commit=11970a7e112dfe243a2e68773f014687df2900e8  # tags/0.15.2
source=("git+https://github.com/libcheck/check#commit=$_commit")
sha512sums=('24d2f93cf92f04c1c3bbd4a60c5f0ad355808f5c0535eb5668f5fe857bce0069690a6c12f37f04ca22f3ba7a4d148bc02195d03f59c24b1a50f54d8bbe3b2cd7')

pkgver() {
  cd $_basename
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "$srcdir"

  export CFLAGS+=' -m32'
  export CXXFLAGS+=' -m32'
  export LDFLAGS+=' -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake -B build -S "$_basename" \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_INSTALL_LIBDIR=lib32 \
  -GNinja \
  -DCMAKE_BUILD_TYPE=None

  cmake --build build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
  rm -rf "${pkgdir}"/usr/{bin,share,include}

  sed -i 's/libdir=${exec_prefix}\/lib/libdir=${exec_prefix}\/lib32/g' "$pkgdir/usr/lib32/pkgconfig/check.pc"
}
