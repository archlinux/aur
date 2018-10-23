# Maintainer Pol Marcet Sardà <polmarcetsarda@gmail.com>

pkgname=k8vavoom-git
pkgver=r6306.12559d981
pkgrel=1
pkgdesc="Source port of Doom"
arch=(x86_64)
url="https://repo.or.cz/k8vavoom.git"

depends=("zlib" "bzip2" "libpng" "libjpeg" "sdl2" "sdl2_mixer")
makedepends=("cmake" "git")
optdepends=("libmad" "mikmod")

source=("$pkgname"::"git+https://repo.or.cz/k8vavoom.git"
        "arch.patch")

sha256sums=('SKIP'
            'b35e882aee67e17a0a4bc2654fb15e8b014d69d666d138408375d8171250f192')

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
          -DENABLE_SERVER=ON            \
          -DENABLE_MASTER=ON            \
          -DENABLE_VCCRUN=ON            \
          -DWITH_SYS_LIBPNG=ON          \
          .
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR=$pkgdir install
}

