# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tony Lambiris <tony@libpcap.net>

pkgname=nordic-theme-git
pkgver=2.2.0.r52.g75dd1fc
pkgrel=1
pkgdesc="Nord-derived themes for GTK and other platforms"
arch=("any")
url="https://github.com/EliverLara/Nordic"
license=('GPL')
makedepends=('git' 'inkscape' 'optipng')
optdepends=(
	'ttf-roboto: primary font face defined'
	'ttf-ubuntu-font-family: secondary font face defined'
	'cantarell-fonts: tertiary font face defined')
conflicts=('nordic-theme')
provides=('nordic-theme')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"

	export THEME_FONT_FACE="${THEME_FONT_FACE:-Roboto}"
	export THEME_FONT_SIZE="${THEME_FONT_SIZE:-10}"

	echo "To customize the font and size for gnome-shell, build this package"
	echo "with the variables below set to the desired font family and size"
	echo "- THEME_FONT_FACE (default font family is Roboto)"
	echo "- THEME_FONT_SIZE (default font point size is 10)"
	echo ""
	echo "Continuing build in 5 seconds..."; sleep 5

	echo "Rendering assets, please wait"
	(	cd gtk-2.0
		while read $line; do echo -n "."; done < \
			<(./render-assets.sh 2>/dev/null); echo )

	# pushd src
	(	cd src
		while read $line; do echo -n "."; done < \
			<(./render-gtk3-assets.py 2>/dev/null; \
			./render-gtk3-assets-hidpi.py 2>/dev/null; \
			./render-wm-assets-hidpi.py 2>/dev/null; \
			./render-wm-assets.py 2>/dev/null); echo )
	echo "Done!"

	echo "Setting gnome-shell font face to ${THEME_FONT_FACE}"
	echo "Setting gnome-shell font size to ${THEME_FONT_SIZE}"

	if [ "${THEME_FONT_FACE}" != "Roboto" ]; then
		sed -i -re "s/font-family: (.*);/font-family: ${THEME_FONT_FACE}, \1;/" \
			"${srcdir}/$pkgname/gnome-shell/gnome-shell.css"
	fi

	if [ "${THEME_FONT_SIZE}" != "10" ]; then
		sed -i -re "s/font-size: (.*);/font-size: ${THEME_FONT_SIZE}pt;/" \
			"${srcdir}/$pkgname/gnome-shell/gnome-shell.css"
	fi
}

package() {
	cd "$pkgname"
	find assets cinnamon gnome-shell gtk* metacity-1 xfwm4 \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/themes/Nordic/{}" \;
}
