# Maintainer: jlaunay
pkgname=hyprlang-git
pkgver=0.2.0.r0.5cb3d2b
pkgrel=1
pkgdesc="hyprlang - the hypr configuration language"
arch=('any')
url="https://github.com/hyprwm/hyprlang"
license=("GPL")
depends=('bash')
makedepends=('git' 'cmake' 'gcc')
provides=('hyprlang')
source=("${pkgname/-git/}::git+https://github.com/hyprwm/${pkgname/-git/}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname/-git/}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname/-git/}"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=${PKGDIR}/usr -S . -B build
	cmake --build ./build --config Release --target hyprlang -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)

}

package() {
	cd "${srcdir}/${pkgname/-git/}"
	DESTDIR="$pkgdir" cmake --install build
}
