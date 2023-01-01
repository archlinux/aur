# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=groom-git
_pkgname=${pkgname%-git}
pkgver=r1.365ba93
pkgrel=4
pkgdesc='Self-hosted HTTPS reverse-proxy, used to expose local private services to the public internet over secure websocket tunnels. Alternative to ngrok.'
arch=('x86_64' 'aarch64')
url="https://github.com/pyke369/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    (
        set -o pipefail
        git describe --long 2> /dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${_pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o groom
}

package() {
    install -D -m755 "${srcdir}/${_pkgname}/groom" "$pkgdir"/usr/bin/groom
    install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
    cp -r "${srcdir}/${_pkgname}/conf" "${pkgdir}/usr/share/doc/${_pkgname}/conf"
    install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -m644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
