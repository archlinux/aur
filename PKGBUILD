# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-pcsx2
pkgname=$_pkgname-git
pkgver=r11818.7de89581c
pkgrel=1
pkgdesc="Sony PlayStation 2 core"
arch=('x86_64')
url="https://github.com/libretro/pcsx2"
license=('GPL2' 'GPL3' 'LGPL2.1' 'LGPL3')
groups=('libretro')
depends=('glib2' 'libaio' 'libgl' 'libretro-core-info' 'systemd-libs')
makedepends=('ccache' 'cmake' 'git' 'libglvnd' 'systemd' 'vim')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	'fix-linking.patch'
)
b2sums=(
	'SKIP'
	'e014e39b50c031d28c271cfc36fef8c1f54f87771c5f1e4fbf7c680d432a76736b19043697d4789e2b72b7d9eea69f500dc405a38773fe13d667231a54ed519e'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	patch -Np1 < ../fix-linking.patch
}

build() {
	cmake -S $_pkgname -B build \
		-DARCH_FLAG="" \
		-DCMAKE_BUILD_TYPE=Release \
		-DLIBRETRO=ON \
		-DOPTIMIZATION_FLAG="" \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro build/pcsx2/pcsx2_libretro.so
}
