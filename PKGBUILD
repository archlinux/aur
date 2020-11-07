# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=dnscontrol-git
pkgver=3.4.2.r917.50d5cbce
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL (master branch)"
arch=('x86_64')
url="https://github.com/StackExchange/dnscontrol.git"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go-pie')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
         cd "${pkgname}"
         echo "$(git describe --tags --abbrev=0 | sed 's/^v//').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
          mkdir -p "${srcdir}/gopath/src/github.com/StackExchange"
          ln -rTsf "${pkgname}" "${srcdir}/gopath/src/github.com/StackExchange/${pkgname%-git}"
}

build() {
        export GOPATH="${srcdir}/gopath"
        cd "${GOPATH}/src/github.com/StackExchange/${pkgname%-git}"

	GO111MODULE=on go run build/build.go -os=linux
	go clean -modcache
}

package() {
          install -Dm755 "${srcdir}/gopath/src/github.com/StackExchange/${pkgname%-git}/${pkgname%-git}-Linux" "${pkgdir}/usr/bin/${pkgname%-git}"
          install -Dm644 "${srcdir}/gopath/src/github.com/StackExchange/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
