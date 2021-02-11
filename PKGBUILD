# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Maintainer: Eric Engestrom <aur@engestrom.ch>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Chad Versace <chad.versace@linux.intel.com>

pkgname=waffle
pkgver=1.6.2
pkgrel=1
pkgdesc='a library for choosing window system and OpenGL API at runtime'
arch=('x86_64')
url='http://www.waffle-gl.org'
license=('BSD')

depends=('libx11' 'libxcb' 'wayland')
makedepends=('cmake' 'xcb-proto' 'mesa-libgl' 'mesa' 'libxslt' 'docbook-xsl')

source=(https://mesa.pages.freedesktop.org/waffle/files/release/waffle-${pkgver}/waffle-${pkgver}.tar.xz{,.asc})
sha256sums=('41ff9e042497e482c7294e210ebd9962e937631829a548e5811c637337cec5a5'
            'SKIP')

prepare() {
  if [ -d build ]
  then
    msg2 "Build dir already exist; performing an incremental build"
    msg2 "If you want to perform a clean build, please delete $(realpath build)"
    return
  fi

  cmake \
    -G Ninja \
    -S "$pkgname-$pkgver" -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    -Dwaffle_has_gbm=1 \
    -Dwaffle_has_glx=1 \
    -Dwaffle_has_x11_egl=1 \
    -Dwaffle_has_wayland=1 \
    -Dwaffle_build_manpages=1 \
    -Dwaffle_build_htmldocs=1 \
    -Dwaffle_build_examples=0
}

build() {
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$pkgdir/usr/share/doc/waffle1/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
