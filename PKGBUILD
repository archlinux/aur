# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=steam-screensaver-fix
pkgver=2.0.14
pkgrel=1
pkgdesc="Fix for steam screensaving bug."
arch=('i686' 'x86_64')
url="https://github.com/ValveSoftware/steam-for-linux/issues/5607"
license=('GPL3')
depends=('steam')
makedepends=()
source=(
	"https://www.libsdl.org/release/SDL2-${pkgver}.tar.gz"
	'steam-screensaver-fix-runtime.desktop'
	'steam-screensaver-fix-native.desktop'
	'0001-SDL-allow-screensaver.patch'
	'steam_sdl_injection.sh'
	'steam-screensaver-fix-runtime'
	'steam-screensaver-fix-native')
sha256sums=(
	'd8215b571a581be1332d2106f8036fcb03d12a70bae01e20f424976d275432bc'
	'114c7ca82e6b7605c9e88bf569bd7f0d3ddad3f7260ac79c255f7f8f833a5379'
	'1fdb424e1535aae8ae0acf045cc0b251f14563b7423f895abc6110b1da4c4ef1'
	'a2f2935c0ae252a0e0fe924ebf4083b101689347f782c4a48637e41bdee849ef'
	'0580e6f318ecaf32b7342bfcad3becbbe29e780f52555cb3a2af2ffcf5c7e693'
	'f83759374ad89eedae558500ac522b840ec2b9ceda407f9c4c67ec3adbb0bb31'
	'3afff6777e5661922881442b75c601fd01ab4fc637e8e2f1e41b05a109cdafac')

prepare() {
	patch -d "SDL2-${pkgver}" -p1 < "0001-SDL-allow-screensaver.patch"
}

build() {
	# Build 32 bit version.
	mkdir -p "lib32"
	pushd "lib32"
		"../SDL2-${pkgver}"/configure --disable-input-tslib --host=i686-linux-gnu "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32"
		make
	popd
	
	# Build 64 bits version.
	mkdir -p "lib64"
	pushd "lib64"
		"../SDL2-${pkgver}"/configure --disable-input-tslib
		make
	popd
}

package() {
	install -Dm755 "lib32/build/.libs/libSDL2-2.0.so.0" "${pkgdir}/usr/lib32/libSDLsteam.so"
	strip "${pkgdir}/usr/lib32/libSDLsteam.so"
	
	install -Dm755 "lib64/build/.libs/libSDL2-2.0.so.0" "${pkgdir}/usr/lib/libSDLsteam.so"
	strip "${pkgdir}/usr/lib/libSDLsteam.so"
	
	install -Dm755 "steam_sdl_injection.sh" "steam-screensaver-fix-runtime" "steam-screensaver-fix-native" -t "${pkgdir}/usr/bin/"
	
	install -Dm755 "steam-screensaver-fix-runtime.desktop" "steam-screensaver-fix-native.desktop" -t "${pkgdir}/usr/share/applications/"
}
