# Maintainer: jlaunay
pkgname=hyprlang-git
pkgver=r32.1210de1
pkgrel=1
pkgdesc="hyprlang - the hypr configuration language"
arch=('any')
url="https://github.com/hyprwm/hyprlang"
license=("GPL")
depends=('bash')
makedepends=('git')
provides=('hyprlang')
source=("git+https://github.com/hyprwm/${pkgname/-git/}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname/-git/}"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	# cd "${pkgname/-git/}"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S "${pkgname/-git/}" -B build
	cmake --build ./build --config Release --target hyprlang -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)

}

package() {
	# cd "${pkgname/-git/}"
	DESTDIR="$pkgdir" cmake --install build
}
