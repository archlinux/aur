# Maintainer: Daniel Milde <daniel@milde.cz>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=esbuild
pkgver=0.17.6
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://${pkgname}.github.io/"
license=('MIT')
makedepends=('go')
_snapshot="${pkgname}-${pkgver}"
source=("${_snapshot}.tar.gz::https://github.com/evanw/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('6ac3f6360b029dec90469bdfaa3c96221c61a3018dbcc674197a4e1f309ce0b3834df14ae86f4e7aca4fa48af084f395d6775d140da2f73bb37140dfab910acf')

build() {
    set -a
    CGO_CPPFLAGS="${CPPFLAGS}"
    CGO_CFLAGS="${CFLAGS}"
    CGO_CXXFLAGS="${CXXFLAGS}"
    CGO_LDFLAGS="${LDFLAGS}"
    GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    set +a

    cd "${_snapshot}"
    go build -o "${srcdir}/build/" "./cmd/..."
}

package() {
    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    cd "${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.md"
}
