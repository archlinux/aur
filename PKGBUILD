# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=otf-ibm-plex-git
_pkgname=otf-ibm-plex
pkgver=latest
pkgrel=3
pkgdesc='IBM Plex Mono, Sans, and Serif typefaces (OTF version)'
arch=('any')
url='https://github.com/IBM/plex'
license=('sil')
makedepends=('git')
provides=("$_pkgname"
          'otf-ibm-plex-mono'
          'otf-ibm-plex-sans'
          'otf-ibm-plex-sans-condensed'
          'otf-ibm-plex-serif')
conflicts=("$_pkgname")

source=("${_pkgname}::git+https://github.com/IBM/plex.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	# https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
	( set -o pipefail
		git describe --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/v//g;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$_pkgname"

	for variant in Mono Sans Sans-Condensed Serif; do
		install -d "$pkgdir"/usr/share/fonts/OTF/ibm-plex/${variant,,}
		install -Dm644 IBM-Plex-${variant}/fonts/complete/otf/*.otf "$pkgdir"/usr/share/fonts/OTF/ibm-plex/${variant,,}
	done

	# License
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
