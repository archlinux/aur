# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Contributor: Yevhenii Kolesnikov <sigexp.acc@gmail.com>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Chad Versace <chad.versace@linux.intel.com>

pkgname=lib32-waffle
pkgver=1.8.0
pkgrel=1
pkgdesc='a library for choosing window system and OpenGL API at runtime (32 bits)'
arch=('x86_64')
url='https://waffle.freedesktop.org'
license=('BSD')

depends=('lib32-libx11' 'lib32-libxcb' "waffle=${pkgver}")
optdepends=('lib32-libgl: for OpenGL or GLX support'
            'lib32-libgles: for GLES support'
            'lib32-libegl: for gbm, surfaceless, x11_egl or wayland support'
            'lib32-mesa: for gbm support'
            'lib32-libdrm: for gbm support'
            'lib32-wayland: for wayland support')

makedepends=('meson' 'xcb-proto' 'lib32-mesa' 'gcc-multilib' 'wayland-protocols')

source=(https://waffle.freedesktop.org/files/release/waffle-${pkgver}/waffle-${pkgver}.tar.xz{,.asc})
sha256sums=('29f462b5ea93510f585ae59b09f1aef6f9bad7287c7b82a7e8bd88f766e3afc7'
            'SKIP')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D')

build() {
  local meson_args=(
    --buildtype release
    --libdir=/usr/lib32
    -D build-manpages=false
    -D build-htmldocs=false
    -D build-examples=false
  )

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  arch-meson "waffle-$pkgver" build "${meson_args[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  mv "$pkgdir/usr/bin/wflinfo" "$pkgdir/usr/bin/wflinfo32"
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/share"

  install -m755 -d "$pkgdir/usr/share/licenses"
  ln -s "waffle" "$pkgdir/usr/share/licenses/lib32-waffle"
}
