# Maintainer: Sam Therapy <sam@samtherapy.net>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Dale Blount <archlinux@dale.us>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=fortune-mod-off
pkgver=3.14.1
pkgrel=2
pkgdesc='The Fortune Cookie Program from BSD games, with offensive quotes!'
arch=('x86_64')
url='https://www.shlomifish.org/open-source/projects/fortune-mod/'
license=('BSD')
depends=('glibc' 'recode')
makedepends=('cmake' 'rinutils')
conflicts=('fortune-mod')
source=("https://github.com/shlomif/fortune-mod/releases/download/${pkgname/-off/}-$pkgver/${pkgname/-off/}-$pkgver.tar.xz"
        'not-a-game.patch')
sha512sums=('0de0ec033ffc35a7a9ec1a549e6dac425757ec5fcc718c772f0a4e548d23c46451af4a90b0ac548f2ab60d68856ca0fa5e8f10930efe6b199e96b2cc1c568810'
            'c4ef10c6d7bdb15ceec020d27e11c489ff56ed573b7efc0cf7465026514f153f789444cd7e2996d0fd9bb0f923c4eeeaf0eaa46a0bfacbc36712917e4f5d6c04')
b2sums=('a62d4056cdceef14f1d63dbc8b98bbd88098c64d0020b949ecc8e6006f1a4b1369211ac8b87a33db60b238cd7e6d3d6f3c4d2e59933a6cf0bd3fa54c439c4330'
        '5283fde623cd0d304f073d59ff648d671323d8638876c629e8e8f175de00c3d9a1f807f0a9dfce3d9c9a56299dc1824062b013a4ce0541ee5fcea97c53f6ecec')


prepare() {
  cd "${pkgname/-off/}-$pkgver"
  patch -p1 -i ../not-a-game.patch
}

build() {
  cmake \
    -B build \
    -S "${pkgname/-off/}-$pkgver" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D LOCALDIR=/usr/share/fortune \
    -D COOKIEDIR=/usr/share/fortune

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # i'd love to know why this command exists *shrugs*
  rm -vf "$pkgdir/usr/share/fortune/"*.u8

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "${pkgname/-off/}-$pkgver/COPYING.txt"
}
