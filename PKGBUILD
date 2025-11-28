# Maintainer: Kaito Udagawa <umireon at gmail dot com>
# Contributor: Ng Oon-Ee <n g o o n e e dot t a l k @ gmail dot com>
# Based on obs-backgroundremoval PKGBUILD by PedroHLC <root@pedrohlc.com>
pkgname=obs-backgroundremoval-git
_pkgname="${pkgname%-git}"
pkgver=1.3.5.r1.gfbd855d
pkgrel=1
pkgdesc='Background removal plugin for OBS studio'
arch=('x86_64')
url='https://github.com/royshil/obs-backgroundremoval'
license=('GPL-3.0-or-later')
depends=('curl' 'obs-studio' 'onnxruntime' 'opencv')
makedepends=('cmake' 'git' 'ninja')
provides=("${_pkgname}" "${_pkgname}-debug")
conflicts=("${_pkgname}" "${_pkgname}-debug")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_FRONTEND_API=ON \
    -DENABLE_QT=ON \
    -DUSE_PKGCONFIG=ON \
    -DUSE_SYSTEM_ONNXRUNTIME=ON \
    -GNinja
  cmake --build build
}

package() {
  cd "${_pkgname}"
  DESTDIR="$pkgdir" cmake --install build
}
