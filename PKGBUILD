# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_basename=egl-wayland
pkgname="lib32-$_basename"
pkgver=1.1.4
pkgrel=2
pkgdesc="EGLStream-based Wayland external platform (32-bit)"
arch=(x86_64)
url=https://github.com/NVIDIA/egl-wayland
license=(MIT)
depends=('lib32-wayland' 'eglexternalplatform' "$_basename")
makedepends=('meson' 'git')
options=(!emptydirs)
_commit=47d96a84b04d21cd0a2f23b59a4936c829a65364  # tags/1.1.4
source=("git+$url#commit=$_commit"
        glvnd.diff)
sha256sums=('SKIP'
            'e6d965551829448ffc2ea0fdf97d7d44c3d35be0b56fc025e6cc343f29f7b9d6')

pkgver() {
  cd $_basename
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_basename

  # Fix build with headers from libglvnd
  git apply -3 ../glvnd.diff
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  arch-meson ${_basename} build --libdir=/usr/lib32
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  rm -rf "$pkgdir"/usr/{include,share,bin}
}
