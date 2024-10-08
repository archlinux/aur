# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Chris <christopher.r.mullins g-mail>

pkgname=commontk-git
pkgrel=1
pkgver=2023.07.13.r158.gd7ce6d91
pkgdesc="set of common support code for medical imaging, surgical navigation, and related purposes"
arch=(x86_64)
url="https://github.com/commontk/CTK"
license=(Apache-2.0)
depends=(qt5-base gcc-libs glibc)
makedepends=(git cmake qt5-svg qt5-tools python)
checkdepends=(xorg-server-xvfb)
optdepends=('python: For scripting support')
provides=(commontk)
conflicts=(commontk)
source=("git+https://github.com/commontk/CTK.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir"/CTK
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
    -DCTK_SUPERBUILD:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCTK_LIB_Widgets:BOOL=ON \
    -DCTK_ENABLE_Python_Wrapping:BOOL=OFF \
  )

  cmake -B build -S "CTK" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

#check() {
#  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local' ctest --test-dir build --output-on-failure
#}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
