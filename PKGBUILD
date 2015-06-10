# Maintainer: swyter <swyterzone+aur@gmail.com>
# Note: Haven't really tested it with i686, but it should work all the same... at least in theory. :)

pkgname=sinerider
pkgver=0.3.36
pkgrel=1
epoch=
pkgdesc="A game of numerical sledding. It will make you see math the way mathematicians see it: a creative process of exploration and discovery. Math is the ultimate puzzle, and SineRider is the ultimate math puzzle game."
arch=('x86_64' 'i686')
url="http://sineridergame.com/"
license=('custom:freeware' 'unknown')
groups=()
depends=('glibc' 'glu' 'libgl' 'libx11' 'libxext' 'libxcursor' 'libxrandr' 'gcc-libs' 'expat' 'libglapi' 'libxdamage' 'libxfixes' 'libxcb' 'libxshmfence' 'libxxf86vm' 'libdrm' 'libxrender' 'libxau' 'libxdmcp')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://s3.amazonaws.com/sinerider/SineRider+Linux.zip" "sinerider.desktop")
md5sums=("4f7066ce13d50e91b42b0b2e27260f34"
         "778d8fd98d2a051882220c7b55bd0846")
install=sinerider.install

package()
{
	# look up table from unity3d's silly arch nomenclature
	declare -A archlut=([x86_64]="x86_64" [i686]="x86")

	# mosly optional
	cd "$srcdir"

	# create the main folder
	install -d "$pkgdir/opt/sinerider"

	# copy the engine assets...
	cp -rp "$srcdir/SineRider_Data" "$pkgdir/opt/sinerider/"

	# ...and the right executable, depending on our current arch
	install -Dm 755 "SineRider.${archlut[$CARCH]}" "$pkgdir/opt/sinerider/SineRider.$CARCH"

	# remove unneeded stuff from the other arch
	# unset the platform we're using from the look-up array,
	# get the value of the other index and use it to delete anything we want.

	unset archlut[$CARCH]
	otherarch=${archlut[${!archlut[@]}]}

	rm -rf "$pkgdir/opt/sinerider/SineRider_Data/Mono/$otherarch"
	rm -rf "$pkgdir/opt/sinerider/SineRider_Data/Plugins/$otherarch"

	# sundry icons and symlinked launcher
	install -d "$pkgdir/usr/bin"
	echo "/opt/sinerider/SineRider.$CARCH" > "$pkgdir/usr/bin/sinerider"
	chmod +x "$pkgdir/usr/bin/sinerider"

	install -Dm 755 "sinerider.desktop" "$pkgdir/usr/share/applications/sinerider.desktop"
	install -Dm 644 "$srcdir/SineRider_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/sinerider.png"
}
