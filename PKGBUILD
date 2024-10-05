# Maintainer: SelfRef <arch@selfref.dev>

# INFO: By default this package is configured to use Wayland only.
#       In order to complile version for use with X11, install optional dependencies for that case.

_basename=deskflow
pkgname=${_basename}-git
pkgver=1.18.0.r2.ge3ed711
pkgrel=2
pkgdesc="Deskflow lets you share one mouse and keyboard between multiple computers (git version)"
arch=('x86_64')
url="https://deskflow.org/"
license=('GPL-2.0')
depends=(
	'libxtst'
	'libxkbcommon'
	'libnotify'
	'libei'
	'libportal'
	'qt6-base'
	'gdk-pixbuf2'
	'pugixml'
)
makedepends=(
	'git'
	'cmake'
	'python'
	'libxkbfile'
	'gtest'
	'tomlplusplus'
	'cli11'
)
optdepends=(
	'openssl: TLS encryption'
	'gtk3: GTK file/dir picker'
	# 'libx11: X11 support' # dependency of libxtst
	# 'libxext: X11 support' # dependency of libxtst
	# 'libxi: X11 support' # dependency of libxtst
	'libxkbcommon-x11: X11 support'
	'libxkbfile: X11 support'
	'libxinerama: X11 support'
	'libxrandr: X11 support'
)
provides=("$_basename")
conflicts=("$_basename")
source=("$_basename::git+https://github.com/deskflow/deskflow.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_basename"
	git describe --long --tags --abbrev=7 | sed 's/-[a-z]*//;s/-[0-9]-g/.g/;s/[-+]/./'
}

prepare() {
	cd "$_basename"
	cmake -B build
}

build() {
	cd "$_basename"
	cmake --build build
}

check() {
	cd "$_basename"
	./build/bin/unittests
	./build/bin/integtests
}

package() {
	cd "$_basename"
	DESTDIR="$pkgdir" cmake --install build
}
