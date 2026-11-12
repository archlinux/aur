# Maintainer: Damian Höster <damian.hoester@posteo.de>
# Contributor:  Joshua Holmer <jholmer.in@gmail.com>

_pkgname=libjxl
pkgname=$_pkgname-metrics
pkgver=0.13.0
pkgrel=1
pkgdesc='JPEG XL image format reference implementation with butteraugli, ssimulacra, and ssimulacra2 metrics'
arch=(
  x86_64
  aarch64
)
url=https://jpeg.org/jpegxl/
license=(BSD-3-Clause)
depends=(
  brotli
  highway
  libpng
  libjpeg.so
  giflib
  openexr
  gperftools
)
makedepends=(
  git
  cmake
  clang
  lld
  python
  asciidoc
)
provides=(
  $_pkgname
  libjxl.so=0.13
  libjxl_cms.so=0.13
  libjxl_threads.so=0.13
  butteraugli
  ssimulacra
  ssimulacra2
)
conflicts=(
  $_pkgname
  butteraugli
  ssimulacra
  ssimulacra2
)
optdepends=(
  'libjxl-doc: for documentation'
)
source=(
  git+https://github.com/libjxl/$_pkgname.git#tag=v$pkgver
  git+https://skia.googlesource.com/skcms.git#commit=96d9171c94b937a1b5f0293de7309ac16311b722
  git+https://github.com/webmproject/sjpeg.git#commit=dd4d9857c58a25713711a46d37385ad23ca2177e
)
sha256sums=(
  SKIP
  SKIP
  SKIP
)

prepare() {
  git -C $_pkgname submodule init third_party/{skcms,sjpeg}
  git -C $_pkgname config submodule.third_party/skcms.url "$srcdir"/skcms
  git -C $_pkgname config submodule.third_party/sjpeg.url "$srcdir"/sjpeg
  git -C $_pkgname -c protocol.file.allow=always submodule update
}

build() {
  export CC=clang CXX=clang++
  export LDFLAGS+=' -fuse-ld=lld'
  cmake -S $_pkgname -B build --fresh \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DJPEGXL_ENABLE_DEVTOOLS=ON \
    -DJPEGXL_ENABLE_DOXYGEN=OFF \
    -DJPEGXL_ENABLE_EXAMPLES=OFF \
    -DJPEGXL_FORCE_SYSTEM_BROTLI=ON \
    -DJPEGXL_FORCE_SYSTEM_HWY=ON
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install
  install -Dm644 $_pkgname/{LICENSE,PATENTS} \
    -t "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/bin/butteraugli_main "$pkgdir"/usr/bin/butteraugli
  ln -s /usr/bin/ssimulacra_main "$pkgdir"/usr/bin/ssimulacra
  rm -f "$pkgdir"/usr/bin/djxl_fuzzer_corpus
}
