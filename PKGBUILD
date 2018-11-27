# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=nordic-polar-theme-git
_pkgname=Nordic-Polar
pkgver=9.fa226da
pkgrel=1
pkgdesc="A Gtk3.20+ theme created using the awesome Nord color palette."
arch=("any")
url="https://github.com/EliverLara/${_pkgname}"
license=('GPL')
optdepends=('ttf-roboto: primary font face defined'
			'ttf-ubuntu-font-family: secondary font face defined'
			'cantarell-fonts: tertiary font face defined')
source=("${_pkgname}::git+https://github.com/EliverLara/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  	cd "${srcdir}/${_pkgname}"

	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  	cd "${srcdir}/${_pkgname}"

	msg2 "To customize the font size for gnome-shell, build this pacakge"
	msg2 "with the variable DEFAULT_FONT_SIZE set to the desired pt size"
	msg2 ""
	msg2 "Continuing build in 5 seconds..."; sleep 5
	msg2 "Setting gnome-shell font size to ${DEFAULT_FONT_SIZE}pt"

	export DEFAULT_FONT_SIZE="${DEFAULT_FONT_SIZE:-10}"
	sed -i -re "s/font-size: 10pt/font-size: ${DEFAULT_FONT_SIZE:-10}pt/" \
		"${srcdir}/${_pkgname}/gnome-shell/gnome-shell.css"

	msg2 "Rendering assets, please wait"
	cd src
	while read $line; do echo -n "."; done < \
		<(./render-gtk3-assets.py; ./render-gtk3-assets-hidpi.py); echo
	msg2 "Done!"
}

package() {
  	cd "${srcdir}/${_pkgname}"

	mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
	cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
