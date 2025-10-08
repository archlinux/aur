# Maintainer: Sam Therapy <sam@samtherapy.net>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Dale Blount <archlinux@dale.us>

pkgname=fortune-mod-off
pkgver=3.24.0 # renovate: datasource=github-tags depName=shlomif/fortune-mod
pkgrel=1
pkgdesc='The Fortune Cookie Program from BSD games, with the offensive quotes added back in'
arch=('x86_64')
url='https://www.shlomifish.org/open-source/projects/fortune-mod/'
license=('BSD-4-Clause-UC')
depends=('glibc' 'recode')
makedepends=('cmake' 'rinutils')
provides=('fortune-mod')
conflicts=('fortune-mod')
source=("https://github.com/shlomif/fortune-mod/releases/download/${pkgname/-off/}-$pkgver/${pkgname/-off/}-$pkgver.tar.xz"
        'not-a-game.patch')
sha512sums=('6d320932931835b2ca1eef39f046073154cf0ef36aad4173c8e23af1a4fdcd327f06a436653b195ddecfe06a32607057464b18f2c80894849b38714774adbf14'
            'c4ef10c6d7bdb15ceec020d27e11c489ff56ed573b7efc0cf7465026514f153f789444cd7e2996d0fd9bb0f923c4eeeaf0eaa46a0bfacbc36712917e4f5d6c04')
b2sums=('378a2cee3317510d1b826a801d60b4c1aee69777a26861990435b888813d01ba46d4125d2cb588046e88009ddff0b38fc9d8b56672b6a016384b700e629cbade'
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
