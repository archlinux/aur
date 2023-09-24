# Maintainer: Lucas Saliés Brum <sistematico@gmail.com>
# Contributor: Alex Coté <alx929@gmail.com>

pkgname=prof-gnome-theme-git
_gitname=Prof-Gnome
pkgver=r20.a97a7a4
pkgrel=1
pkgdesc="GNOME theme made by Paulxfce. \"A pleasing, clear and easy-on-the-eyes theme that is meant for those who use the Gnome-desktop professionally on a daily basis.\""
arch=("any")
url="https://www.gnome-look.org/p/1334194/"
license=('GPL2')
makedepends=('git')
conflicts=('prof-gnome-theme')
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
	directory_list=("Prof\-Gnome\-Dark\-[0-9]*"
					"Prof\-Gnome\-Darker\-[0-9]*"
					"Prof\-Gnome\-Light\-[0-9]*"
					"Prof\-Gnome\-Light\-DS\-[0-9]*")
	theme_names=("Prof-Gnome-Dark"
					"Prof-Gnome-Darker"
					"Prof-Gnome-Light"
					"Prof-Gnome-Light-DS")

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
