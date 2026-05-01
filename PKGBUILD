# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: mechakotik <mechakotik@gmail.com>

pkgname=tails-adventure
pkgver=0.3.2
pkgrel=1
pkgdesc="Open source remake of Tails Adventure for modern platforms"
url="https://github.com/mechakotik/tails-adventure"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('sdl3' 'sdl3_image' 'libgme' 'tinyxml2')
makedepends=('cmake' 'ninja' 'toml11')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mechakotik/$pkgname/archive/v$pkgver-1.tar.gz"
        "SDL3_mixer.tar.gz::https://github.com/libsdl-org/SDL_mixer/releases/download/release-3.2.0/SDL3_mixer-3.2.0.tar.gz"
        "SDL_GCDB.tar.gz::https://github.com/mdqinc/SDL_GameControllerDB/archive/c6062ec4b92254aced84843d94d379410774d907.tar.gz"
        "tmxpp.tar.gz::https://github.com/mechakotik/tmxpp/archive/6efb8aa317fc2558433fcab27b201f871341f346.tar.gz"
        "$pkgname-$pkgver-unbundle.patch"
        "$pkgname-$pkgver-relocate.patch")
sha256sums=('cf07ec08f96c3f65119263bc40b49a86da02647095a096b35cff10f0e6bca72c'
            '1f86fae7226d58f2ad210ca4d9e06488db722230032803423d83bad6d35fc395'
            'd04ba6b283acae352d9ac5bf3f2b6775bda998eaf893512db5e0225c365c43dc'
            '643959bc85d493d4b8e1cf08f817079ef0d5e35692e551f954e94fcfdc5c08ab'
            '9a2b98f3e02d8be4ced9d1d9ca7ce84ed49e02445753549a8e16e3ec8f06c22e'
            'f611b9d5bebb1596d037ed19c57ba19f4ce9da912d5d8adb808c7f0cb73d43fc')

prepare() {
  rm -rf aurbuild

  # unbundle some dependencies
  # FIXME: Cannot unbundle sdl3_mixer, since GME support is broken
  patch -Np1 -d $pkgname-$pkgver-1 -i "$srcdir"/$pkgname-$pkgver-unbundle.patch

  # relocate to standard paths
  patch -Np1 -d $pkgname-$pkgver-1 -i "$srcdir"/$pkgname-$pkgver-relocate.patch

  # replace git submodules
  rm -rf $pkgname-$pkgver-1/external/{SDL_mixer,SDL_GameControllerDB,tmxpp}
  ln -s "$srcdir"/SDL3_mixer-3.2.0 $pkgname-$pkgver-1/external/SDL_mixer
  ln -s "$srcdir"/SDL_GameControllerDB-c6062ec4b92254aced84843d94d379410774d907 \
    $pkgname-$pkgver-1/external/SDL_GameControllerDB
  ln -s "$srcdir"/tmxpp-6efb8aa317fc2558433fcab27b201f871341f346 \
    $pkgname-$pkgver-1/external/tmxpp
}

build() {
  cmake -S $pkgname-$pkgver-1 -B aurbuild -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DTA_UNIX_INSTALL=ON
  cmake --build aurbuild
}

package() {
  DESTDIR="$pkgdir" cmake --install aurbuild
}
