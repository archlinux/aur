# Maintainer: Clayton Craft <clayton@craftyguy.net>

pkgname=waffle-git
pkgver=1.5.2.3.r209.g1ded029
pkgrel=1
pkgdesc='a library for choosing window system and OpenGL API at runtime'
arch=('x86_64')
url='http://www.waffle-gl.org'
provides=('waffle')
conflicts=('waffle')
license=('BSD')

depends=('libx11' 'libxcb' 'wayland')
makedepends=('cmake' 'xcb-proto' 'mesa-libgl' 'mesa' 'libxslt' 'docbook-xsl')

options=('docs' '!strip' 'debug')
source=('git://github.com/waffle-gl/waffle')
sha1sums=('SKIP')

_gitname='waffle'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/^debian\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  cmake \
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
  make
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR="$pkgdir/" install
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$pkgdir/usr/share/doc/waffle1/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

