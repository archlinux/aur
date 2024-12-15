# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=sdl12-compat-git
pkgver=1.2.68.r17.g75ac6c6
pkgrel=1
pkgdesc="An SDL-1.2 compatibility layer that uses SDL 2.0 behind the scenes."
arch=("x86_64")
url="https://github.com/libsdl-org/sdl12-compat"
license=('Zlib')
depends=('sdl2' 'glibc' 'glu' 'bash')
makedepends=('cmake' 'git' 'ninja')
conflicts=('sdl' 'sdl12-compat')
provides=('sdl=1:1.2.15+r406+gf1caf909-1' 'sdl12-compat')
source=("git+https://github.com/libsdl-org/sdl12-compat.git")
sha256sums=('SKIP')


pkgver() {
  cd "${pkgname::-4}"
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^prerelease.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/"

	cmake -B build -S "${pkgname::-4}" \
	-G Ninja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_C_FLAGS="$CFLAGS" \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DSDL12TESTS=0 \
	-DSDL12DEVEL=1

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build

	mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
	install -Dm644 "$srcdir/${pkgname::-4}/LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
