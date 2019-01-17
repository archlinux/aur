# Maintainer Pol Marcet Sardà <polmarcetsarda@gmail.com>

pkgname=k8vavoom-git
pkgver=r7733.e62fbc9da
pkgrel=1
pkgdesc="Source port of Doom"
arch=(x86_64)
url="https://repo.or.cz/k8vavoom.git"
license=('GPLv2')

depends=("zlib" "bzip2" "libpng" "libjpeg" "sdl2" "sdl2_mixer" "openal")
makedepends=("cmake" "git")
optdepends=("libmad")

source=("$pkgname"::"git+https://repo.or.cz/k8vavoom.git#commit=e62fbc9dab064c4a3ac2e0fbb172cf252ef7bd90"
        "arch.patch")

sha256sums=('SKIP'
            '29177e8444ef45c5ec61599b6be158fb5c06ab1fd36558c1d4f25fe9ee1a37c8')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 -i "${srcdir}/arch.patch"
}

build() {
    cd "$srcdir/$pkgname"
    cmake -DCMAKE_BUILD_TYPE=Release    \
          -DCMAKE_INSTALL_PREFIX=/usr   \
          -DENABLE_MASTER=ON            \
          -DENABLE_SERVER=OFF           \
          -DENABLE_VCCRUN=ON            \
          -DWITH_SYS_LIBPNG=ON          \
          .
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR=$pkgdir install
}

