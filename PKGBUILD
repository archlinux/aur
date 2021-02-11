# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Clayton Craft <clayton@craftyguy.net>

pkgname=waffle-git
pkgver=1.5.2.3.r275.g2485a41
pkgrel=2
pkgdesc='Library for choosing window system and OpenGL API at runtime (git version)'
arch=('x86_64' 'aarch64')
url='http://www.waffle-gl.org'
provides=('waffle')
conflicts=('waffle')
license=('BSD')

depends=('libx11' 'libxcb' 'wayland')
makedepends=('git' 'meson' 'xcb-proto' 'mesa' 'libxslt' 'docbook-xsl')

source=('git+https://gitlab.freedesktop.org/mesa/waffle.git')
sha256sums=('SKIP')

_gitname='waffle'

pkgver() {
  cd $_gitname
  git describe --long | sed 's/^debian\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_gitname

  arch-meson build \
    --buildtype release \
    -Dwaffle_has_gbm=1 \
    -Dwaffle_has_glx=1 \
    -Dwaffle_has_x11_egl=1 \
    -Dwaffle_has_wayland=1 \
    -Dwaffle_build_manpages=1 \
    -Dwaffle_build_htmldocs=1 \
    -Dwaffle_build_examples=0
  ninja -C build
}

package() {
  cd $_gitname

  DESTDIR="$pkgdir/" ninja -C build install
  install -m755 -d "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 "$pkgdir"/usr/share/doc/waffle1/LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

