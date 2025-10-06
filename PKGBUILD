# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=libjxl
pkgname=$_pkgname-metrics
pkgver=0.11.1
pkgrel=11
pkgdesc='JPEG XL image format reference implementation with butteraugli, ssimulacra, and ssimulacra2 metrics'
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
  # plugins disabled for now because https://github.com/libjxl/libjxl/issues/4037
  #gdk-pixbuf2 # for building gdk-pixbuf loader
  #gimp # for building GIMP plugin
  #java-environment # for building JNI bindings
)
provides=(
  $_pkgname
  libjxl.so=0.11
  libjxl_cms.so=0.11
  libjxl_threads.so=0.11
  butteraugli
  ssimulacra
  ssimulacra2
  jpegli
)
conflicts=(
  $_pkgname
  butteraugli
  ssimulacra
  ssimulacra2
  jpegli
)
optdepends=(
  'libjxl-doc: for documentation'
)
source=(
  git+https://github.com/libjxl/$_pkgname.git#tag=v$pkgver
  git+https://skia.googlesource.com/skcms.git#commit=42030a771244ba67f86b1c1c76a6493f873c5f91
  git+https://github.com/webmproject/sjpeg.git#commit=e5ab13008bb214deb66d5f3e17ca2f8dbff150bf
  git+https://github.com/libjpeg-turbo/libjpeg-turbo.git#tag=2.1.5.1
)
sha256sums=(
  SKIP
  SKIP
  SKIP
  SKIP
)

prepare() {
  git -C $_pkgname submodule init third_party/{skcms,sjpeg,libjpeg-turbo}
  git -C $_pkgname config submodule.third_party/skcms.url "$srcdir/skcms"
  git -C $_pkgname config submodule.third_party/sjpeg.url "$srcdir/sjpeg"
  git -C $_pkgname config submodule.third_party/libjpeg-turbo.url "$srcdir/libjpeg-turbo"
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
    -DJPEGXL_ENABLE_PLUGINS=OFF \
    -DJPEGXL_FORCE_SYSTEM_BROTLI=ON \
    -DJPEGXL_FORCE_SYSTEM_HWY=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.16
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install
  install -Dm644 $_pkgname/{LICENSE,PATENTS} \
    -t "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/bin/butteraugli_main "$pkgdir/usr/bin/butteraugli"
  ln -s /usr/bin/ssimulacra_main "$pkgdir/usr/bin/ssimulacra"
}
