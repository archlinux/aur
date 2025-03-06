# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgbase=easyrpg-tools-git
pkgname=(easyrpg-tools-git xyz-thumbnailer-git)
pkgver=r250.0e95909
pkgrel=1
pkgdesc="EasyRPG tools for RPG Maker 2000/2003 files (development version)"
arch=('i686' 'x86_64')
url="https://easyrpg.org/tools/"
license=('MIT' 'ISC' 'GPL-3.0-or-later')
makedepends=('git' 'gcc-libs' 'liblcf-git' 'freeimage' 'libpng' 'zlib' 'nlohmann-json')
source=(${pkgname%-*}::"git+https://github.com/EasyRPG/Tools.git"
        "lmu2png-freeimage.patch")
sha256sums=('SKIP'
            '0f4811176b3306d2fea6f2b7c2d5c46a67f6e943f6e899c2ca76d9751e8ccac9')

pkgver() {
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-*}

  # temporarily fix freeimage test link order
  grep -q "LDFLAGS" lmu2png/configure.ac \
    && patch -Np1 < "$srcdir"/lmu2png-freeimage.patch

  ./bootstrap
}

build() {
  cd ${pkgname%-*}

  ./configure --prefix=/usr
  make
}

package_easyrpg-tools-git() {
  depends=('gcc-libs' 'liblcf-git' 'freeimage' 'libpng' 'zlib')
  provides=('lmu2png' 'png2xyz' 'xyz2png' 'xyzcrush' 'gencache' 'lcftrans' 'lcfviz')

  cd ${pkgname%-*}

  make DESTDIR="$pkgdir" install

  # licenses
  for _l in png2xyz xyz2png xyzcrush gencache lcftrans lcfviz; do
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
