# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: jtts <jussaar@mbnet.fi>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-dconf
pkgver=0.28.0
pkgrel=1
pkgdesc='A low-level configuration system'
arch=('x86_64')
url='https://live.gnome.org/dconf'
license=('LGPL2.1')
depends=('dconf' 'lib32-glib2')
makedepends=('docbook-xsl' 'gcc-multilib' 'intltool' 'meson' 'python' 'vala')
source=("https://download.gnome.org/sources/dconf/${pkgver%.*}/dconf-${pkgver}.tar.xz")
sha256sums=('61d3b3865ef58b729c3b39aa0979f886c014aa8362f93dcfc74bf5648ed9c742')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  arch-meson ../dconf-${pkgver} \
    --libdir='/usr/lib32' \
    --libexecdir='/usr/lib32/dconf' \
    -Denable-man=false
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
