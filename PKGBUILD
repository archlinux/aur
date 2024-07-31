# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Contributor: Eric Engestrom <aur@engestrom.ch>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Lina Versace <lina@kiwitree.net>

pkgname=waffle
pkgver=1.8.1
pkgrel=1
pkgdesc='a library for choosing window system and OpenGL API at runtime'
arch=('x86_64')
url='https://waffle.freedesktop.org'
license=('BSD-2-Clause')

depends=('libx11' 'libxcb')
optdepends=('libgl: for OpenGL or GLX support'
            'libgles: for GLES support'
            'libegl: for gbm, surfaceless, x11_egl or wayland support'
            'mesa: for gbm support'
            'libdrm: for gbm support'
            'wayland: for wayland support')

makedepends=('meson' 'xcb-proto' 'mesa' 'libxslt' 'docbook-xsl' 'wayland-protocols')

source=(https://waffle.freedesktop.org/files/release/waffle-${pkgver}/waffle-${pkgver}.tar.xz{,.asc})
sha256sums=('f616c0ca6072d36bf81fb79a3695799973a978775e0213744bf0a39be6367425'
            'SKIP')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D')

build() {
  local meson_args=(
    --buildtype release
    -D build-manpages=true
    -D build-htmldocs=true
    -D build-examples=false
  )

  arch-meson "$pkgname-$pkgver" build "${meson_args[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$pkgdir/usr/share/doc/waffle1/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
