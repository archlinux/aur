# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=libjxl
pkgname=${_pkgname}-metrics
pkgver=0.11.1
pkgrel=1
pkgdesc='JPEG XL image format reference implementation with butteraugli, ssimulacra, and ssimulacra2 metrics'
arch=(x86_64)
url=https://jpeg.org/jpegxl/
license=(BSD)
depends=(
  brotli
  highway
  libpng
  libjpeg
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
  gdk-pixbuf2 #for building gdk-pixbuf loader
  gimp #for building GIMP plugin
  java-environment #for building JNI bindings
)
provides=(
  libjxl
  libjxl.so=0.11
  libjxl_threads.so=0.11
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
  'libjxl-doc: for documentation'
)
options=(!lto) #Disabling pacman's LTO, as ThinLTO is enforced
source=(
  git+https://github.com/libjxl/libjxl.git#tag=v${pkgver}
  git+https://github.com/google/brotli.git#tag=v1.1.0
  git+https://github.com/mm2/Little-CMS.git#tag=lcms2.16
  git+https://github.com/google/googletest.git#tag=v1.15.2
  git+https://github.com/webmproject/sjpeg.git
  git+https://skia.googlesource.com/skcms.git
  git+https://github.com/google/highway.git#tag=1.2.0
  git+https://github.com/glennrp/libpng.git#tag=v1.6.45
  git+https://github.com/madler/zlib.git#tag=v1.3.1
  libjxl-testdata::git+https://github.com/libjxl/testdata.git
  git+https://github.com/libjpeg-turbo/libjpeg-turbo.git#tag=3.1.0
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
  git -C libjxl config --local submodule.third_party/testdata.url "${srcdir}/libjxl-testdata"
  git -C libjxl config --local submodule.third_party/libjpeg-turbo.url "${srcdir}/libjpeg-turbo"
  git -C libjxl -c protocol.file.allow=always submodule update
}

build() {
  export CC=clang CXX=clang++
  export CFLAGS+=" -flto=thin" CXXFLAGS+=" -flto=thin"
  export LDFLAGS+=" -fuse-ld=lld"
  cmake -S $_pkgname -B build \
    -DBUILD_TESTING=OFF \
    -DJPEGXL_ENABLE_DEVTOOLS=ON \
    -DJPEGXL_ENABLE_DOXYGEN=OFF \
    -DJPEGXL_ENABLE_EXAMPLES=OFF \
    -DJPEGXL_ENABLE_JPEGLI=OFF \
    -DJPEGXL_ENABLE_PLUGINS=ON \
    -DJPEGXL_FORCE_SYSTEM_BROTLI=ON \
    -DJPEGXL_FORCE_SYSTEM_HWY=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install
  install -Dvm644 $_pkgname/{LICENSE,PATENTS} -t "$pkgdir/usr/share/licenses/$_pkgname"
  ln -s /usr/bin/butteraugli_main "$pkgdir/usr/bin/butteraugli"
  ln -s /usr/bin/ssimulacra_main "$pkgdir/usr/bin/ssimulacra"
}
