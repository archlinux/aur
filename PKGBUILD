# Maintainer : Ionut Biru <ibiru@archlinux.org>
_pkgbasename=pixman
pkgname=lib32-$_pkgbasename-git
pkgver=0.35.1.2348.489fa0d
pkgrel=1
pkgdesc="Pixman library (32-bit)"
arch=('x86_64')
url="http://xorg.freedesktop.org"
license=('custom')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('gcc-multilib')
provides=('lib32-pixman')
conflicts=('lib32-pixman')
source=("git://anongit.freedesktop.org/pixman")
sha1sums=('SKIP')

pkgver() {
  cd "pixman"

  for i in pixman_major pixman_minor pixman_micro; do
    local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  echo ${_pixman_major}.${_pixman_minor}.${_pixman_micro}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/pixman"
  ./autogen.sh --prefix=/usr --libdir=/usr/lib32 --disable-static
  make
}

package() {
  cd "${srcdir}/pixman"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
