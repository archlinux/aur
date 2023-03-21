# Maintainer: Sam Therapy <sam@samtherapy.net>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Dale Blount <archlinux@dale.us>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=fortune-mod-off
pkgver=3.18.0
pkgrel=1
pkgdesc='The Fortune Cookie Program from BSD games, with offensive quotes!'
arch=('x86_64')
url='https://www.shlomifish.org/open-source/projects/fortune-mod/'
license=('BSD')
depends=('glibc' 'recode')
makedepends=('cmake' 'rinutils')
conflicts=('fortune-mod')
source=("https://github.com/shlomif/fortune-mod/releases/download/${pkgname/-off/}-$pkgver/${pkgname/-off/}-$pkgver.tar.xz"
        'not-a-game.patch')
sha512sums=('b8d16bf5032c1a0fcb161c912109abd24f3b762f3455eaf86d41ed3f16a33db4913d9a21bb6a42f974a3b11cfaedac57cabc4456d178a3d631d8d4a723789798'
            'c4ef10c6d7bdb15ceec020d27e11c489ff56ed573b7efc0cf7465026514f153f789444cd7e2996d0fd9bb0f923c4eeeaf0eaa46a0bfacbc36712917e4f5d6c04')
b2sums=('b975d75aea745f06f26753038416b1cc50b462a11a5cbe71a9aadc44b31f9120ac3e37ed160c9d7f90e379e5ea4c51dc39921362d24811547364e37d64c3faf9'
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
