# Maintainer Pol Marcet Sardà <polmarcetsarda@gmail.com>

pkgname=k8vavoom-git
pkgver=r7417.023db7608
pkgrel=1
pkgdesc="Source port of Doom"
arch=(x86_64)
url="https://repo.or.cz/k8vavoom.git"
license=('GPLv2')

depends=("zlib" "bzip2" "libpng" "libjpeg" "sdl2" "sdl2_mixer" "openal")
makedepends=("cmake" "git")
optdepends=("libmad")

source=("$pkgname"::"git+https://repo.or.cz/k8vavoom.git#commit=023db7608919f8e9da345e2fa4c93d712010c86e"
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
          -DENABLE_MASTER=ON            \
          -DENABLE_SERVER=ON            \
          -DENABLE_VCCRUN=ON            \
          -DWITH_SYS_LIBPNG=ON          \
          .
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR=$pkgdir install
}

