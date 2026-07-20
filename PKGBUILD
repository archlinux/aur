# Maintainer: Daniel W. S. Almeida <dwlsalmeida at gmail dot com>

_name=ramses
pkgname=$_name-git
pkgver=r166.068163a64
pkgrel=1
pkgdesc='A distributed system for rendering 3D content with focus on bandwidth and resource efficiency'
arch=('x86_64')
url='https://github.com/GENIVI/ramses'
license=('MPL2')
depends=('lz4' 'harfbuzz' 'libx11' 'mesa' 'python' 'wayland')

makedepends=('bash' 'cmake' 'git' 'ninja' 'ragel') 
provides=('ramses')
source=('git+https://github.com/GENIVI/ramses.git')

sha512sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/$_name
  git submodule update --init --recursive

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=$pkgdir/usr \
    -Dramses-sdk_BUILD_TESTS=0 \
    -Dramses-sdk_BUILD_SMOKE_TESTS=0 \
    -Dramses-sdk_BUILD_EXAMPLES=0 \
    -Dramses-sdk_ENABLE_WAYLAND_SHELL=1 \
    -Dramses-sdk_ENABLE_DLT=0 \
    -G Ninja \
    -Wno-dev \
    ${srcdir}/$_name

  cmake --build ${srcdir}/$_name
}

package() {
  cd ${srcdir}/$_name
  cmake --build ${srcdir}/$_name --target install
}
