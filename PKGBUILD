# Maintainer: Lone_Wolf <lonewolf@xs4all.nl>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=lib32-libglvnd12
pkgver=1.2.0
pkgrel=1
pkgdesc="The GL Vendor-Neutral Dispatch library"
arch=('x86_64')
url="https://github.com/NVIDIA/libglvnd"
license=('custom:BSD-like')
makedepends=('lib32-libx11' 'lib32-libxext' 'glproto' 'python')
provides=('lib32-libgl' 'lib32-libegl' 'lib32-libgles' 'lib32-libglvnd')
conflicts=('lib32-libglvnd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NVIDIA/libglvnd/archive/v$pkgver.tar.gz")
sha512sums=('0e0e9c3f303739c73f5bee4c2aaef9eff56440345f2f1ce285ee98eb94c1e5e740774dd501aeeed1299aa25a449d813a850e95282999a3ca4648d2381d6c8fa6')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd libglvnd-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr \
    --libdir=/usr/lib32/ \
    --build=i686-unknown-linux-gnu \
    --disable-headers
  make
}

package() {
  # lib32-libglvnd needs lib32-mesa for indirect rendering
  depends=('lib32-libxext' 'libglvnd' 'lib32-mesa-git' 'lib32-opengl-driver')

  cd libglvnd-$pkgver
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/include

  mkdir -p "$pkgdir"/usr/share/licenses
  ln -s libglvnd "$pkgdir"/usr/share/licenses/$pkgname
}
