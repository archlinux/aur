# Maintainer Chris Rizzitello <sithlord48@gmail.com>
# Contributor: Previous Maintainer: SelfRef <arch@selfref.dev>

# INFO: By default this package is configured to use Wayland only.
#       In order to complile version for use with X11, install optional dependencies for that case.

# TIP: You can speed up compiling process by setting `MAKEFLAGS="-j $(nproc)"` (or a fixed number)
#      in your `/etc/makepkg.conf` file to use more threads.

_basename=deskflow
pkgname=${_basename}-git
pkgver=1.18.0.86.g3f3116d
pkgrel=1
pkgdesc="Deskflow lets you share one mouse and keyboard between multiple computers"
arch=('i686' 'x86_64' 'aarch64')
url="https://deskflow.org/"
license=(LicenseRef-GPL-2.0-only-WITH-OpenSSL-Exception)
depends=(
	'libxtst'
	'libxkbcommon'
	'libxkbfile'
	'libxinerama'
	'libnotify'
	'libei'
	'libportal'
	'qt6-base'
	'gdk-pixbuf2'
	'pugixml'
	'tomlplusplus'
	'openssl'
)
makedepends=(
	'git'
	'cmake'
	'python'
	'libxkbfile'
	'gtest'
	'cli11'
)
optdepends=(
	'gtk3: GTK file/dir picker'
	# 'libx11: X11 support' # dependency of libxtst
	# 'libxext: X11 support' # dependency of libxtst
	# 'libxi: X11 support' # dependency of libxtst
	'libxkbcommon-x11: X11 support'
	'libxrandr: X11 support'
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
	./build/bin/unittests
	./build/bin/integtests
}

package() {
	cd "$_basename"
	DESTDIR="$pkgdir" cmake --install build
}
