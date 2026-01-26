# Maintainer: asyync1024 <asyync1024 at proton dot me>
# Contributor: yubimusubi <possum plus aur at possum dot cc>

_pkgname=3dstool
pkgname=${_pkgname}-git
pkgver=1.2.6.r15.g3771ae96
pkgrel=1
epoch=1
pkgdesc="An all-in-one tool for extracting/creating 3ds roms"
arch=('x86_64')
url="https://github.com/dnasdw/${_pkgname}"
license=('MIT')
depends=('glibc' 'curl' 'openssl')
makedepends=('cmake' 'git')
source=(
  "git+${url}.git"
  "${_pkgname}-paths.patch"
)
sha256sums=(
  'SKIP'
  '5ac00e5b56182ffde04c7b9ab2a5151e6cf575400705f0b061ff832116757582'
)
provides=(${_pkgname})
conflicts=(${_pkgname})

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  cd ${_pkgname}
  patch -Np1 -i ../${_pkgname}-paths.patch
}

build() {
  cd ${_pkgname}

  cmake -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D BUILD64=ON \
    -D USE_DEP=OFF \
    -D CMAKE_SKIP_RPATH=ON \
    -D CMAKE_BUILD_WITH_INSTALL_RPATH=OFF

  cmake --build build
}

package() {
  cd ${_pkgname}

  install -Dm755 bin/Release/${_pkgname} -t \
    "${pkgdir}/usr/bin/"

  install -Dm644 bin/ignore_${_pkgname}.txt -t \
    "${pkgdir}/usr/share/${_pkgname}/"

  install -Dm644 LICENSE -t \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2 sw=2 et:
