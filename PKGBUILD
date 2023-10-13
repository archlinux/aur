# Maintainer: Sam Therapy <sam@samtherapy.net>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Dale Blount <archlinux@dale.us>

pkgname=fortune-mod-off
pkgver=3.20.0
pkgrel=1
pkgdesc='The Fortune Cookie Program from BSD games, with the offensive quotes added back in'
arch=('x86_64')
url='https://www.shlomifish.org/open-source/projects/fortune-mod/'
license=('BSD')
depends=('glibc' 'recode')
makedepends=('cmake' 'rinutils')
provides=('fortune-mod')
conflicts=('fortune-mod')
source=("https://github.com/shlomif/fortune-mod/releases/download/${pkgname/-off/}-$pkgver/${pkgname/-off/}-$pkgver.tar.xz"
        'not-a-game.patch')
sha512sums=('4ce1111c73f087ed899e4796ac9c15f85fa7262e08f1a81162fcc37757d4ecd1f234d3c2c362a264c07ae45d68ec2299d4870c7b348cc0bbeb7db3b170ba0ded'
            'c4ef10c6d7bdb15ceec020d27e11c489ff56ed573b7efc0cf7465026514f153f789444cd7e2996d0fd9bb0f923c4eeeaf0eaa46a0bfacbc36712917e4f5d6c04')
b2sums=('b9b083fdb507126ab9c156e7f09fba720b37a88301a3472f1162a0744760d15dde54c2e4abda93fdca1f548880ae42a0bb45340f19464843bf833264c4fbbf31'
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
