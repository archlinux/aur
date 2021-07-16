# This is just the package from the linuxmint repositories modified to work with wayland
# Maintainer: Maël <alemswaj+tutanota+com>

pkgname=hypnotix-wayland
pkgver=2.0
pkgrel=1
pkgdesc="An IPTV streaming application. (With Wayland support). It's the package from the linux mint's github modified to work with wayland as it's whrote on the hypnotix's github repository. IT WORK GREAT EVEN IF YOU USE X11"
arch=(any)
url="https://github.com/linuxmint/hypnotix"
license=(GPL3)
depends=(dconf hicolor-icon-theme python-cairo python-imdbpy python-requests python-setproctitle mpv xapp)
conflicts=(hypnotix hypnotix-git)
source=(https://codeload.github.com/linuxmint/hypnotix/tar.gz/refs/tags/${pkgver})
sha256sums=('acc86f76a6f4bce3da2114b71ff9e105383b84ae54d21a9fd0993ce52da8c3e9')
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
	sed -i '1245a \        options["vo"] = "x11"' usr/lib/hypnotix/hypnotix.py
}

package() {
	cd hypnotix-$pkgver
	cp -a usr/ "$pkgdir"/usr/
}

