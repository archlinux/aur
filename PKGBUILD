# Maintainer: Jonathon Fernyhough <jonathon_at'manjaro dot_org>

pkgname=uecide-git
_pkgname=uecide
pkgver=latest
pkgrel=1
pkgdesc='Universal Embedded Computing IDE'
arch=('any')
url='https://uecide.org/'
license=('GPL2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('apache-ant' 'jdk8-openjdk')
depends=('java-environment>7')

source=("${_pkgname}::git+https://github.com/${_pkgname^^}/${_pkgname^^}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	# https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
	( set -o pipefail
		git describe --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/v//g;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${_pkgname}"
	ant
}

package() {
	cd "${_pkgname}"

	install -Dm 644 dist/linux/doc_icon.png   "$pkgdir/usr/share/icons/uecide_sketch.png"
	install -Dm 644 dist/linux/uecide.png     "$pkgdir/usr/share/icons/uecide.png"
	install -Dm 644 dist/linux/uecide.desktop "$pkgdir/usr/share/applications/uecide.desktop"
	install -Dm 644 uecide.jar                "$pkgdir/usr/share/uecide/uecide.jar"

	install -dm 755 "$pkgdir/usr/bin"
	cat <<EOF > "$pkgdir/usr/bin/uecide"
#!/bin/sh
java -jar /usr/share/uecide/uecide.jar "$@"
EOF
	chmod 755 "$pkgdir/usr/bin/uecide"
}
