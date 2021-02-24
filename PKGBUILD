# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Maintainer: Eric Engestrom <aur@engestrom.ch>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Chad Versace <chad.versace@linux.intel.com>

pkgname=waffle
pkgver=1.6.2
pkgrel=5
pkgdesc='a library for choosing window system and OpenGL API at runtime'
arch=('x86_64')
url='http://www.waffle-gl.org'
license=('BSD')

depends=('libx11' 'libxcb' 'libudev.so' 'libgl' 'libgles')
optdepends=('libegl: for gbm, surfaceless, x11_egl or wayland support'
            'libgbm.so: for gbm support'
            'wayland: for wayland support')
makedepends=('meson' 'xcb-proto' 'mesa' 'libxslt' 'docbook-xsl' 'cmake')

source=(https://mesa.pages.freedesktop.org/waffle/files/release/waffle-${pkgver}/waffle-${pkgver}.tar.xz{,.asc})
sha256sums=('41ff9e042497e482c7294e210ebd9962e937631829a548e5811c637337cec5a5'
            'SKIP')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D')

build() {
  arch-meson "$pkgname-$pkgver" build \
    -D gbm=enabled \
    -D glx=enabled \
    -D surfaceless_egl=enabled \
    -D x11_egl=enabled \
    -D wayland=enabled \
    -D build-manpages=true \
    -D build-htmldocs=true \
    -D build-examples=false

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$pkgdir/usr/share/doc/waffle1/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
