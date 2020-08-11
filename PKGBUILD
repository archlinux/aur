# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=(glfw2to3-git lib32-glfw2to3-git)
pkgver=2.7.10
pkgrel=1
pkgdesc="Porting library to make GLFW 2.x games run on top of GLFW 3.x"
arch=('x86_64')
url="https://www.glfw.org/"
license=('ZLIB')
makedepends=('git' 'meson' 'meson-cross-x86-linux-gnu')
source=("git+https://github.com/linkmauve/glfw2to3")
sha256sums=('SKIP')

prepare() {
  cd glfw2to3
}

build() {
  cd glfw2to3
  arch-meson build-x86_64
  arch-meson build-i686 --cross-file /usr/share/meson/cross/x86-linux-gnu
  ninja -C build-x86_64
  ninja -C build-i686
}

package_glfw2to3-git() {
  depends=('glfw')
  provides=('glfw2to3' 'glfw2=2.7.10')
  conflicts=('glfw2to3' 'glfw2')

  cd glfw2to3
  DESTDIR="$pkgdir"/ ninja -C build-x86_64 install

  # This would conflict with glfw3.
  rm "$pkgdir"/usr/lib/libglfw.so
}

package_lib32-glfw2to3-git() {
  depends=('lib32-glfw' 'glfw2to3')
  provides=('lib32-glfw2to3' 'lib32-glfw2=2.7.10')
  conflicts=('lib32-glfw2to3' 'lib32-glfw2')

  cd glfw2to3
  DESTDIR="$pkgdir"/ ninja -C build-i686 install

  # This would conflict with glfw3.
  rm "$pkgdir"/usr/lib32/libglfw.so

  # This would conflict with the x86_64 version.
  rm "$pkgdir"/usr/include/GL/glfw.h
}
