# Maintainer: Captain Cave
_pkgname=corona
pkgname=solar2d-git
pkgver=3730.r0.770a60cd
pkgrel=1
install=solar2d-git.install
pkgdesc="Solar2D (formerly Corona SDK) cross-platform game engine"
arch=('x86_64')
url="https://github.com/coronalabs/corona"
license=('MIT')
depends=('glu' 'zlib' 'openal' 'freetype2' 'libpng' 'libjpeg' 'openssl-1.1' 'curl' 'sdl2' 'java-runtime')
makedepends=('git' 'cmake')
provides=('Solar2D')
conflicts=('Solar2D')
source=("git+https://github.com/coronalabs/corona.git#branch=master"
        "Solar2D.desktop")
sha256sums=('SKIP'
            '6f482f05a09b2372901c6d5ff6e8e1a0c9b8a39dc8b49ea0acc1c10e3ed338e4')

# Disable LTO and buildflags to prevent errors with legacy code on modern GCC
options=('!lto' '!buildflags')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  # Initialize and update submodules recursively
  git submodule update --init --recursive
}

build() {
  # Unset Arch default flags that cause compilation failures with this codebase
  unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS

  # Add essential flags for legacy C++ compatibility
  local _common_flags="-fpermissive -Wno-error=incompatible-pointer-types"

  cmake -S "$srcdir/$_pkgname" -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_OUT_OF_TREE=On \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_C_FLAGS="$_common_flags" \
    -DCMAKE_CXX_FLAGS="$_common_flags"

  cmake --build build
}

package() {
  # Use DESTDIR to redirect installation to the package directory
  DESTDIR="$pkgdir" cmake --install build
  ln -s /usr/bin/Solar2D/Solar2D "${pkgdir}/usr/bin/solar2d"
  install -Dm644 "${srcdir}/Solar2D.desktop" "${pkgdir}/usr/share/applications/Solar2D.desktop"
}
