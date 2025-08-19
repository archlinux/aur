# Maintainer: Brian Thompson <brianrobt@pm.me>
# Contributor: Self Denial <selfdenial at pm dot me>

pkgname=openmohaa-git
_pkgname="${pkgname/-git/}"
pkgver=0.82.1.r33.555caa1
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
  version=$(git tag --sort=-version:refname | head -1)
  count=r$(git rev-list --count $version..HEAD)
  id=$(git rev-parse --short=7 HEAD)
  full_ver=$(echo "$version.$count.$id" | cut -dv -f2)
  echo "$full_ver"
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