# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
pkgname=firefox-passff-git
pkgver=0.1.32.r15.g9f1b15d
pkgrel=1
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/nwallace/passff"
license=('GPL2')
groups=(firefox-addons)
depends=(firefox)
makedepends=(git make zip sed)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${_pkgname}::git+https://github.com/nwallace/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"

        # Git, unannotated tags available
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_pkgname}/src"
	make
}

package() {
	cd "$srcdir/${_pkgname}/src"

	local ext_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)"
	install -Dm644 ../bin/${_pkgname}.xpi \
		"${pkgdir}/usr/lib/firefox/browser/extensions/${ext_id}.xpi"
}
