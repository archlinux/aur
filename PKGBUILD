# Maintainer: Utkan Güngördü <utkan@freeconsole.org>

pkgname=gomics-git
_pkgname=gomics
pkgver=r24.ae62ce3
pkgrel=1
pkgdesc="A lightweight and free comic viewer"
url="https://github.com/salviati/gomics"
license=('GPLv3')
depends=('gtk3' 'gdk-pixbuf2' 'glib2')
makedepends=('git' 'go')
conflicts=('gomics')
provides=('gomics')
arch=('i686' 'x86_64')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


build() {
	export GOPATH="${srcdir}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_ENABLED=1
	cd "${srcdir}/${_pkgname}"

	export BUILD_DATE=`date +'%Y%m%d'`
	export GIT_REVISON=`git rev-parse HEAD`
	go build -modcacherw -ldflags="-X main.buildDate=$BUILD_DATE -X main.gitVersion=$GIT_REVISON"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 "gomics" "${pkgdir}/usr/bin/gomics"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
