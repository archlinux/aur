# Maintainer: michaelkuc6 <michaelkuc6 at gmail dot com>
_pkgname=remark-lsp
pkgname="${_pkgname}-git"
pkgver=2.0.0.r0.gae2d737
pkgrel=1
pkgdesc="A language server to lint and format markdown files with remark"
arch=('x86_64')
url="https://github.com/remarkjs/remark-language-server"
license=('MIT')
depends=()
makedepends=('npm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/remarkjs/remark-language-server.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "$srcdir/${_pkgname}"
	BINARCHIVE="$(npm pack --cache "${srcdir}/npm-cache")"
	npm install -g --prefix "${pkgdir}/usr" "${BINARCHIVE}"
	install -D -m644 license "${pkgdir}/usr/share/licenses/${pkgname}/README.txt"
	chown -R root:root "${pkgdir}"
}
