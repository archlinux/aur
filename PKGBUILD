# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
pkgname=firefox-passff-git
pkgver=1.2.r5.5536113
pkgrel=2
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/passff/passff"
license=('GPL2')
groups=(firefox-addons)
depends=('firefox>=50' 'python' 'passff-host')
makedepends=(git zip jq)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${_pkgname}::git+https://github.com/passff/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"

    # Git, unannotated tags available
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${_pkgname}/src"
    make VERSION=testing
}

package() {
    cd "$srcdir/${_pkgname}/src"

    local ext_id="$(jq -r '.applications.gecko.id' manifest.json)"
    install -Dm644 "../bin/testing/${_pkgname}.xpi" \
        "${pkgdir}/usr/lib/firefox/browser/extensions/${ext_id}.xpi"
}
