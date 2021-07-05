# Maintainer: Nicolas_B
# Contributors: carstene1ns, jose riha, Christoph Zeiler, nut543 and Dany Martineau

pkgname=cdogs
pkgver=0.12.0
pkgrel=1
pkgdesc='Enhanced SDL port of DOS arcade game C-Dogs (aka "Cyberdogs 2")'
arch=('i686' 'x86_64')
url="http://cxong.github.io/cdogs-sdl/"
license=('GPL2')
depends=('gtk3' 'sdl2_mixer' 'sdl2_image')
makedepends=('cmake' 'python-pip' 'python-protobuf')
optdepends=('cdogs-mission-pack: A large collection of user-created campaigns for C-Dogs.')
source=(cdogs-$pkgver.tar.gz::"https://github.com/cxong/cdogs-sdl/archive/${pkgver}.tar.gz"
        remove_duplicate_gconfig.patch::"https://github.com/cxong/cdogs-sdl/commit/5a388412284d80608517533e3b4e7b68b2305e30.patch")
sha256sums=('7ce391e8c9ebd4ca2579ace1bd8d486a8267ff1ec4719c862aba6960ad06bee9'
            'b133b732a151e1f17d135a7d9d948cbe70e6b48e1fdcfeb462a46cf756fc139b')

prepare() {
  cd $pkgname-sdl-$pkgver
  patch --forward --strip=1 --input="${srcdir}/remove_duplicate_gconfig.patch"

  # disable -Werror (aborts build on mere warnings)
  sed 's| -Werror||' -i CMakeLists.txt
}

build() {
  cd $pkgname-sdl-$pkgver

  cmake ./ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DCDOGS_DATA_DIR="/usr/share/cdogs/"
  make
}

package() {
  make DESTDIR="$pkgdir/" install -C $pkgname-sdl-$pkgver
}
