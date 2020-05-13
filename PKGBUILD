# Maintainer: Albin Kauffmann <albinou@kauff.org>

pkgname=blacknut-appimage
pkgver=2.7.9
pkgrel=1
pkgdesc="Cloud gaming client (binary AppImage)"
arch=('x86_64')
url="https://www.blacknut.com"
license=('unknown')
depends=('fuse')
makedepends=('p7zip')
optdepends=('pulseaudio-alsa: play sound using pulseaudio'
            'firejail: run Blacknut within a jail')
conflicts=('blacknut')
options=('!strip')
install=
changelog=
_appimage="Blacknut-${pkgver}.AppImage"
source=("https://releases.blacknut.com/player/${_appimage}"
        "blacknut"
        "blacknut-firejail.profile")
sha256sums=('f8e0db029a0f5029935b3b1da632d8ba7ac4b81636c6ffcb65849622c2f464b8'
            '5375ab65818f53ee6893f78a323a1732199b7f252d87a1fc3a81e3f495aae77c'
            '0ee0415a3aa51916286ae22a319cac74569d5a63011f2f110e63937fe6e0260d')

prepare() {
	cd "$srcdir"
	7z x "$_appimage" blacknut.desktop usr/share/icons/hicolor
}

build() {
	cd "$srcdir"
	sed -i "s/^Exec=AppRun$/Exec=blacknut/" blacknut.desktop
	sed -i "s/BLACKNUT_VERSION=\"x.y.z\"/BLACKNUT_VERSION=\"${pkgver}\"/" blacknut
}

package() {
	cd "$srcdir"

	install -d -m755 $pkgdir/usr/share/{applications,icons/hicolor}
	install -d -m755 $pkgdir/opt/appimages
	# TODO find a decent license
	#install -d -m755 $pkgdir/usr/share/licenses/$pkgname

	hicolor="usr/share/icons/hicolor"
	for size in $(ls -1 $hicolor); do
		install -d -m755 $pkgdir/usr/share/icons/hicolor/$size/apps
		install -D -m644 $hicolor/$size/apps/blacknut.png $pkgdir/usr/share/icons/hicolor/$size/apps/blacknut.png
	done

	install -D -m644 blacknut.desktop $pkgdir/usr/share/applications/blacknut.desktop
	install -D -m755 blacknut $pkgdir/usr/bin/blacknut
	install -D -m755 $_appimage $pkgdir/opt/appimages/$_appimage
	install -D -m644 blacknut-firejail.profile $pkgdir/opt/appimages/blacknut-firejail.profile
}
