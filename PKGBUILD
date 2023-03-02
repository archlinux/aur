# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Maintainer: Eric Engestrom <aur@engestrom.ch>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Chad Versace <chad.versace@linux.intel.com>

pkgname=waffle
pkgver=1.7.1
pkgrel=1
pkgdesc='a library for choosing window system and OpenGL API at runtime'
arch=('x86_64')
url='https://waffle.freedesktop.org'
license=('BSD')

depends=('libx11' 'libxcb' 'libudev.so')
optdepends=('libgl: for OpenGL or GLX support'
            'libgles: for GLES support'
            'libegl: for gbm, surfaceless, x11_egl or wayland support'
            'mesa: for gbm support'
            'wayland: for wayland support')

# XXX: systemd is a bit of a hack, in particular:
# The Arch packaging splits the libudev.so in one package, with the build
# aka headers/pkg-config in another.
makedepends=('meson' 'xcb-proto' 'mesa' 'libxslt' 'docbook-xsl' 'systemd' 'wayland-protocols')

source=(https://waffle.freedesktop.org/files/release/waffle-${pkgver}/waffle-${pkgver}.tar.xz{,.asc})
sha256sums=('9e6f392185d085e9aa7f1a0aef6642f843e80d17282b4382217a5b29ded9fdd9'
            'SKIP')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D')

build() {
  arch-meson "$pkgname-$pkgver" build \
    --buildtype release \
    -D build-manpages=true \
    -D build-htmldocs=true \
    -D build-examples=false

  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$pkgdir/usr/share/doc/waffle1/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
