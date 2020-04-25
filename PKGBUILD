# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Salamandar <felix@piedallu.me>

pkgname=livewallpaper
pkgver=0.5.0.333
pkgrel=3
pkgdesc='Animated 3D wallpapers'
url='https://launchpad.net/livewallpaper'
license=(GPL3)
arch=(x86_64)
depends=(glew libpeas python-cairo python-gobject python-opengl python-pillow upower)
makedepends=(bzr cmake gobject-introspection intltool ninja vala xcftools)
source=("$pkgname::bzr+$url/trunk#revision=${pkgver##*.}")
sha256sums=('SKIP')

prepare() {
  sed -i '/debian/d' $pkgname/CMakeLists.txt
  sed -i "s/--quiet/--quiet --cflags-begin $CFLAGS --cflags-end/g" \
    $pkgname/$pkgname-core/CMakeLists.txt
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="$CFLAGS -O2 -fPIC -w" \
    -DENABLE_OPTIMIZATION=on \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# getver: launchpad.net/livewallpaper/+download
# vim: ts=2 sw=2 et:
