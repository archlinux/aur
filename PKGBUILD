# Maintainer: Luke Taylor <luket@pm.me>

pkgname=fooyin-plugin-libvgm-git
pkgver=r3.d800a9e
pkgrel=1
pkgdesc="A libvgm plugin for fooyin"
url="https://github.com/fooyin/fooyin-plugin-libvgm"
arch=('x86_64')
license=('GPL-3.0-only')
depends=(
    'fooyin'
)
makedepends=(
    'cmake'
    'git'
)
source=(
    "$pkgname"::"git+https://github.com/fooyin/fooyin-plugin-libvgm.git"
    "libvgm"::"git+https://github.com/ValleyBell/libvgm.git"
)
sha256sums=(
            'SKIP'
            'SKIP'
)

pkgver() {
  cd "$pkgname"
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.3rdparty/libvgm.url "${srcdir}/libvgm"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S "$pkgname" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}


