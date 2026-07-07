# Maintainer: 
_pkgname=kh-melonmix
pkgname=$_pkgname-git
pkgver=0.9.0.r30.ge5bd538
pkgrel=1
pkgdesc="A fork of MelonDS, focused on remastering Kingdom Hearts: 358/2 Days and Re:coded"
arch=(x86_64)
url="https://github.com/vitor251093/KHMelonMix"
license=('GPL-3.0-or-later')
depends=("libepoxy" "qt6-base" "qt6-multimedia" "qt6-svg" "sdl2" "sdl2-compat" "lua" "flac")
makedepends=("git" "cmake" "extra-cmake-modules" "libpcap" "libarchive" "enet" "libslirp")
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
install=$_pkgname.install
source=("$_pkgname::git+$url.git"
	kh-melonmix.png::https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/icon/melon_256x256.png
	kh-melonmix-days.png::https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/khDaysMM.png
	kh-melonmix-coded.png::https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/khCodedMM.png
	kh-melonmix.desktop
	kh-melonmix-days.desktop
	kh-melonmix-recoded.desktop
	kh-melonmix-exec)
sha256sums=('SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v0/0/g'
}

build() {
	cd "$srcdir/$_pkgname"
	cmake -B build -DMELONDS_VERSION_SUFFIX=".r${pkgver##*.r}"
	cmake --build build -j$(nproc --all)
}

package() {
	mkdir -p "$pkgdir/opt/Kingdom Hearts Melon Mix/roms"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps

	install -Dm755 "$srcdir/$_pkgname/build/melonDS" "$pkgdir/opt/Kingdom Hearts Melon Mix/MelonMix"
	install -Dm755 $srcdir/kh-melonmix-exec "$pkgdir/usr/bin/kh-melonmix"

	install -Dm644 $srcdir/kh-melonmix.desktop "$pkgdir/usr/share/applications"
	install -Dm644 $srcdir/kh-melonmix-days.desktop "$pkgdir/usr/share/applications"
	install -Dm644 $srcdir/kh-melonmix-recoded.desktop "$pkgdir/usr/share/applications"


	cd $srcdir
	for file in *.png; do
	    if [[ -f "$file" ]]; then
		install -m644 "$file" "$pkgdir/usr/share/icons/hicolor/256x256/apps"
	    fi
	done

}
