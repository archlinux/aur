# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Nenad Stojanovikj <me+aur@nenad.dev>
# Contributor: David Stark <david@starkers.org>

pkgname=saml2aws
pkgver=2.34.0
pkgrel=1
pkgdesc='CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Versent/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("saml2aws_${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cf21eda44d6f994457756e4089bfd385b720b102841d27c4d1fa8534e3c4010b')

export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

build() {
    local _commit _flags
    _commit=$(bsdcat "saml2aws_${pkgver}.tar.gz" | git get-tar-commit-id)
    _ldflags=(
        -s -w
        -X=main.Version="${pkgver}"
        -X=main.commit="${_commit::7}"
        -X=main.date="$(date -u -d "@${SOURCE_DATE_EPOCH}" +'%FT%TZ')"
        -linkmode=external
    )
    cd "${pkgname}-${pkgver}"
    go build -o "${pkgname}" -ldflags="${_ldflags[*]}" "./cmd/${pkgname}"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${pkgname}" -t "${pkgdir}"/usr/bin
}
