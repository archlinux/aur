# This is just the package from the linuxmint repositories modified to work with wayland
# Maintainer: Maël <alemswaj+tutanota+com>

pkgname=hypnotix-wayland
pkgver=2.4
pkgrel=1
pkgdesc="An IPTV streaming application. (With Wayland support). It's the package from the linux mint's github modified to work with wayland as it's whrote on the hypnotix's github repository. IT WORK GREAT EVEN IF YOU USE X11"
arch=(any)
url="https://github.com/linuxmint/hypnotix"
license=(GPL3)
depends=(dconf hicolor-icon-theme python-cairo python-imdbpy python-requests python-setproctitle mpv xapp python-unidecode)
conflicts=(hypnotix hypnotix-git)
source=(https://github.com/linuxmint/hypnotix/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('9f953593d11432ad78bd861bfa479acf940a1e2f08729c549dec1472b6f11b4a')
prepare() {
	cd hypnotix-$pkgver
	sed -i "s/__DEB_VERSION__/$pkgver/g" usr/lib/hypnotix/hypnotix.py
}

build() {
	cd hypnotix-$pkgver
	#! add a custom script to run the app under wayand if you're using wayland
	sed -i '2d' usr/bin/hypnotix
	sh -c "echo 'if [ \$WAYLAND_DISPLAY=wayland-0 ]
then
GDK_BACKEND=x11 /usr/lib/hypnotix/hypnotix.py &
else
/usr/lib/hypnotix/hypnotix.py &
fi'" >> usr/bin/hypnotix 
	sed -i '1397a \        options["vo"] = "x11"' usr/lib/hypnotix/hypnotix.py
}

package() {
	cd hypnotix-$pkgver
	cp -a usr/ "$pkgdir"/usr/
}

