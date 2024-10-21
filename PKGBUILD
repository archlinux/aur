# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Nenad Stojanovikj <me+aur@nenad.dev>
# Contributor: David Stark <david@starkers.org>

pkgname=saml2aws
pkgver=2.36.18
pkgrel=1
pkgdesc='CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Versent/saml2aws"
license=('MIT')
depends=('gcc-libs' 'systemd-libs')
makedepends=('git' 'go')
provides=("${pkgname}")
conflicts=("${pkgname}-bin")
install="install"
source=("${pkgname}_${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('df31cff6e82558869133b9d6621cd5719719df02e3df645f4831c671ef23e63d')

export GGO_ENABLED="1"
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -tags=hidraw"

build() {
    local _commit _flags
    _commit=$(bsdcat "${pkgname}_${pkgver}.tar.gz" | git get-tar-commit-id)
    _flags=(
        -X=main.Version="${pkgver}"
        -X=main.commit="${_commit::7}"
        -X=main.date="$(date -u -d "@${SOURCE_DATE_EPOCH}" +'%FT%TZ')"
        -linkmode=external
    )
    cd "${pkgname}-${pkgver}"
    go build -o "${pkgname}" -ldflags="-s -w ${_flags[*]}" "./cmd/${pkgname}"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
