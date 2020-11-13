# Maintainer: Christoph Haag <christoph.haag@collabora.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-libepoxy-git
pkgver=1.5.4.r20.g34ecb90
pkgrel=1
pkgdesc='Library handling OpenGL function pointer management'
arch=('x86_64')
url='https://github.com/anholt/libepoxy'
license=('MIT')
depends=('lib32-glibc')
makedepends=('git' 'lib32-libgl' 'lib32-systemd' 'meson')
provides=("lib32-libepoxy")
conflicts=("lib32-libepoxy")
source=("git+https://github.com/anholt/libepoxy.git")
sha256sums=('SKIP')

pkgver() {
  cd libepoxy
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CC='gcc -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  arch-meson libepoxy build \
    --libdir='/usr/lib32'
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  rm -rf "${pkgdir}"/usr/include
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libepoxy "${pkgdir}"/usr/share/licenses/lib32-libepoxy
}
