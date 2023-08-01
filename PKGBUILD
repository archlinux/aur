# Maintainer: Eldred Habert <arch@eldred.fr>
pkgname=mesen2-git
pkgver=r2446.94a9956c
pkgrel=2
pkgdesc="Multi-system emulator (NES, SNES, Game Boy and PC Engine)"
arch=('x86_64')
url="https://www.mesen.ca"
license=('GPL3')
depends=('dotnet-runtime-6.0' 'libevdev' 'sdl2')
makedepends=('dotnet-sdk-6.0' 'git' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!strip)
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
	make LTO=true SYSTEM_LIBEVDEV=true STATICLINK=false USE_GCC=true # GCC is part of `base-devel`, `clang` is not.
	# FIXME: this is currently required because the first build generates two dependency `.so`s
	#        *after* they are necessary.
	make LTO=true SYSTEM_LIBEVDEV=true STATICLINK=false USE_GCC=true
}

package() {
	cd "$srcdir/${pkgname%-git}/bin/linux-x64/Release/linux-x64/publish"
	install -Dm 755 Mesen "$pkgdir/usr/bin/${pkgname%-git}"
}
