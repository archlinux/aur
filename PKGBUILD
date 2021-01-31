# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=gofumpt-git
pkgver=r134.eb0da8c
pkgrel=1
pkgdesc="A stricter gofmt"
arch=('i686' 'x86_64')
url="https://github.com/mvdan/gofumpt"
license=('custom')
makedepends=('go')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	GO111MODULE=on go build -mod=readonly
}

package() {
	cd ${pkgname}
	install -Dm755 -t "${pkgdir}/usr/bin" gofumpt
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE LICENSE.google
}

pkgver() {
	cd "${srcdir}/${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}
