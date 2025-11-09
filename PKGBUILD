# Maintainer: White Owl <thetruewhiteowl@proton.me>
# Contributor: Pieter Joost van de Sande <pj@born2code.net>
pkgname=openpomodoro
provides=("pomodoro")
pkgver=0.3.0
pkgrel=2
pkgdesc='A command-line Pomodoro tracker which uses the Open Pomodoro Format'
arch=('x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/open-pomodoro/openpomodoro-cli"
makedepends=("go" "git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8abd81d99c1a300bfac73c8f447b95e6367f8b27af0ad136fbe6f143ba658782')

build() {
    cd "${srcdir}/${pkgname}-cli-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

		go get ./...
    go build -o pomodoro -ldflags "-extldflags \"${LDFLAGS}\" -s -w -X main.version=${pkgver}" main.go
}

package() {
    cd "${srcdir}/${pkgname}-cli-${pkgver}"

    install -Dm755 "pomodoro" ${pkgdir}/usr/bin/pomodoro
}
