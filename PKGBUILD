# Maintainer: Kaito Udagawa <umireon at gmail dot com>
# Contributor: Ng Oon-Ee <n g o o n e e dot t a l k @ gmail dot com>
# Based on obs-backgroundremoval PKGBUILD by PedroHLC <root@pedrohlc.com>
pkgname=obs-backgroundremoval-git
_pkgname="${pkgname%-git}"
pkgver=1.3.0.rc4.r1.gd80cb28
pkgrel=1
pkgdesc="Background removal plugin for OBS studio"
arch=('x86_64')
url='https://github.com/royshil/obs-backgroundremoval'
license=('GPL-3.0-or-later')
depends=('obs-studio' 'curl' 'opencv' 'onnxruntime')
makedepends=('git' 'cmake' 'ninja')
provides=("${_pkgname}" "${_pkgname}-debug")
conflicts=("${_pkgname}" "${_pkgname}-debug")
source=("${_pkgname}::git+https://github.com/royshil/${_pkgname}.git")
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
    -DDISABLE_ONNXRUNTIME_GPU=ON \
    -GNinja
  cmake --build build
}

package() {
  cd "${_pkgname}"
  DESTDIR="$pkgdir" cmake --install build
}
