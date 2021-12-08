# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=steam-screensaver-fix
pkgver=2.0.18
pkgrel=1
pkgdesc='Fix for steam screensaving bug.'
arch=('i686' 'x86_64')
url='https://github.com/ValveSoftware/steam-for-linux/issues/5607'
license=('GPL3')
depends=(
	'steam'
	'glibc'
	'libxext'
	'libxrender'
	'libx11'
	'libgl'
	'libxcursor'
	'libibus'
	'hidapi'
	'libusb')
depends_x86_64=(
	'lib32-glibc'
	'lib32-libxext'
	'lib32-libxrender'
	'lib32-libx11'
	'lib32-libgl'
	'lib32-libxcursor')
makedepends=(
	'cmake'
	'jack'
	'wayland-protocols'
	'alsa-lib'
	'mesa'
	'libpulse'
	'libxrandr'
	'libxinerama'
	'wayland'
	'libxkbcommon'
	'wayland-protocols'
	'ibus'
	'fcitx'
	'libxss'
	'pipewire'
	'libdecor')
makedepends_x86_64=(
  'lib32-alsa-lib'
  'lib32-mesa'
  'lib32-libpulse'
  'lib32-libxrandr'
  'lib32-libxinerama'
  'lib32-wayland'
  'lib32-libxkbcommon'
  'lib32-libxss'
  'lib32-pipewire')
source=(
	"https://www.libsdl.org/release/SDL2-${pkgver}.tar.gz"{,.sig}
	'steam-screensaver-fix-runtime.desktop'
	'steam-screensaver-fix-native.desktop'
	'0001-SDL-allow-screensaver.patch'
	'steam_sdl_injection.sh'
	'steam-screensaver-fix-runtime'
	'steam-screensaver-fix-native')
sha256sums=('94d40cd73dbfa10bb6eadfbc28f355992bb2d6ef6761ad9d4074eff95ee5711c'
            'SKIP'
            '114c7ca82e6b7605c9e88bf569bd7f0d3ddad3f7260ac79c255f7f8f833a5379'
            '1fdb424e1535aae8ae0acf045cc0b251f14563b7423f895abc6110b1da4c4ef1'
            'a2f2935c0ae252a0e0fe924ebf4083b101689347f782c4a48637e41bdee849ef'
            'fe684fd277bb27cc79c9648d2d44ae9e936717f32b7c099ba05579dd53524840'
            'c14b0f0a7a901d02de53ef7a511b7df7e87d670abb3181872a823d1ce57330f2'
            'bcb88dd0640f53576c949a9f6e2c2c4b7af3665ea080c6e9a89ac9ac398cb220')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6')

_flags=( 
	-DSDL_STATIC=OFF
	-DSDL_DLOPEN=ON
	-DSDL_ARTS=OFF
	-DSDL_ESD=OFF
	-DSDL_NAS=OFF
	-DSDL_ALSA=ON
	-DSDL_PULSEAUDIO_SHARED=ON
	-DSDL_VIDEO_WAYLAND=ON
	-DSDL_RPATH=OFF
	-DSDL_CLOCK_GETTIME=ON
	-DSDL_JACK_SHARED=ON
	-DSDL_PIPEWIRE=ON
	-DSDL_PIPEWIRE_SHARED=ON
	-DSDL_XINPUT=ON
	-DSDL_HIDAPI=ON)

prepare() {
	cd "SDL2-${pkgver}"
	patch -p1 -i "${srcdir}/0001-SDL-allow-screensaver.patch"
	#patch -p1 -i "${srcdir}/fix-hidapi.patch"
	sed -i '/pkg_search_module.*ibus-1.0/d' 'CMakeLists.txt'
}

build() {
	# Build 32 bit version.
	if [ "$CARCH" = 'x86_64' ]; then
	(
		export CC='gcc -m32'
		export CXX='g++ -m32'
		export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
		cmake -S "SDL2-${pkgver}" -B 'lib32' "${_flags[@]}"
		cmake --build 'lib32'
	)
	fi
	
	# Build native version.
	cmake -S "SDL2-${pkgver}" -B 'libnative' "${_flags[@]}"
	cmake --build 'libnative'
	
}

package() {
	[ "$CARCH" = 'x86_64' ] && install -Dm755 'lib32/libSDL2-2.0.so' "${pkgdir}/usr/lib32/libSDLsteam.so"
	install -Dm755 'libnative/libSDL2-2.0.so' "${pkgdir}/usr/lib/libSDLsteam.so"
	
	install -Dm755 'steam_sdl_injection.sh' 'steam-screensaver-fix-runtime' 'steam-screensaver-fix-native' -t "${pkgdir}/usr/bin/"
	install -Dm755 'steam-screensaver-fix-runtime.desktop' 'steam-screensaver-fix-native.desktop' -t "${pkgdir}/usr/share/applications/"
}
