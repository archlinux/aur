# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=libplacebo
pkgname=lib32-$_pkgbasename
pkgver=7.349.0
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (32bit)'
url='https://github.com/haasn/libplacebo'
arch=('x86_64')
license=('LGPL2.1-or-later')
depends=(
        "$_pkgbasename>=${pkgver}"
#        "$_pkgbasename"
        'lib32-vulkan-icd-loader>=1.2.176'
        'lib32-glslang>=8.13.3559'
        'lib32-lcms2'
        'lib32-shaderc'
        'lib32-glibc'
        'lib32-gcc-libs'
        'lib32-libunwind'
        'lib32-libdovi'
#        'lib32-xxhash'
        )
makedepends=(
        'glad' 
        'meson'
#        'meson-cross-x86-linux-gnu>=1.0.4'
        'libglvnd'
        'ninja'
        'nuklear'
        'python'
        'python-jinja'
        'python-mako'
        'python-markupsafe' 
        'python-setuptools' 
        'vulkan-headers'
        )
provides=('libplacebo.so')
source=(
    "https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/${_pkgbasename}-v${pkgver}.tar.gz"
  )
sha512sums=(
    '94fb0ad4f6cdafc81a43f06a73e49ef8ed7f81e751ad2a028f6f91295a06d8c12f2959e2595bd654db946fc5aa89758ab9d37f985ebb82badbd517ed02f3ddca'
  )
b2sums=(
    '4a1a667e608e559f2ac163d25183ce9cd2a3ddfa05d88219e5597db08478c883f12efb2e66fe54d9aab65f2863efbe60f0448e241a69109ea423af8222008493'
  )

prepare() {
  cd ${_pkgbasename}-v${pkgver}

  # Patching if needed
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS} -I/usr/include/glslang"
 
  cd ${_pkgbasename}-v${pkgver}
  meson setup build \
    --prefix=/usr \
    --libdir=lib32 \
    -D tests=false \
    -D vulkan=enabled \
    -D glslang=enabled \
    -D shaderc=enabled \
    -D lcms=enabled \
    -D d3d11=disabled \
    -D demos=false

#    --cross-file x86-linux-gnu \

  meson compile -C build
}

check() {
  cd ${_pkgbasename}-v${pkgver}
#  meson test -C build --print-errorlogs
}

package() {
  cd ${_pkgbasename}-v${pkgver}

  meson install -C build --destdir "${pkgdir}"

  rm -r "${pkgdir}"/usr/include
}
