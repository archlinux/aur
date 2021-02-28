# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Maintainer: Eric Engestrom <aur@engestrom.ch>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Chad Versace <chad.versace@linux.intel.com>

pkgname=waffle
pkgver=1.6.3
pkgrel=3
pkgdesc='a library for choosing window system and OpenGL API at runtime'
arch=('x86_64')
url='http://www.waffle-gl.org'
license=('BSD')

depends=('libx11' 'libxcb' 'libudev.so' 'libgl' 'libgles')
optdepends=('libegl: for gbm, surfaceless, x11_egl or wayland support'
            'mesa: for gbm support'
            'wayland: for wayland support')

# XXX: systemd is a bit of a hack, in particular:
# The Arch packaging splits the libudev.so in one package, with the build
# aka headers/pkg-config in another.
makedepends=('meson' 'xcb-proto' 'mesa' 'libxslt' 'docbook-xsl' 'cmake' 'systemd')

source=(https://mesa.pages.freedesktop.org/waffle/files/release/waffle-${pkgver}/waffle-${pkgver}.tar.xz{,.asc})
sha256sums=('30e47bb78616e5deab1b94fd901c629a42b6ec3bf693c668217d4d5fd9b62219'
            'SKIP')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D')

build() {
  arch-meson "$pkgname-$pkgver" build \
    --buildtype release \
    -D gbm=enabled \
    -D glx=enabled \
    -D surfaceless_egl=enabled \
    -D x11_egl=enabled \
    -D wayland=enabled \
    -D build-manpages=true \
    -D build-htmldocs=true \
    -D build-examples=false

  meson configure build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$pkgdir/usr/share/doc/waffle1/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
