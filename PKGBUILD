# Maintainer: Adrian Siekierka <kontakt@asie.pl>
# Contributor: Eldred Habert <arch@eldred.fr>
# Contributor: kleines Filmröllchen <kleines@filmroellchen.eu>

pkgname=mesen-ce-git
pkgver=r3765.4b99a0f
pkgrel=1
pkgdesc="Multi-system emulator (NES, SNES, GB, GBA, PCE, SMS/GG, WS)"
arch=('x86_64')
url="https://github.com/nesdev-org/MesenCE"
license=('GPL-3.0-only')
depends=(libevdev sdl2)
makedepends=(dotnet-sdk-10.0 git zip clang coreutils)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!strip !debug) # Reportedly, these break with C#..?
source=(${pkgname%-git}::'git+https://github.com/nesdev-org/MesenCE.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	sed -i -e 's/Exec=Mesen/Exec=mesen-ce/' -e 's/Icon=Mesen/Icon=mesen-ce/' 'Linux/appimage/Mesen.desktop'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make LTO=true SYSTEM_LIBEVDEV=true STATICLINK=false USE_AOT=true # Uses Clang by default, which speeds up emulation by about 40%.
}

package() {
	cd "$srcdir/${pkgname%-git}/bin/linux-x64/Release/linux-x64/publish"
	install -Dm 755 Mesen "$pkgdir/usr/bin/${pkgname%-git}"

	cd "$srcdir/${pkgname%-git}"
	install -Dm644 'Linux/appimage/Mesen.desktop' "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
	install -Dm644 'Linux/appimage/Mesen.48x48.png' "${pkgdir}/usr/share/icons/${pkgname%-git}.png"

	install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"
}
