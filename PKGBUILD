# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=libjxl
pkgname=${_pkgname}-metrics-git
pkgver=0.11.1.r124.g7e1d4f17
pkgrel=1
pkgdesc='JPEG XL image format reference implementation with butteraugli, ssimulacra, and ssimulacra2 metrics (git version)'
arch=(x86_64)
url=https://jpeg.org/jpegxl/
license=(BSD)
depends=(
  brotli
  highway
  gtest
  libpng
  lcms2
  gperftools
)
makedepends=(
  git
  cmake
  clang
  lld
  giflib
  openexr
  libjpeg-turbo
  python
  asciidoc
  gflags
  zlib
)
provides=(
  libjxl
  libjxl.so
  libjxl_threads.so
  butteraugli
  ssimulacra
  ssimulacra2
)
conflicts=(
  libjxl
  butteraugli
  ssimulacra
  ssimulacra2
)
optdepends=(
  'gdk-pixbuf2: for gdk-pixbuf loader'
  'gimp: for building gimp jxl plugin'
  'java-environment: for building FNI Java wrapper'
  'libjxl-doc: for documentation'
)
source=(
  $_pkgname::git+https://github.com/libjxl/libjxl.git
  brotli::git+https://github.com/google/brotli.git
  Little-CMS::git+https://github.com/mm2/Little-CMS.git
  googletest::git+https://github.com/google/googletest.git
  sjpeg::git+https://github.com/webmproject/sjpeg.git
  skcms::git+https://skia.googlesource.com/skcms.git
  highway::git+https://github.com/google/highway.git
  libpng::git+https://github.com/glennrp/libpng.git
  zlib::git+https://github.com/madler/zlib.git
  gflags::git+https://github.com/gflags/gflags.git
  libjxl-testdata::git+https://github.com/libjxl/testdata.git
)
sha256sums=(
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
)

prepare() {
  git -C libjxl submodule init
  git -C libjxl config --local submodule.third_party/brotli.url "${srcdir}/brotli"
  git -C libjxl config --local submodule.third_party/lcms.url "${srcdir}/Little-CMS"
  git -C libjxl config --local submodule.third_party/googletest.url "${srcdir}/googletest"
  git -C libjxl config --local submodule.third_party/sjpeg.url "${srcdir}/sjpeg"
  git -C libjxl config --local submodule.third_party/skcms.url "${srcdir}/skcms"
  git -C libjxl config --local submodule.third_party/highway.url "${srcdir}/highway"
  git -C libjxl config --local submodule.third_party/libpng.url "${srcdir}/libpng"
  git -C libjxl config --local submodule.third_party/zlib.url "${srcdir}/zlib"
  git -C libjxl config --local submodule.third_party/gflags.url "${srcdir}/gflags"
  git -C libjxl config --local submodule.third_party/testdata.url "${srcdir}/libjxl-testdata"
  git -C libjxl -c protocol.file.allow=always submodule update
}

pkgver() {
    local _tag=$(git -C $_pkgname tag --list --sort=-v:refname 'v[[:digit:]]*' | \
                 sed 's/^v//;/[[:alpha:]]/d' | head -n1)
    printf $_tag.r%s.g%s $(git -C $_pkgname rev-list --count v$_tag..HEAD) \
                         $(git -C $_pkgname rev-parse --short HEAD)
}

build() {
  # Using clang and lld as suggested by the repo
  cmake -S $_pkgname -B build \
    -DBUILD_TESTING=0 \
    -DJPEGXL_ENABLE_DEVTOOLS=ON \
    -DJPEGXL_ENABLE_EXAMPLES=OFF \
    -DJPEGXL_ENABLE_PLUGINS=ON \
    -DJPEGXL_ENABLE_FUZZERS=OFF \
    -DJPEGXL_ENABLE_DOXYGEN=OFF \
    -DJPEGXL_FORCE_SYSTEM_BROTLI=TRUE \
    -DJPEGXL_FORCE_SYSTEM_LCMS2=TRUE \
    -DJPEGXL_FORCE_SYSTEM_GTEST=TRUE \
    -DJPEGXL_FORCE_SYSTEM_HWY=TRUE \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_C_FLAGS="$CFLAGS -flto=thin" \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -flto=thin" \
    -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS -fuse-ld=lld -Wl,--thinlto-jobs=all" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build "$MAKEFLAGS"
}

package() {
  DESTDIR="$pkgdir" make -C build install
  install -Dm644 $_pkgname/{LICENSE,PATENTS} -t "$pkgdir/usr/share/licenses/$_pkgname"
  ln -s /usr/bin/butteraugli_main "$pkgdir/usr/bin/butteraugli"
  ln -s /usr/bin/ssimulacra_main "$pkgdir/usr/bin/ssimulacra"
}
