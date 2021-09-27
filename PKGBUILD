# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Clayton Craft <clayton@craftyguy.net>

pkgname=waffle-git
pkgver=v1.7.0.r26.g0a1fb6f
pkgrel=1
pkgdesc='Library for choosing window system and OpenGL API at runtime (git version)'
arch=('x86_64' 'aarch64')
url='http://www.waffle-gl.org'
provides=('waffle')
conflicts=('waffle')
license=('BSD')

depends=('libx11' 'libxcb' 'libgl' 'libgles')
optdepends=('libegl: for gbm, surfaceless, x11_egl or wayland support'
            'mesa: for gbm support'
            'libdrm: for gbm support'
            'wayland: for wayland support')
makedepends=('git' 'meson' 'xcb-proto' 'mesa' 'libxslt' 'docbook-xsl' 'cmake' 'libdrm' 'wayland-protocols')

source=('git+https://gitlab.freedesktop.org/mesa/waffle.git')
sha256sums=('SKIP')

_gitname='waffle'

pkgver() {
  cd $_gitname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_gitname" build \
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
