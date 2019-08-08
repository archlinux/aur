# Maintainer  : Vincent Grande <shoober420@gmail.com>
# Contributor : Ionut Biru <ibiru@archlinux.org>

_pkgbasename=pixman
pkgname=lib32-$_pkgbasename-git
pkgver=pixman+0.38.4+11+gfd5c0da
pkgrel=1
pkgdesc="Pixman library (32-bit)"
arch=('x86_64')
url="https://xorg.freedesktop.org"
license=('custom')
provides=(lib32-pixman)
conflicts=(lib32-pixman)
depends=('lib32-glibc' $_pkgbasename)
makedepends=('gcc-multilib')
source=(git+https://gitlab.freedesktop.org/pixman/pixman.git)
sha1sums=('SKIP')



pkgver() {
     cd pixman
     git describe --tags | sed 's/-/+/g'
}

prepare() {
   cd pixman
   NOCONFIGURE=1 ./autogen.sh
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}"
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
