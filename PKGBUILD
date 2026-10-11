# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: thyTwilightGoth <https://aur.archlinux.org/account/thyTwilightGoth>
# Contributor: Pedro <https://aur.archlinux.org/account/PedroHLC>

pkgname=wlcs-git
pkgver=1.8.1.r274.g933bc61
pkgrel=2
pkgdesc="Canonical's protocol-conformance-verifying test suite for Wayland compositor implementations."
arch=(x86_64 armv7h aarch64)
url="https://github.com/canonical/wlcs"
license=('GPL-2.0-or-later OR GPL-3.0-or-later')
depends=(
    glibc
    gtest
    libasan
    libgcc
    libstdc++
    libtsan
    libubsan
    wayland
    )
makedepends=(
    boost
    cmake
    git
    wayland-protocols
    )
provides=(wlcs)
conflicts=(wlcs)
source=("git+https://github.com/canonical/wlcs.git")
sha512sums=('SKIP')

pkgver() {
  cd wlcs
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CFLAGS+=" -Wno-error=deprecated-declarations"
  export CXXFLAGS+=" -Wno-error=deprecated-declarations"

	local _flags=(
    -DCMAKE_INSTALL_LIBDIR=lib/
    -DCMAKE_INSTALL_LIBEXECDIR=bin/
	)

  cmake -B build -S "wlcs" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
