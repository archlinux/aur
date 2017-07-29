# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
pkgname=firefox-passff-git
pkgver=1.0.0.r0.c18c198
pkgrel=1
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/nwallace/passff"
license=('GPL2')
groups=(firefox-addons)
depends=(firefox)
makedepends=(git make zip sed jq)
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

	local ext_id="$(jq -r '.applications.gecko.id' manifest.json)"
	install -Dm644 ../bin/${_pkgname}.xpi \
		"${pkgdir}/usr/lib/firefox/browser/extensions/${ext_id}.xpi"

        # Install host application
        install -Dm644 -t "${pkgdir}/usr/lib/mozilla/native-messaging-hosts" \
            ./host/passff.py \
            ./host/passff.json
}
