# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgbase=easyrpg-tools-git
pkgname=(easyrpg-tools-git xyz-thumbnailer-git)
pkgver=r175.a57ef7b
pkgrel=1
pkgdesc="EasyRPG tools for RPG Maker 2000/2003 files (development version)"
arch=('i686' 'x86_64')
url="https://easyrpg.org/tools/"
license=('MIT' 'ISC' 'GPL3' 'custom')
makedepends=('git' 'gcc-libs' 'liblcf-git' 'sdl2_image' 'libpng' 'zlib' 'nlohmann-json')
source=(${pkgname%-*}::"git+https://github.com/EasyRPG/Tools.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-*}

  ./bootstrap
  ./configure --prefix=/usr
  make
}

package_easyrpg-tools-git() {
  depends=('gcc-libs' 'liblcf-git' 'sdl2_image' 'libpng' 'zlib')
  provides=('lmu2png' 'png2xyz' 'xyz2png' 'xyzcrush' 'gencache' 'lcftrans' 'lcfviz')

  cd ${pkgname%-*}

  make DESTDIR="$pkgdir" install

  # licenses
  for _l in gencache lcftrans lcfviz; do
    install -Dm0644 $_l/COPYING "$pkgdir"/usr/share/licenses/$pkgname/$_l-COPYING
  done
}

package_xyz-thumbnailer-git() {
  pkgdesc="Thumbnailer for XYZ images (development version)"
  depends=('xyz2png' 'sh')
  arch=('any')
  license=('MIT')

  cd easyrpg-tools/xyz-thumbnailer/linux

  make PREFIX=/usr DESTDIR="$pkgdir" install
}
