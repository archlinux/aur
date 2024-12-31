# Contributor: Lari Tikkanen <lartza@wippies.com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: ApertureUA <alekseipesorin@outlook.com>

pkgname=f-client-git
pkgver=0.7.5_3.4.1
pkgrel=1
pkgdesc='A QoL mod for TeeWorlds: a fast-paced multiplayer 2D shooter game'
arch=('x86_64' 'pentium4' 'riscv64' 'ppc64') # ALARM is dead :(
# i386 isn't included because it's generally a shit experience anyway
url="https://github.com/fokkonaut/F-Client"
license=('custom' 'CCPL:by-nc-sa')
depends=('alsa-lib' 'glu' 'sdl2' 'freetype2' 'pnglite' 'wavpack' 'openssl')
makedepends=('python' 'git' 'cmake' 'ninja' 'imagemagick' 'gtest')
provides=('teeworlds' 'teeworlds-git')
conflicts=('teeworlds' 'teeworlds-git') # same server executable, data dir conflict
source=('git+https://github.com/fokkonaut/F-Client/'
		'git+https://github.com/teeworlds/teeworlds-translation.git'
		'git+https://github.com/teeworlds/teeworlds-maps.git')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd F-Client
	base_ver=$(grep "GAME_VERSION " src/game/version.h | cut -d\" -f2 | cut -d',' -f1 | tr -d ' ')
	mod_ver=$(grep "GAME_VERSION " src/game/version.h | cut -d\" -f2 | cut -d',' -f2 | tr -d ' ')
	printf "%s_%s.%s.%s" "$base_ver" "$mod_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	magick convert "F-Client/other/icons/teeworlds.ico" "$srcdir/teeworlds.png"

	cd F-Client
	git submodule init
	git config submodule.data/languages.url "$srcdir/teeworlds-translation"
	git config submodule.data/maps.url "$srcdir/teeworlds-maps"
	git submodule update
}

build() {
	mkdir -p build
	cd build
	cmake ../F-Client \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-GNinja
	ninja
}

check() {
	ninja run_tests -C build
}

package() {
	DESTDIR="$pkgdir" ninja install -C build
	
	install -dm755 "$pkgdir/usr/share/"{licenses/$pkgname,metainfo,applications}
	install -m644 F-Client/license.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 F-Client/other/F-Client.appdata.xml -t "$pkgdir/usr/share/metainfo/"
	install -m644 F-Client/other/F-Client.desktop -t "$pkgdir/usr/share/applications/"

	# Install client and server icon files according to the image size
	for _icon in $(ls -1 "$srcdir"/teeworlds-*.png); do
		_s=$(identify $_icon | awk '{print $3}')
		[[ $_s =~ ([0-9])+x([0-9])+ ]] || ( echo "Not a NUMxNUM: '$_s'"; exit 1; )
		install -Dm644 "$_icon" "$pkgdir/usr/share/icons/hicolor/$_s/apps/teeworlds.png"
	done
	# > Well, that was idiotic...

	
	cd "$pkgdir/usr/bin"
	ln -sr F-Client teeworlds # Comply with the "provides" line
	cd -
}
