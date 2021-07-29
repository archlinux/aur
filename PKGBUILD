# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=iferr-git
pkgver=20180615.bb332a3
pkgrel=1
pkgdesc="A linter for Go source code."
arch=('x86_64')
url="https://github.com/koron/iferr"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=('go')
source=("git${url#https}.git" 'go.mod')
sha512sums=('SKIP' '7582cd268119b3ccdb91ac30b8d1084b329883630dfce65060391d7fd6f7e24c18bba3b90d335b4c40bcdd5f6062d08e7f6b7509bd38c668acebc66693727eea')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${pkgname%-git}"

	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -o bin/ .
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	install -Dm755 -- "bin/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 -- "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
