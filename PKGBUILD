# This is just the package from the linuxmint repositories modified to work with wayland
# Maintainer: Maël <alemswaj+tutanota+com>

pkgname=hypnotix-wayland
pkgver=1.6
pkgrel=1
pkgdesc="An IPTV streaming application. (With Wayland support). It's the package from the linux mint repositories modified to work with wayland as it's whrite on the hypnotix's github repository. It work great even if you're using x11"
arch=(any)
url="https://github.com/linuxmint/hypnotix"
license=(GPL3)
depends=(dconf hicolor-icon-theme python-cairo python-imdbpy python-requests python-setproctitle mpv xapp)
conflicts=(hypnotix hypnotix-git)
source=(http://packages.linuxmint.com/pool/main/h/hypnotix/hypnotix_1.6.tar.xz)
sha256sums=('f9b5c9e7fdcbf93cc9371f25b050bc2004e1392bb2303222161648d694616388')
prepare() {
	cd hypnotix
	sed -i "s/__DEB_VERSION__/$pkgver/g" usr/lib/hypnotix/hypnotix.py
}

build() {
	cd hypnotix
	make
	sed -i '2d' usr/bin/hypnotix
	sh -c "echo 'if [ \$WAYLAND_DISPLAY=wayland-0 ]
then
GDK_BACKEND=x11 /usr/lib/hypnotix/hypnotix.py &
else
/usr/lib/hypnotix/hypnotix.py &
fi'" >> usr/bin/hypnotix 
	sed -i '1036a \        options["vo"] = "x11"' usr/lib/hypnotix/hypnotix.py
}

package() {
	cd hypnotix
	install -D     -t "$pkgdir"/usr/bin usr/bin/hypnotix
	install -D     -t "$pkgdir"/usr/lib/hypnotix usr/lib/hypnotix/{common,hypnotix}.py
	install -Dm644 -t "$pkgdir"/usr/lib/hypnotix usr/lib/hypnotix/mpv.py
	install -Dm644 -t "$pkgdir"/usr/share/applications usr/share/applications/hypnotix.desktop
	install -Dm644 -t "$pkgdir"/usr/share/glib-2.0/schemas usr/share/glib-2.0/schemas/org.x.hypnotix.gschema.xml
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix usr/share/hypnotix/*.{css,png,ui}
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix/pictures usr/share/hypnotix/pictures/*.svg
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix/pictures/badges usr/share/hypnotix/pictures/badges/*
	install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps usr/share/icons/hicolor/scalable/apps/hypnotix.svg

	# Translations
	cp -a usr/share/locale "$pkgdir"/usr/share/locale
}

