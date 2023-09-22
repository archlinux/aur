# This is just the package from the linuxmint repositories modified to work with wayland
# Maintainer: pusi77 <pusineriandrea+gmail+com>

pkgname=hypnotix-wayland
pkgver=3.7
pkgrel=1
pkgdesc="An IPTV streaming application. (With Wayland support)."
arch=(any)
url="https://github.com/linuxmint/hypnotix"
license=(GPL3)
depends=(
        "dconf"
        "hicolor-icon-theme"
        "mpv"
        "python-cairo"
        "python-cinemagoer" #aur
        "python-gobject"
        "python-requests"
        "python-setproctitle"
        "python-unidecode"
        "xapp"
        )
conflicts=(hypnotix hypnotix-git)
source=("hypnotix-$pkgver.tar.gz::https://github.com/linuxmint/hypnotix/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0cb91ba4b98dbfbac5c4e6838855b26f3c2a302d1aeb1e926f314e68f0e78909')
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
        sed -i '1546a \        options["vo"] = "x11"' usr/lib/hypnotix/hypnotix.py
}

package() {
        cd hypnotix-$pkgver
        cp -a usr/ "$pkgdir"/usr/
}
