# Maintainer: Kozeid <kozeid2@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_pkgname=libglvnd
pkgname=$_pkgname-git
pkgver=0.2.999.r538.3ed1275
pkgrel=1
pkgdesc="The GL Vendor-Neutral Dispatch library"
arch=('i686' 'x86_64')
url="https://github.com/NVIDIA/libglvnd"
license=('custom:BSD-like')
makedepends=('libxext' 'libx11' 'glproto' 'git' 'python')
provides=('libgl' 'libegl' 'libgles' "$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/NVIDIA/libglvnd.git"
        LICENSE)
sha256sums=('SKIP'
            '1a99f7487849c41fc3520e0af3dfcf28a0df05e78956d9ec58c2c52b1f20a77d')

pkgver() {
  cd $_pkgname
  # https://stackoverflow.com/a/7522914
  _pkgver=$(grep AC_INIT configure.ac | sed 's/[^0-9.]*\([0-9.]*\).*/\1/')
  printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  # libglvnd needs mesa for indirect rendering
  depends=('libxext' 'mesa' 'opengl-driver')
  cd $_pkgname
  make DESTDIR="${pkgdir}" install

  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
