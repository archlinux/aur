# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=chibitracker
pkgname=chibitracker-git
pkgver=1.4.2.r28.735cf51
pkgrel=7
install="${pkgname}.install"
pkgdesc="A Classic Impulse Tracker Clone"
arch=("x86_64" "i686")
url="https://github.com/reduz/chibitracker"
license=('GPL-2.0-or-later')
provides=("chibitracker")
conflicts=("chibitracker")
depends=("sdl" "gcc-libs" "hicolor-icon-theme")
makedepends=("scons" "gcc" "git" "unzip")
source=("git+$url" 
	"chibitracker.desktop")
sha256sums=('SKIP'
            '1ac899721be363f141ccfa248935bed50cd549dd2f5d9ff2ac0c4690e2c1a5f2')
validpgpkeys=()

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "1.4.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	SCONSFLAGS="-j$(nproc)" scons target=release prefix="$pkgdir/usr"
}

package() {
	cd "$srcdir/$_pkgname"
	scons target=release prefix="$pkgdir/usr" install

	install -Dm644 "$srcdir/$_pkgname/program/cticon.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/chibitracker.png"
	install -Dm644 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/chibitracker.desktop"
	
	cd "$srcdir/$_pkgname/skins"
	
	mkdir "$pkgdir/usr/share/$_pkgname" && echo temp > "$pkgdir/usr/share/$_pkgname/temp"
	#mkdir -p "$pkdir/usr/share/$_pkgname"
	for skin in {FastBlue,Impulsive,Chibiness};
	do
		unzip -d ${skin} ${skin}.zip
		cp -r "${skin}" "$pkgdir/usr/share/$_pkgname/"
	done
	unzip Oldie90s.zip
	cp -r Oldie90s "$pkgdir/usr/share/chibitracker/"

	rm "$pkgdir/usr/share/chibitracker/temp"
}
