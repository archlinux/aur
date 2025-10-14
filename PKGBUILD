# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=steam-screensaver-fix
pkgver=r7.6eb0233
pkgrel=1
epoch=1
pkgdesc='Fix for steam screensaving bug.'
arch=('i686' 'x86_64')
url='https://gitlab.com/patlefort/steam-screensaver-fix'
license=('GPL-3.0-only')
depends=()
makedepends=('git')
depends_x86_64=('lib32-glibc' 'lib32-gcc-libs')
source=("git+https://gitlab.com/patlefort/steam-screensaver-fix.git#commit=6eb02337db224207172cbff33654af5da08636fa")
sha256sums=('ab9e8b07457ba19d8190d0239972f8bc15d950615e036a36ad19a9b3efd0766d')

pkgver() {
	cd "${pkgname}"
	( set -o pipefail
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	CC="${CC:-gcc}"

	# Build 32 bit version.
	if [ "$CARCH" = 'x86_64' ]; then
		$CC $CFLAGS $LDFLAGS -m32 -shared -fPIC -ldl -o 'sdl_block_screensaver_inhibit_lib32.so' "$pkgname/sdl_fix_steam_screensaver.c"
	fi

	# Build native version.
	$CC $CFLAGS $LDFLAGS -shared -fPIC -ldl -o 'sdl_block_screensaver_inhibit.so' "$pkgname/sdl_fix_steam_screensaver.c"
}

package() {
	depends+=('steam' 'sdl2')
	optdepends=('steam-native-runtime')

	[ "$CARCH" = 'x86_64' ] && install -Dm755 'sdl_block_screensaver_inhibit_lib32.so' "${pkgdir}/usr/lib32/sdl_block_screensaver_inhibit.so"
	install -Dm755 'sdl_block_screensaver_inhibit.so' -t "${pkgdir}${_prefix}/usr/lib"

	cd "$pkgname"
	install -Dm755 'steam_sdl_injection.sh' 'steam-screensaver-fix-runtime' 'steam-screensaver-fix-native' -t "${pkgdir}/usr/bin/"
	install -Dm755 'steam-screensaver-fix-runtime.desktop' 'steam-screensaver-fix-native.desktop' -t "${pkgdir}/usr/share/applications/"
}
