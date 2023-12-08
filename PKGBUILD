# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=libplacebo-git
pkgver=6.338.0.62.g52314e0e
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives. (GIT version)'
url='https://code.videolan.org/videolan/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
depends=(
  'gcc-libs'
  'glibc'
  'glslang' #'libSPIRV.so'
  'libdovi' 'libdovi.so'
  'lcms2' 'liblcms2.so'
  'shaderc' 'libshaderc_shared.so'
  'libunwind'
  'vulkan-icd-loader' 'libvulkan.so'
  'xxhash' 'libxxhash.so'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'vulkan-headers'
  'python-jinja'
  'python-markupsafe'
  'glad'
)
_pkgver=$(echo $pkgver | cut -d . -f 1-3)
provides=(
  "libplacebo=${pkgver%%.r*}"
  'libplacebo.so'
)
conflicts=('libplacebo')
source=(
  'git+https://code.videolan.org/videolan/libplacebo.git'
  'git+https://github.com/fastfloat/fast_float.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
)
options=('debug')

pkgver() {
  cd libplacebo
  echo "$(git describe --long --tags | sed 's|-rc|rc|g' | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build

  cd libplacebo
  git config submodule.3rdparty/fast_float.url "${srcdir}/fast_float"
  git -c protocol.file.allow=always submodule update --init \
     3rdparty/fast_float
}

build() {
  cd "${srcdir}/build"
  arch-meson ../libplacebo \
    -D vulkan=enabled \
    -D lcms=enabled \
    -D d3d11=disabled \
    -D tests=true \
    -D demos=false

  ninja
}

check() {
  ninja -C build test || true
}

package() {

  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 libplacebo/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
