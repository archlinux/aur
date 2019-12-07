# Maintainer: Rafał Kozdrój <kozeid2@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_pkgname=lib32-libglvnd
pkgname=$_pkgname-git
pkgver=1.3.0.r6.gf455878
pkgrel=1
pkgdesc="The GL Vendor-Neutral Dispatch library"
arch=('x86_64')
url="https://github.com/NVIDIA/libglvnd"
license=('custom:BSD-like')
makedepends=('lib32-libx11' 'lib32-libxext' 'glproto' 'python' 'meson' 'git')
provides=('lib32-libgl' 'lib32-libegl' 'lib32-libgles' "$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/NVIDIA/libglvnd.git")
sha512sums=('SKIP')

pkgver() {
  cd libglvnd
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  arch-meson libglvnd build \
    --libdir=/usr/lib32 \
    -D headers=false \
    -D gles1=false

    ninja -C build
}

package() {
  # lib32-libglvnd needs lib32-mesa for indirect rendering
  depends=('lib32-libxext' 'libglvnd-git' 'lib32-mesa' 'lib32-opengl-driver')

  DESTDIR="$pkgdir" ninja -C build install

  rm -r "$pkgdir"/usr/include

  mkdir -p "$pkgdir"/usr/share/licenses
  ln -s libglvnd-git "$pkgdir"/usr/share/licenses/$pkgname
}
