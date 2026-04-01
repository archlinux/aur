# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=chibitracker-git
pkgver=1.4.2.r28.735cf51
pkgrel=8
install="${pkgname}.install"
pkgdesc="A Classic Impulse Tracker Clone"
arch=("x86_64" "i686")
url="https://github.com/reduz/chibitracker"
license=('GPL-2.0-or-later')
provides=("chibitracker")
conflicts=("chibitracker")
depends=("sdl" "glibc" "libstdc++" "hicolor-icon-theme")
makedepends=("scons" "gcc" "git")
source=("git+$url" 
	"chibitracker.desktop"
	"flags.diff")
sha256sums=('SKIP'
            '1ac899721be363f141ccfa248935bed50cd549dd2f5d9ff2ac0c4690e2c1a5f2'
            '45ca8dda698bfcdc576f325ebd7759809a55f55007f3321c29681758caee4f88')
validpgpkeys=()

pkgver() {
	cd "$srcdir/${pkgname::-4}"
	printf "1.4.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname::-4}"
	patch -Np1 < "$srcdir/flags.diff"
}

build() {
	cd "$srcdir/${pkgname::-4}"
	SCONSFLAGS="-j$(nproc)" scons target=release prefix="$pkgdir/usr"
}

package() {
	cd "$srcdir/${pkgname::-4}"
	scons target=release prefix="$pkgdir/usr" install

	install -Dm644 "$srcdir/${pkgname::-4}/program/cticon.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/chibitracker.png"
	install -Dm644 "$srcdir/${pkgname::-4}.desktop" "$pkgdir/usr/share/applications/chibitracker.desktop"
	
	cd "$srcdir/${pkgname::-4}/skins"
	
	mkdir "$pkgdir/usr/share/${pkgname::-4}" && echo temp > "$pkgdir/usr/share/${pkgname::-4}/temp"
	#mkdir -p "$pkdir/usr/share/${pkgname::-4}"
	for skin in {FastBlue,Impulsive,Chibiness};
	do
		mkdir "$pkgdir/usr/share/${pkgname::-4}/${skin}"
		bsdtar -xvf ${skin}.zip -C "$pkgdir/usr/share/${pkgname::-4}/${skin}"
	done
	bsdtar --no-same-owner -xvf Oldie90s.zip -C "$pkgdir/usr/share/${pkgname::-4}/"

	rm "$pkgdir/usr/share/chibitracker/temp"
}
