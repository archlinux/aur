# Maintainer: Daniel Milde <daniel@milde.cz>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=esbuild
pkgver=0.16.14
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://${pkgname}.github.io/"
license=('MIT')
makedepends=('go')
_snapshot="${pkgname}-${pkgver}"
source=("${_snapshot}.tar.gz::https://github.com/evanw/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('44275c2fe445ea67ffd4e770e337ef8463828d7843682d6b5ec6c60493166a2883f4beb0694992a5d3e7d063172a381cb46153a4e2f4d72710ef678504e95994')

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
    local bin="/usr/bin/${pkgname}"
    install -Dm755 "build/${pkgname}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${pkgname}.sh"

    cd "${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.md"
}
