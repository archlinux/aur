# Maintainer: Rafał Kozdrój <kozeid2@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_pkgname=lib32-libglvnd
pkgname=$_pkgname-git
pkgver=0.2.999.r548.fe4a384
pkgrel=1
pkgdesc="The GL Vendor-Neutral Dispatch library"
arch=('x86_64')
url="https://github.com/NVIDIA/libglvnd"
license=('custom:BSD-like')
makedepends=('lib32-libx11' 'lib32-libxext' 'glproto' 'git' 'python' 'gcc-multilib')
provides=('lib32-libgl' 'lib32-libegl' 'lib32-libgles' "$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/NVIDIA/libglvnd.git")
md5sums=('SKIP')

pkgver() {
  cd libglvnd
  # https://stackoverflow.com/a/7522914
  _pkgver=$(grep AC_INIT configure.ac | sed 's/[^0-9.]*\([0-9.]*\).*/\1/')
  printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd libglvnd
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib32/ --build=i686-unknown-linux-gnu
  make
}

package() {
  # lib32-libglvnd needs lib32-mesa for indirect rendering
  depends=('lib32-libxext' 'libglvnd-git' 'lib32-mesa' 'lib32-opengl-driver')
  cd libglvnd
  make DESTDIR="${pkgdir}" install

  rm -r "$pkgdir/usr/include"

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s libglvnd-git "$pkgdir/usr/share/licenses/$pkgname"
}
