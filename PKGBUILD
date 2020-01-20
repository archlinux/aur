# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Alexander F. Rødseth <xyproto at archlinux dot org>
# Contributor: neverix <nev@ ateverix dot io>
pkgname=yin-yang-git
pkgver=1.0.beta.r11.a5c2712
pkgrel=1
pkgdesc="Auto Nightmode for KDE, Gnome, Budgie, VSCode, Atom and more"
arch=('any')
url="https://github.com/daehruoydeef/Yin-Yang"
license=('MIT')
depends=('python-pyqt5' 'python-qtpy')
optdepends=('code' 'atom')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/daehruoydeef/Yin-Yang")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/Yin-Yang"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/Yin-Yang"
	install -d "$pkgdir"/{opt/"${pkgname%-git}",usr/bin,usr/share/applications}
	cp -r ./* "$pkgdir/opt/${pkgname%-git}"
	rm -rf "$pkgdir/opt/${pkgname%-git}"/{build,install.sh,uninstall.sh}
	chmod +x "$pkgdir/opt/${pkgname%-git}/src/${pkgname%-git}"
	ln -s "opt/${pkgname%-git}/src/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "src/ui/assets/${pkgname%-git}.svg" -t \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

	cat <<EOF >"$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
[Desktop Entry]
Type=Application
Name=Yin & Yang
Comment=Auto Nightmode for KDE, Gnome, Budgie, VSCode, Atom and more
Path=/opt/yin-yang
Exec=env QT_AUTO_SCREEN_SCALE_FACTOR=1 sh /usr/bin/yin-yang
Icon=yin-yang
Terminal=false
Categories=Education;Languages;Python;
EOF
}
