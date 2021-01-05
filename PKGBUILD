# Maintainer:  Vincent Grande <shoober420@gmail.com
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Travis Willard <travis@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

_pkgbasename=libpng
pkgname=lib32-$_pkgbasename-minimal-git
pkgver=1.6.37
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics files (32-bit)"
arch=('x86_64')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=('lib32-zlib' $_pkgbasename)
makedepends=(gcc-multilib)
provides=(lib32-libpng)
conflicts=(lib32-libpng)
source=("git+https://git.code.sf.net/p/libpng/code")
sha256sums=('SKIP')

pkgver() {
  cd "code"

  git describe --long --tags | sed 's/^libpng-//;s/master-//;s/signed-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd code

  autoreconf -fi
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --program-suffix=-32 \
    --enable-hardware-optimizations \
    --enable-intel-sse \
    --disable-static
  make
}

package() {
  cd code

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  rm "$pkgdir/usr/bin/libpng-config"
  ln -s "libpng-config-32" "$pkgdir/usr/bin/libpng-config-32"

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
