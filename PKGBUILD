# Maintainer: Adrián Pérez de Castro <adrian@perezdecastro.org>

# Set to non-empty value to change the "Inherits=..." value in
# the "index.theme"; the value will be inserted as-is in the file.
# For example the following would make the theme inherit from the
# "nouveGnome" theme:
#
#    _inherits='nouveGnome,hicolor'
#
# The default value speficied by the theme is "Moka,gnome,hicolor".
# Note that most of the time "hicolor" should be always given as
# last possible fall-back icon theme, as it will be always present.
#
_inherits=''

pkgname='vertex-icons-git'
pkgdesc='A Gnome icon theme to match the Vertex Gtk theme'
pkgver=r16.f27e47e
pkgrel=5
url='https://github.com/horst3180/Vertex-Icons'
makedepends=('git')
optdepends=('moka-icon-theme-git: Default fall-back icon theme'
            'faba-mono-icons-git: Default fall-back icon theme')
arch=('any')
license=('GPL')
source=("${pkgname}::git+${url}")
install="${pkgname}.install"
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	if [[ -n ${_inherits} ]] ; then
		# Change "Inherits=" line in "index.theme"
		sed -i "s/^Inherits=.*$/Inherits=${_inherits}/" "${pkgname}/index.theme"
	fi
}

package () {
	cd "${pkgname}"
	install -dm755 "${pkgdir}/usr/share/icons/Vertex-Icons"
	for i in * ; do
		if [[ -d ${i} ]] ; then
			echo "Installing: ${i}..."
			cp -r "${i}" "${pkgdir}/usr/share/icons/Vertex-Icons"
		fi
	done
	install -Dm644 index.theme \
		"${pkgdir}/usr/share/icons/Vertex-Icons/index.theme"
}
