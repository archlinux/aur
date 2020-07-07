# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=opencollada
pkgver=1.6.68
pkgrel=2
epoch=1
pkgdesc="Stream based reader and writer library for COLLADA files"
arch=(x86_64)
url="https://github.com/KhronosGroup/OpenCOLLADA"
license=('GPL')
depends=('libxml2' 'pcre')
makedepends=('git' 'cmake')
source=('opencollada.conf'
        'pcre.patch'
        "git://github.com/KhronosGroup/OpenCOLLADA.git#tag=v${pkgver}")
sha256sums=('2fc9656a2b881ca4528416daa91fc525adaa97d73e96a18b41aa7856270eba1f'
            'f37a7cbadcaa06b70133f76c509c61bdcf13715bc13aed11b5db83ef594813b3'
            'SKIP')

prepare() {
  cd "$srcdir"/OpenCOLLADA

  patch -Np1 -i "$srcdir"/pcre.patch
}

build() {
  cd "$srcdir"/OpenCOLLADA

  [[ -d build ]] && rm -r build
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SHARED=ON \
    -DUSE_STATIC=OFF
  make
}

package() {
  cd "$srcdir"/OpenCOLLADA/build

  make DESTDIR=$pkgdir install

  install -Dm644 $srcdir/opencollada.conf $pkgdir/etc/ld.so.conf.d/opencollada.conf
}

# vim:set ts=2 sw=2 et:
