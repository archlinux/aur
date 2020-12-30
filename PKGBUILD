# Maintainer: Alex Coté <alx929@gmail.com>

pkgname=desert-theme-git
_gitname=Desert
pkgver=r7.d07c904
pkgrel=3
pkgdesc="GTK3 theme made by Paulxfce. \"Designed to be light, crisp, and simple, this theme is thoroughly built and tested to provide a nice desktop environment.\""
arch=("any")
url="https://www.gnome-look.org/p/1449286/"
license=('GPL2')
makedepends=('git')
conflicts=('desert-theme')
source=("${_gitname}::git+https://github.com/paullinuxthemer/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"

	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_gitname}"

	echo "Removing older versions from downloaded file..."
	mkdir latest
	directory_list=("Desert\-[0-9]*[0-9]" "Desert\-[0-9]*\-solid"
					"Desert\-Dark\-[0-9]*[0-9]" "Desert\-Dark\-[0-9]*\-solid"
					"Desert\-Orange\-[0-9]*[0-9]" "Desert\-Orange\-[0-9]*\-solid"
					"Desert\-Orange\-Dark\-[0-9]*[0-9]" "Desert\-Orange\-Dark\-[0-9]*\-solid"
					"Desert\-Purple\-[0-9]*[0-9]" "Desert\-Purple\-[0-9]*\-solid"
					"Desert\-Purple\-Dark\-[0-9]*[0-9]" "Desert\-Purple\-Dark\-[0-9]*\-solid")
	theme_names=("Desert" "Desert-Solid"
					"Desert-Dark" "Desert-Dark-Solid"
					"Desert-Orange" "Desert-Orange-Solid"
					"Desert-Orange-Dark" "Desert-Orange-Dark-Solid"
					"Desert-Purple" "Desert-Purple-Solid"
					"Desert-Purple-Dark" "Desert-Purple-Dark-Solid")

	for (( i=0; i<=${#directory_list[@]}; i++ ))
	do
		find "$PWD" -maxdepth 1 -type d -name "${directory_list[$i]}" | sort -V | tail -1 | xargs -I '{}' mv -f {} ./latest/"${theme_names[$i]}"
	done
	echo "Done."
}

package() {
	cd "${srcdir}/${_gitname}"

	mkdir -p "${pkgdir}/usr/share/themes/"
	cp -a "${srcdir}/${_gitname}/latest/"* "${pkgdir}/usr/share/themes/"
}
