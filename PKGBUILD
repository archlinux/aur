# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Clayton Craft <clayton@craftyguy.net>

pkgname=waffle-git
pkgver=v1.8.0.r71.g84e7012
pkgrel=1
pkgdesc='a library for choosing window system and OpenGL API at runtime (git version)'
arch=('x86_64' 'aarch64')
url='https://waffle.freedesktop.org'
provides=('waffle')
conflicts=('waffle')
license=('BSD-2-Clause')

depends=('libx11' 'libxcb')
optdepends=('libgl: for OpenGL or GLX support'
            'libgles: for GLES support'
            'libegl: for gbm, surfaceless, x11_egl or wayland support'
            'mesa: for gbm support'
            'libdrm: for gbm support'
            'wayland: for wayland support')

makedepends=('git' 'meson' 'xcb-proto' 'mesa' 'libxslt' 'docbook-xsl' 'libdrm' 'wayland-protocols')

source=('git+https://gitlab.freedesktop.org/mesa/waffle.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local meson_args=(
    --buildtype release
    -D build-manpages=true
    -D build-htmldocs=true
    -D build-examples=false
  )

  arch-meson "${pkgname%-git}" build "${meson_args[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$pkgdir/usr/share/doc/waffle1/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
