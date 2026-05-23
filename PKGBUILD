# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Thomas Lercher <aur@tlercher.de>
# Contributor: NiNjA <heinep at gmail dot com>

pkgname=augustus-git
pkgdesc="An enhanced re-implementation of Caesar III (Original copy required)"
pkgver=4.0.0.r1370.g0e3c389
pkgrel=1
arch=(x86_64 i686)
url="https://github.com/Keriew/augustus"
license=(AGPL-3.0-only)
depends=(sdl3 sdl3_mixer glibc)
makedepends=(git cmake nasm)
provides=(augustus)
conflicts=(augustus augustus-game)
replaces=(augustus-game)
source=("git+https://github.com/Keriew/augustus.git"
		"git+https://github.com/crudelios/easyav1.git"
		"git+https://code.videolan.org/videolan/dav1d.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "augustus"
  git submodule init
  git config submodule.ext/easyav1.url "${srcdir}/easyav1"
  git -c protocol.file.allow=always submodule update

  cd "ext/easyav1"
  git submodule init
  git config submodule.ext/dav1d.url "${srcdir}/dav1d"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd "augustus"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
    -DSDL_VERSION=3
  )

  cmake -B build -S "augustus" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
