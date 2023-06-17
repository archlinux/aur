# Maintainer: Aaron Abbott <aabmass at gmail dot com>
#
# Adapted from community repo neovim-qt PKGBUILD
# https://gitlab.archlinux.org/archlinux/packaging/packages/neovim-qt/-/blob/main/PKGBUILD

pkgname=neovim-qt-git
pkgver=0.2.16.r207.gb4ca557
pkgrel=1
pkgdesc='GUI for Neovim (git version)'
arch=(x86_64)
url='https://github.com/equalsraf/neovim-qt'
license=(ISC)
depends=(neovim qt5-svg hicolor-icon-theme)
makedepends=(cmake git ninja)
checkdepends=(ttf-dejavu xorg-server-xvfb)
source=("$pkgname::git+$url")
conflicts=('neovim-qt')
provides=('neovim-qt')
b2sums=('SKIP')

# Copied from https://wiki.archlinux.org/title/VCS_package_guidelines#Git
pkgver() {
  cd "$pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_C_FLAGS="$CFLAGS" \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS" \
    -D CMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D USE_SYSTEM_MSGPACK=on \
    -D ENABLE_TESTS=on \
    -G Ninja \
    -S $pkgname
  ninja -C build
}

check() {
  xvfb-run ninja -v -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE"
}
