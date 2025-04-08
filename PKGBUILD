# Maintainer: HeyCitizen <4637290+InTheMorning@users.noreply.github.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
pkgname=openttd-btpro
_pkgname=citymania-client
pkgver=14.1
pkgrel=1
pkgdesc='OpenTTD Fork of citymania client with changes for n-ice and btpro community.'
arch=(x86_64)
url='https://www.openttd.org'
license=(GPL)
depends=(fluidsynth fontconfig hicolor-icon-theme)
makedepends=(cmake ninja)
optdepends=('openttd-opengfx: free graphics'
            'openttd-opensfx: free soundset')
source=("https://github.com/n-ice-community/openttd-cmclient/releases/download/$pkgver/citymania-client-$pkgver-source.tar.xz"
         https://github.com/OpenTTD/OpenTTD/commit/14fac2ad.patch)
b2sums=('b15bd5b138cf04f825852972cdc68ab6d318e628f27a636975940561442836448a0a1fb7259b3acdb19791c0a2109c6bb6718fa1f83c36e27b0f0227dc4c48dc'
        'ea5fa5d19f3195bfcd2b279e153c4c17e61b6f57a189a3ab65e9450956c7ce720420ba7aed5df4c8944875ead8753a5699af2644c9d29639b3750b86e9b4ad6d')
conflicts=('openttd')

prepare() {
  sed -i '/sse/d;/SSE/d' $_pkgname-$pkgver/CMakeLists.txt
  patch -d $_pkgname-$pkgver -p1 < 14fac2ad.patch # Fix build with ICU 76
}

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_BINDIR=bin \
    -D CMAKE_INSTALL_DATADIR=/usr/share \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -S $_pkgname-$pkgver
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
