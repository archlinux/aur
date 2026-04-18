# Maintainer: Fay Wong <i@faywong.cc>

pkgname=rime-webdav-git
pkgver=0.r7.gf64038c
pkgrel=1
pkgdesc="Qt GUI for syncing Rime user data over WebDAV"
arch=('x86_64')
url="https://github.com/faywong/rime-webdav"
license=('GPL-3.0-or-later')
provides=('rime-webdav')
conflicts=('rime-webdav')
depends=(
  'curl'
  'librime'
  'openssl'
  'pugixml'
  'qt6-base'
)
makedepends=(
  'cmake'
  'gcc'
  'pkgconf'
)
source=('git+https://github.com/faywong/rime-webdav.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/rime-webdav"
  printf "0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  local src="${srcdir}/rime-webdav"
  cmake -S "${src}" -B "${src}/build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "${src}/build" --parallel
}

package() {
  local src="${srcdir}/rime-webdav"
  DESTDIR="${pkgdir}" cmake --install "${src}/build"

  install -Dm644 "${src}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
