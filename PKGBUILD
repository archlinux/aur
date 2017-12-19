# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

pkgname=otf-ibm-plex-git
_pkgname=otf-ibm-plex
pkgver=latest
pkgrel=1
pkgdesc='IBM Plex Mono, Sans, and Serif typefaces (OTF version)'
arch=('any')
url='https://github.com/IBM/type'
license=('sil')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}::git+https://github.com/IBM/type.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	# https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
	( set -o pipefail
		git describe --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$_pkgname"

	for variant in Mono Sans Serif; do
		install -d $pkgdir/usr/share/fonts/OTF/ibm-plex/${variant,,}
		install -Dm644 fonts/${variant}/desktop/mac/*.otf $pkgdir/usr/share/fonts/OTF/ibm-plex/${variant,,}
	done

	# License
	install -Dm644 fonts/Mono/desktop/mac/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
