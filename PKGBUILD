# Maintainer: Ryan Steed <ryan.steed.usa@pm.me>
# Contributor: Brian Thompson <brianrobt@pm.me>
# Contributor: Self Denial <selfdenial at pm dot me>

pkgname=openmohaa-git
_pkgname="${pkgname/-git/}"
pkgver=0.82.1.r150.0487696
pkgrel=1
pkgdesc="Open re-implementation of Medal of Honor: Allied Assault "
arch=('i686' 'x86_64')
url="https://github.com/openmoh/openmohaa"
license=('GPL-2.0-only')
depends=(
  'openal'
  'sdl2'
  'openjpeg2'
  'libmad'
  'hicolor-icon-theme'
)
makedepends=(
  'cmake'
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
    -D CMAKE_INSTALL_PREFIX="${pkgdir}/usr/"
    -D TARGET_LOCAL_SYSTEM=1
    -D USE_SYSTEM_LIBS=0
    -D CMAKE_BUILD_TYPE=None
    -W no-dev
  )

  cmake "${cmake_options[@]}"
}

package() {
  ninja -C "${srcdir}/${_pkgname}/build" install
  # Workaround for inclusion of recastnavigation headers
  # TODO: submit request to fix upstream
  rm -rf "${pkgdir}/usr/include"
}
