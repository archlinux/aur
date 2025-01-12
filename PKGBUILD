# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=libjxl
pkgname=${_pkgname}-metrics-git
pkgver=0.11.1.r142.g272f579a
pkgrel=1
pkgdesc='JPEG XL image format reference implementation with butteraugli, ssimulacra, and ssimulacra2 metrics (git version)'
arch=(x86_64)
url=https://jpeg.org/jpegxl/
license=(BSD-3-Clause)
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
  'libjxl-doc: for documentation'
)
options=(!lto) #Disabling pacman's LTO, as ThinLTO is enforced
source=(
  git+https://github.com/libjxl/libjxl.git
  git+https://github.com/google/brotli.git
  git+https://github.com/mm2/Little-CMS.git
  git+https://github.com/google/googletest.git
  git+https://github.com/webmproject/sjpeg.git
  git+https://skia.googlesource.com/skcms.git
  git+https://github.com/google/highway.git
  git+https://github.com/glennrp/libpng.git
  git+https://github.com/madler/zlib.git
  libjxl-testdata::git+https://github.com/libjxl/testdata.git
  git+https://github.com/libjpeg-turbo/libjpeg-turbo.git
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

pkgver() {
    local _tag=$(git -C $_pkgname tag --list --sort=-v:refname 'v[[:digit:]]*' | \
                 sed 's/^v//;/[[:alpha:]]/d' | head -n1)
    printf $_tag.r%s.g%s $(git -C $_pkgname rev-list --count v$_tag..HEAD) \
                         $(git -C $_pkgname rev-parse --short HEAD)
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
    -DJPEGXL_ENABLE_JPEGLI=OFF \ #jpegli moved to https://github.com/google/jpegli.git
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
