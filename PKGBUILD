# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
pkgname=salmon
pkgver=0.12.0
pkgrel=1
pkgdesc="Highly-accurate & wicked fast transcript-level quantification from RNA-seq reads using lightweight alignments"
arch=('x86_64')
url="https://combine-lab.github.io/$pkgname/"
license=('GPL')
depends=('bzip2' 'intel-tbb' 'xz')
makedepends=('boost>=1.55' 'cmake' 'unzip')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/COMBINE-lab/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('2f07447c0070d1e22fb2b3879eaca810')

prepare() {
  # Fix for now segmentation fault when using archlinux jemalloc package
  # Force cmake to statically build jemalloc from salmon's dev sources
  cd "$pkgname-$pkgver"
  sed -i '/^find_package(Jemalloc)/ , /^endif()/ s/^/#/' CMakeLists.txt
}

build() {
  cd "$pkgname-$pkgver"
  cmake \
    -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev \
    .
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
