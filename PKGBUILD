# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=steam-screensaver-fix
pkgver=r4.97cf918
pkgrel=2
epoch=1
pkgdesc='Fix for steam screensaving bug.'
arch=('i686' 'x86_64')
url='https://gitlab.com/patlefort/steam-screensaver-fix'
license=('GPL3')
depends=(
	'steam'
	'glibc')
optdepends=(
	'steam-native-runtime'
)
makedepends=(
	'git'
)
depends_x86_64=(
	'lib32-glibc')
source=(
	"git+https://gitlab.com/patlefort/steam-screensaver-fix.git#commit=97cf9181f2a875b440f239bfee6d4e4246f6a017")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	( set -o pipefail
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	# Build 32 bit version.
	if [ "$CARCH" = 'x86_64' ]; then
		gcc -m32 -shared -fPIC -ldl -o 'sdl_block_screensaver_inhibit_lib32.so' "$pkgname/sdl_fix_steam_screensaver.c"
	fi
	
	# Build native version.
	gcc -shared -fPIC -ldl -o 'sdl_block_screensaver_inhibit.so' "$pkgname/sdl_fix_steam_screensaver.c"
}

package() {
	[ "$CARCH" = 'x86_64' ] && install -Dm755 'sdl_block_screensaver_inhibit_lib32.so' "${pkgdir}/usr/lib32/sdl_block_screensaver_inhibit.so"
	install -Dm755 'sdl_block_screensaver_inhibit.so' -t "${pkgdir}${_prefix}/usr/lib"

	cd "$pkgname"
	install -Dm755 'steam_sdl_injection.sh' 'steam-screensaver-fix-runtime' 'steam-screensaver-fix-native' -t "${pkgdir}/usr/bin/"
	install -Dm755 'steam-screensaver-fix-runtime.desktop' 'steam-screensaver-fix-native.desktop' -t "${pkgdir}/usr/share/applications/"
}
