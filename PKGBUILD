# Maintainer: Divya Jain <git@dvjn.dev>
# Based on saml2aws PKGBUILD by JP Roemer <jp+aur@roemer.im>

pkgname=saml2aws-git
pkgver=2.36.19.r8.g65195ee
pkgrel=1
pkgdesc='CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP (git version)'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Versent/saml2aws"
license=('MIT')
depends=('gcc-libs' 'systemd-libs')
makedepends=('git' 'go')
provides=("saml2aws")
conflicts=("saml2aws" "saml2aws-bin")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

export CGO_ENABLED="1"
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -tags=hidraw"

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    local _commit _flags
    _commit=$(git -C "${pkgname}" rev-parse HEAD)
    _flags=(
        -X=main.Version="${pkgver}"
        -X=main.commit="${_commit::7}"
        -X=main.date="$(date -u -d "@${SOURCE_DATE_EPOCH}" +'%FT%TZ')"
        -linkmode=external
    )
    cd "${pkgname}"
    go build -o "saml2aws" -ldflags="-s -w ${_flags[*]}" "./cmd/saml2aws"
}

package() {
    cd "${pkgname}"
    install -Dm 755 "saml2aws" -t "${pkgdir}/usr/bin"
} 
