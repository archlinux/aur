# Maintainer: Avenge Media <avengemediallc at gmail dot com>

pkgname=dux-qt-base-git
_pkgname=${pkgname%-git}
pkgver=0.3.2.r913.g032cf5e
pkgrel=1
pkgdesc='Quickshell QML runtime as a shared library with a C entry point (git)'
arch=(x86_64 aarch64)
url="https://github.com/duxlabs-dev/$_pkgname"
license=(LGPL-3.0-only)
depends=(gcc-libs
         glib2
         libdrm
         libglvnd
         libpipewire
         libxcb
         libxkbcommon
         mesa
         pam
         polkit
         qt6-base
         qt6-declarative
         qt6-wayland
         wayland)
makedepends=(cli11
             cmake
             git
             ninja
             pkgconf
             qt6-shadertools
             spirv-tools
             vulkan-headers
             wayland-protocols)
optdepends=('qt6-svg: svg images and icons')
provides=("$_pkgname=$pkgver" libdux-qt-base.so)
conflicts=("$_pkgname" "$_pkgname-bin")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	local base
	base=$(sed -n 's/^project(.*VERSION "\([^"]*\)".*/\1/p' CMakeLists.txt)
	printf '%s.r%s.g%s' "$base" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cmake -GNinja -S "$_pkgname" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DDISTRIBUTOR="AUR ($pkgname)" \
		-DGIT_REVISION="$(git -C "$_pkgname" rev-parse HEAD)"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "$_pkgname/LICENSE" "$_pkgname/LICENSE-GPL"
}
