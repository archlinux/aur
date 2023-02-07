# This is just the package from the linuxmint repositories modified to work with wayland
# Maintainer: pusi77 <pusineriandrea+gmail+com>

pkgname=hypnotix-wayland
pkgver=3.2
pkgrel=1
pkgdesc="An IPTV streaming application. (With Wayland support)."
arch=(any)
url="https://github.com/linuxmint/hypnotix"
license=(GPL3)
depends=(dconf hicolor-icon-theme python-cairo python-imdbpy python-requests python-setproctitle mpv xapp python-unidecode)
conflicts=(hypnotix hypnotix-git)
source=(https://github.com/linuxmint/hypnotix/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('c69906318dfbfd10df055d085afbe271f2e89372faa4c47a649b4827b3a7903c')
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
        sed -i '1438a \        options["vo"] = "x11"' usr/lib/hypnotix/hypnotix.py
}

package() {
        cd hypnotix-$pkgver
        cp -a usr/ "$pkgdir"/usr/
}
