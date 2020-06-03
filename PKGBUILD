# Maintainer: Eric Engestrom <aur@engestrom.ch>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Chad Versace <chad.versace@linux.intel.com>
# Contributor: Emil Velikov <emil.l.velikov@gmail.com>

pkgname=waffle
pkgver=1.6.1
pkgrel=1
pkgdesc='a library for choosing window system and OpenGL API at runtime'
arch=('x86_64')
url='http://www.waffle-gl.org'
license=('BSD')

depends=('libx11' 'libxcb' 'wayland')
makedepends=('cmake' 'xcb-proto' 'mesa-libgl' 'mesa' 'libxslt' 'docbook-xsl')

source=("https://gitlab.freedesktop.org/mesa/waffle/-/archive/v$pkgver/waffle-v$pkgver.tar.gz")
sha256sums=('4eb4dfe18b5a88e6ea2b6b0a0c415caeaa453ea8eb37a757c100e24e18c317dd')

prepare() {
  if [ -d build ]
  then
    msg2 "Build dir already exist; performing an incremental build"
    msg2 "If you want to perform a clean build, please delete $(realpath build)"
    return
  fi

  cmake \
    -G Ninja \
    -S "$pkgname-v$pkgver" -B build \
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
