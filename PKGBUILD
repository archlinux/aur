# Maintainer: Kim Rinnewitz <krinnewitz@plapadoo.de>
_pkgname=sdl2_gpu
_branch=master
pkgname=${_pkgname}-git
pkgver=r734.e3d350b
pkgrel=1
pkgdesc="A library for making hardware-accelerated 2D graphics easy."
arch=('x86_64')
url="https://github.com/grimfang4/sdl-gpu"
license=('MIT')
depends=('sdl2')
makedepends=('cmake' 'git')
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
source=("${_pkgname}-${_branch}::git+https://github.com/grimfang4/sdl-gpu.git#branch=${_branch}"
        "install.patch")
md5sums=('SKIP'
         '63d4f03def4105f98f19f653764fab59')

prepare() {
  cd ${_pkgname}-${_branch}
  patch --forward --strip=1 --input="${srcdir}/install.patch"
}

pkgver() {
  cd ${_pkgname}-${_branch}

  count="$(git rev-list --count HEAD)"
  head="$(git rev-parse --short HEAD)"

  printf "r%s.%s" "${count}" "${head}"
}

build() {
  cd ${_pkgname}-${_branch}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package() {
  cd ${_pkgname}-${_branch}
  make DESTDIR="$pkgdir/" install
}
