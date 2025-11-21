# Maintainer Chris Rizzitello <sithlord48@gmail.com>
# Contributor: Previous Maintainer: SelfRef <arch@selfref.dev>

# INFO: By default this package is configured to use Wayland only.
#       In order to complile version for use with X11, install optional dependencies for that case.

# TIP: You can speed up compiling process by setting `MAKEFLAGS="-j $(nproc)"` (or a fixed number)
#      in your `/etc/makepkg.conf` file to use more threads.

_basename=deskflow
pkgname=${_basename}-git
pkgver=1.25.0.0.gd4ff55d
pkgrel=1
pkgdesc="Deskflow lets you share one mouse and keyboard between multiple computers"
arch=('i686' 'x86_64' 'aarch64')
url="https://deskflow.org/"
license=(LicenseRef-GPL-2.0-only-WITH-OpenSSL-Exception)
depends=(
  gcc-libs
  glib2
  glibc
  hicolor-icon-theme
  libei
  libglvnd
  libice
  libportal
  libsm
  libx11
  libxext
  libxi
  libxinerama
  libxkbcommon
  libxkbcommon-x11
  libxkbfile
  libxrandr
  libxtst
  openssl
  qt6-base
  qt6-svg
  qt6-translations
)
makedepends=(
  cmake
  git
  gtest
  ninja
  python
  qt6-tools
  qt6-declarative
  xorgproto
)

provides=("$_basename")
conflicts=('synergy-git' 'synergy-1.6' 'synergy1-bin' 'synergy2-bin' 'synergy3-bin' 'synergy3-beta-bin' 'synergy3-stable-bin' 'barrier' 'barrier-git' 'barrier-headless' 'barrier-headless-git' 'input-leap' 'input-leap-git' 'input-leap-headless-git' 'input-leap-headless' 'waynergy' 'waynergy-git' 'qsynergy' 'slim-synergy' 'quicksynergy' 'deskflow')
source=("$_basename::git+https://github.com/deskflow/deskflow.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_basename"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/\1/;s/-/./g;s/^v//'
}

build() {
	cd "$_basename"
	cmake \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_C_FLAGS="${CFLAGS}" \
	-DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
	-DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
	-DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
	-Wno-dev \
	-G Ninja \
	-B build \
	-S .
  cmake --build build --verbose
}

check() {
	cd "$_basename"
	export QT_QPA_PLATFORM=offscreen
	./build/bin/legacytests
}

package() {
	cd "$_basename"
	DESTDIR="$pkgdir" cmake --install build
}
