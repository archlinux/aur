# Maintainer: Gustavo Vinícios de Souza <gnsfujiwara@disroot.org>

pkgname=kemono-scraper-git
pkgver=0.0.21.r0.gb2c42e7
pkgrel=1
pkgdesc='A simple downloader to download media from kemono.party, development version.'
arch=('x86_64')
url='https://github.com/elvis972602/Kemono-scraper'
license=('MIT')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/elvis972602/${pkgname%-git}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    cd "${srcdir}/${pkgname%-git}/main"

    go mod tidy
    go build -o kemono-scraper
}

package() {
    cd "${srcdir}/${pkgname%-git}/main"
    install -Dm755 kemono-scraper "${pkgdir}/usr/bin/kemono-scraper"
}
