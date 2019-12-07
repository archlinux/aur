# Maintainer: Rafał Kozdrój <kozeid2@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_pkgname=libglvnd
pkgname=$_pkgname-git
pkgver=1.3.0.r6.gf455878
pkgrel=1
pkgdesc="The GL Vendor-Neutral Dispatch library"
arch=('x86_64')
url="https://github.com/NVIDIA/libglvnd"
license=('custom:BSD-like')
makedepends=('libxext' 'libx11' 'glproto' 'python' 'meson' 'git')
provides=('libgl' 'libegl' 'libgles' "$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/NVIDIA/libglvnd.git"
        LICENSE)
sha512sums=('SKIP'
            'bf0f4a7e04220a407400f89226ecc1f798cc43035f2538cc8860e5088e1f84140baf0d4b0b28f66e4b802d4d6925769a1297c24e1ba39c1c093902b2931781a5')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $_pkgname build \
     -D gles1=false

  ninja -C build
}

package() {
  # libglvnd needs mesa for indirect rendering
  depends=('libxext' 'mesa' 'opengl-driver')

  DESTDIR="$pkgdir" ninja -C build install
  
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
