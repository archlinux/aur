# Maintainer: Daniel Milde <daniel@milde.cz>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=esbuild
pkgver=0.17.0
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://${pkgname}.github.io/"
license=('MIT')
makedepends=('go')
_snapshot="${pkgname}-${pkgver}"
source=("${_snapshot}.tar.gz::https://github.com/evanw/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('be8b5a1c149026f83f92aa9ef9fc742587efe818fc4ba7d818757121f4e761b6f3c6871a24e33e57fa1bc7fabefea36f9c0fb99c5147a6c95e6013cdafcbb43b')

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
