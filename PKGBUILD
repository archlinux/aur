# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=libplacebo-git
pkgver=7.342.0.3490.g52314e0e
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
  "libplacebo=${_pkgver}"
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
  #   echo "$(git describe --long --tags | sed 's|-rc|rc|g' | tr - . | tr -d v)"

  _major_ver="$(cat meson.build | sed -ne '/Major version/{N;p}' | tail -n1 | grep -o "[[:digit:]]*")"
  _api="$(cat meson.build | sed -ne '/API version/{N;N;p}' | tail -n1 | grep -o "[[:digit:]]*")"
  _fix_ver="$(cat meson.build | sed -ne '/Fix version/{N;p}' | tail -n1 | grep -o "[[:digit:]]*")"
  echo "${_major_ver}.${_api}.${_fix_ver}.$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
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
