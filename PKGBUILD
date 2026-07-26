# Maintainer: Eldred Habert <arch@eldred.fr>
# Contributor: kleines Filmröllchen <kleines@filmroellchen.eu>

pkgname=mesen2-git
pkgver=r3765.4b99a0f2
pkgrel=1
pkgdesc="Multi-system emulator (NES, SNES, Game Boy and PC Engine)"
arch=('x86_64')
url="https://www.mesen.ca"
license=('GPL3')
depends=(libevdev sdl2)
makedepends=(dotnet-sdk-10.0 git zip clang coreutils)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!strip !debug) # Reportedly, these break with C#..?
source=(${pkgname%-git}::'git+https://github.com/nesdev-org/MesenCE.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	MAKEFLAGS="${MAKEFLAGS} -j$(nproc)" make  LTO=true SYSTEM_LIBEVDEV=true STATICLINK=false USE_AOT=true # Uses Clang by default, which speeds up emulation by about 40%.
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 755 "bin/linux-x64/Release/linux-x64/publish/Mesen" "$pkgdir/usr/bin/Mesen" # Note that this exact executable name is referenced in the desktop file.
	install -Dm 644 "Linux/appimage/Mesen.desktop" "$pkgdir/usr/share/applications/Mesen.desktop"
	install -Dm 644 "Linux/appimage/Mesen.48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/Mesen.png"
}
