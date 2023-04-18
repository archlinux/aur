pkgname=mingw-w64-nauty
pkgver=2.8.6
pkgrel=1
pkgdesc="A program for computing automorphism groups of graphs and digraphs (mingw-w64)"
arch=(any)
url="http://pallini.di.uniroma1.it/"
license=(Apache)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(!strip !buildflags staticlibs)
source=(http://pallini.di.uniroma1.it/nauty${pkgver//./_}.tar.gz)
sha256sums=('f2ce98225ca8330f5bce35f7d707b629247e09dda15fc479dc00e726fee5e6fa')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd nauty${pkgver//./_}
  curl -L https://raw.githubusercontent.com/archlinux/svntogit-community/packages/nauty/trunk/nauty-2.8.6-gentreeg-gentourng.patch | patch -p1

  # drop popcnt check
  sed -i "284,285d" configure.ac
  autoreconf -vfi

  cd "$srcdir"
  for _arch in ${_architectures}; do
    rm -rf build-${_arch}
    cp -r nauty${pkgver//./_} build-${_arch}
  done
}

build() {
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    ${_arch}-configure --disable-popcnt allow_popcnt=0 enable_popcnt=0 have_popcntll=0 .
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    mkdir -p "$pkgdir"/usr/${_arch}/{lib,include/nauty}
    install -m644 nauty.a "$pkgdir"/usr/${_arch}/lib
    install -m644 *.h "$pkgdir"/usr/${_arch}/include/nauty
    popd
  done
}
