# Maintainer: Brian Thompson <brianrobt@pm.me>
# Contributor: Self Denial <selfdenial at pm dot me>

pkgname=openmohaa-git
_pkgname="${pkgname/-git/}"
pkgver=0.81.1.r503.gbe43b16
pkgrel=1
pkgdesc="Open re-implementation of Medal of Honor: Allied Assault "
arch=('i686' 'x86_64')
url="https://github.com/openmoh/openmohaa"
license=('GPL2')
depends=(
  'openal'
  'sdl2'
  'openjpeg2'
  'libmad'
  'hicolor-icon-theme'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)
conflicts=("${_pkgname}")
options=(!lto)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local cmake_options=(
    -G Ninja
    -B "${srcdir}/${_pkgname}/build"
    -S "${srcdir}/${_pkgname}"
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/"
    -DTARGET_LOCAL_SYSTEM=1
    -DUSE_SYSTEM_LIBS=0
    -DCMAKE_BUILD_TYPE='None'
    -Wno-dev
  )

  cmake "${cmake_options[@]}"
}

package() {
  ninja -C "${srcdir}/${_pkgname}/build" install
}