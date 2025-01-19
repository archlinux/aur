# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=libjxl
pkgname=${_pkgname}-metrics-git
pkgver=0.11.1.r149.g8a76d014
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
  git+https://skia.googlesource.com/skcms.git
  git+https://github.com/webmproject/sjpeg.git
)
sha256sums=(
  SKIP
  SKIP
  SKIP
)

prepare() {
  git -C libjxl submodule init third_party/{skcms,sjpeg}
  git -C libjxl config --local submodule.third_party/skcms.url "${srcdir}/skcms"
  git -C libjxl config --local submodule.third_party/sjpeg.url "${srcdir}/sjpeg"
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
