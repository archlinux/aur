# Maintainer: Noa (coolreader18)

# Please fetch this PKGBUILD manually and place a legally obtained ROM of Super Mario 64 in the
# same directory with the name `baserom.us.z64`. e.g.:
# 
#   git clone https://aur.archlinux.org/sm64plus-git.git
#     # or with the `yay` AUR helper
#   yay -G sm64plus-git
#   cd sm64plus-git
#   cp "/my_sm64_rom.z64" ./baserom.us.z64
#   makepkg -si
#
# The ROM will be checksummed to ensure that it's the correct version.
# The sha1 should be: 9bef1128717f958171a4afac3ed78ee2bb4e86ce

pkgname=sm64plus-git
pkgver=2.1.0
pkgrel=1
pkgdesc="A standalone fork of the Super Mario 64 PC Port with quality of life improvements"
arch=(x86_64)
url="https://github.com/MorsGames/sm64plus"
license=('reverse-engineered and unlicensed')
groups=()
depends=(sdl2)
makedepends=(git python imagemagick)
provides=("sm64plus")
conflicts=("sm64plus")
replaces=()
backup=()
options=()
install=
source=('sm64plus::git+https://github.com/MorsGames/sm64plus' sm64plus-wrapper.sh sm64plus.desktop file://baserom.us.z64)
noextract=()
sha1sums=('SKIP'
          'cd724c8043248366903993a33e9e079fbfc5e88b'
          'd8b8b8065fac319ac095ec2248c0200a9b9d6eb4'
          '9bef1128717f958171a4afac3ed78ee2bb4e86ce')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/sm64plus"
	printf "%s" "$(cat VERSION | sed 's/^v//')"
}

build() {
	cd "$srcdir/sm64plus"
	SM64PLUS_BASEROM_us="$srcdir/baserom.us.z64" make -j "$(nproc)"
	convert star.ico[1] star.png
}

package() {
	cd "$srcdir/sm64plus"
	mkdir -p "$pkgdir/opt/sm64plus"
	cp -r build/us_pc/textures -t "$pkgdir/opt/sm64plus"
	install build/us_pc/sm64.us.f3dex2e "$pkgdir/opt/sm64plus"
	install -D "$srcdir/sm64plus-wrapper.sh" "$pkgdir/usr/bin/sm64plus"
	install -D "$srcdir/sm64plus.desktop" -t "$pkgdir/usr/share/applications"
	install -D star.png "$pkgdir/usr/share/pixmaps/sm64plus.png"
}
