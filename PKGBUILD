# Maintainer: Daniel Milde <daniel@milde.cz>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=esbuild
pkgver=0.17.2
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://${pkgname}.github.io/"
license=('MIT')
makedepends=('go')
_snapshot="${pkgname}-${pkgver}"
source=("${_snapshot}.tar.gz::https://github.com/evanw/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('e8c29a6e097f6068612ceab95f9f1ef7c5e33ab20c0084ab9cef2a2af2f9b0143d0df51265a41294d7b72285efecea921f15b98c03b21004dbd519b85bbbe37d')

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
