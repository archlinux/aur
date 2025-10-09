# Maintainer: Damian Höster <damian.hoester@posteo.de>
# Contributor:  Joshua Holmer <jholmer.in@gmail.com>

_pkgname=libjxl
pkgname=$_pkgname-metrics-git
pkgver=0.11.1.r428.ffd01c98
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
  # plugins disabled for now because https://github.com/libjxl/libjxl/issues/4037
  #gdk-pixbuf2 # for building gdk-pixbuf loader
  #gimp # for building GIMP plugin
  #java-environment # for building JNI bindings
)
provides=(
  $_pkgname
  libjxl.so
  libjxl_cms.so
  libjxl_threads.so
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
  git+https://github.com/libjxl/$_pkgname.git
  git+https://skia.googlesource.com/skcms.git
  git+https://github.com/webmproject/sjpeg.git
  git+https://github.com/libjpeg-turbo/libjpeg-turbo.git
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

pkgver() {
  local _tag=$(git -C $_pkgname tag --list --sort=-v:refname 'v[[:digit:]]*' |
    sed 's/^v//;/[[:alpha:]]/d' | head -n1)
  printf $_tag.r%s.%s $(git -C $_pkgname rev-list --count v$_tag..HEAD) \
    $(git -C $_pkgname rev-parse --short HEAD)
}

build() {
  export CC=clang CXX=clang++
  export LDFLAGS+=' -fuse-ld=lld'
  cmake -S $_pkgname -B build \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DJPEGXL_ENABLE_DEVTOOLS=ON \
    -DJPEGXL_ENABLE_DOXYGEN=OFF \
    -DJPEGXL_ENABLE_EXAMPLES=OFF \
    -DJPEGXL_ENABLE_PLUGINS=OFF \
    -DJPEGXL_FORCE_SYSTEM_BROTLI=ON \
    -DJPEGXL_FORCE_SYSTEM_HWY=ON
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install
  install -Dm644 $_pkgname/{LICENSE,PATENTS} \
    -t "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/bin/butteraugli_main "$pkgdir/usr/bin/butteraugli"
  ln -s /usr/bin/ssimulacra_main "$pkgdir/usr/bin/ssimulacra"
}
