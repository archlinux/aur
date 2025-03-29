# Maintainer: Eldred Habert <arch@eldred.fr>
# Contributor: kleines Filmröllchen <kleines@filmroellchen.eu>

pkgname=mesen2-git
pkgver=r3343.af9eda35
pkgrel=1
pkgdesc="Multi-system emulator (NES, SNES, Game Boy and PC Engine)"
arch=('x86_64')
url="https://www.mesen.ca"
license=('GPL3')
depends=(libevdev sdl2)
makedepends=(dotnet-sdk-8.0 git zip clang coreutils)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!strip !debug) # Reportedly, these break with C#..?
source=(${pkgname%-git}::'git+https://github.com/SourMesen/Mesen2.git')
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	MAKEFLAGS="${MAKEFLAGS} -j$(nproc)" make  LTO=true SYSTEM_LIBEVDEV=true STATICLINK=false USE_AOT=true # Uses Clang by default, which speeds up emulation by about 40%.
}

package() {
	cd "$srcdir/${pkgname%-git}/bin/linux-x64/Release/linux-x64/publish"
	install -Dm 755 Mesen "$pkgdir/usr/bin/${pkgname%-git}"
}
