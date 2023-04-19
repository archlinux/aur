# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=kripton-theme-git
_pkgname=Kripton
pkgver=r124.92f5d19
pkgrel=1
pkgdesc="A dark theme with flat style for GNOME"
arch=("any")
url="https://github.com/EliverLara/${_pkgname}"
license=('GPL')
makedepends=('git' 'inkscape' 'optipng')
optdepends=('ttf-roboto: primary font face defined'
			'ttf-ubuntu-font-family: secondary font face defined'
			'cantarell-fonts: tertiary font face defined')
source=("${_pkgname}::git+https://github.com/EliverLara/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  	cd "${srcdir}/${_pkgname}"

	export THEME_FONT_FACE="${THEME_FONT_FACE:-Roboto}"
	export THEME_FONT_SIZE="${THEME_FONT_SIZE:-10}"

	msg2 "To customize the font and size for gnome-shell, build this package"
	msg2 "with the variables below set to the desired font family and size"
	msg2 "- THEME_FONT_FACE (default font family is Roboto)"
	msg2 "- THEME_FONT_SIZE (default font point size is 10)"
	msg2 ""
	msg2 "Continuing build in 5 seconds..."; sleep 5

	msg2 "Rendering assets, please wait"
	pushd gtk-2.0
	while read $line; do echo -n "."; done < \
		<(./render-assets.sh 2>/dev/null); echo
	popd

	pushd src
	while read $line; do echo -n "."; done < \
		<(./render-gtk3-assets.py 2>/dev/null; \
		./render-gtk3-assets-hidpi.py 2>/dev/null; \
		./render-wm-assets-hidpi.py 2>/dev/null; \
		./render-wm-assets.py 2>/dev/null); echo
	popd
	msg2 "Done!"

	msg2 "Setting gnome-shell font face to ${THEME_FONT_FACE}"
	msg2 "Setting gnome-shell font size to ${THEME_FONT_SIZE}"

	if [ "${THEME_FONT_FACE}" != "Roboto" ]; then
		sed -i -re "s/font-family: (.*);/font-family: ${THEME_FONT_FACE}, \1;/" \
			"${srcdir}/${_pkgname}/gnome-shell/gnome-shell.css"
	fi

	if [ "${THEME_FONT_SIZE}" != "10" ]; then
		sed -i -re "s/font-size: (.*);/font-size: ${THEME_FONT_SIZE}pt;/" \
			"${srcdir}/${_pkgname}/gnome-shell/gnome-shell.css"
	fi
}

package() {
  	cd "${srcdir}/${_pkgname}"

	mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
	cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
