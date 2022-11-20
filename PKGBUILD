# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Maintainer: Eric Engestrom <aur@engestrom.ch>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Chad Versace <chad.versace@linux.intel.com>

pkgname=waffle
pkgver=1.7.0
pkgrel=3
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
makedepends=('meson' 'xcb-proto' 'mesa' 'libxslt' 'docbook-xsl' 'cmake' 'systemd' 'wayland-protocols')

source=(https://mesa.pages.freedesktop.org/waffle/files/release/waffle-${pkgver}/waffle-${pkgver}.tar.xz{,.asc})
sha256sums=('69e42d15d08f63e7a54a8b8770295a6eb04dfd1c6f86c328b6039dbe7de28ef3'
	    '7a7e064395551ce20a694be7ecb4795effc3fd6f614943e50445469631677f6e')
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
