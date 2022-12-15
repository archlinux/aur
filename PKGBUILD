# Maintainer: Daniel Milde <daniel@milde.cz>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_name=esbuild
pkgname=${_name}
pkgver=0.16.7
pkgrel=2
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://${_name}.github.io/"
license=('MIT')
makedepends=('go')
_snapshot="${_name}-${pkgver}"
source=("${_snapshot}.tar.gz::https://github.com/evanw/${_name}/archive/v${pkgver}.tar.gz")
b2sums=('7c53afa22e3ec1406e82d288187d14b768a92be011a0c0fe534d161f7064fcc404ea7d1111c8ba1c5aba7c63a19c51a02a52b21af711f85751f4a6ecbb562fb5')

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
    local bin="/usr/bin/${_name}"
    install -Dm755 "build/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"

    cd "${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE.md"
}
