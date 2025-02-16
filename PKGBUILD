# Maintainer: Erik Reider <erik.reider@protonmail.com>

_base_version=0.2

pkgname="scenefx-git"
pkgver=r269.87c0e8b
pkgrel=1
license=("MIT")
pkgdesc="A drop-in replacement for the wlroots scene API that allows wayland compositors to render surfaces with eye-candy effects"
url="https://github.com/wlrfx/scenefx"
arch=("x86_64")
depends=(
	"libglvnd"
	"wayland"
	"libdrm"
	"libpixman-1.so"
	"libwlroots-0.18.so"
)
makedepends=(
	"git"
	"glslang"
	"meson"
	"ninja"
	"wayland-protocols"
)
optdepends=()
provides=("libscenefx-$_base_version.so")
replaces=("scenefx")
options=("debug")
source=("${pkgname%-*}::git+${url}.git")
sha512sums=("SKIP")

pkgver() {
	cd "scenefx"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export PKG_CONFIG_PATH='/usr/lib/wlroots0.18/pkgconfig'
	arch-meson -Dwerror=false "scenefx" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
