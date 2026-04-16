# Maintainer: David Hrabě <david.hrabe12@seznam.cz>
pkgname=vegas-credentials-git
pkgver=0.14.4.r0.g37dee67
pkgrel=1
pkgdesc="AWS credential_process utility to assume IAM Roles with Yubikey Touch and TOTP MFA, with encrypted caching and automatic credential refresh"
arch=('x86_64' 'aarch64')
url="https://github.com/aripalo/vegas-credentials"
license=('Apache-2.0')
depends=('glibc')
optdepends=('yubikey-manager: for Yubikey Touch TOTP MFA support')
makedepends=('go>=1.18' 'git')
provides=('vegas-credentials')
conflicts=('vegas-credentials')
options=('!debug')
source=("${pkgname}::git+https://github.com/aripalo/vegas-credentials.git")
b2sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${pkgname}"
    go mod download
}

build() {
    cd "${pkgname}"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build \
        -ldflags "-X github.com/aripalo/vegas-credentials/internal/config.Version=${pkgver}" \
        -o "${pkgname%-git}" \
        ./main.go
}

check() {
    cd "${pkgname}"
    go test ./...
}

package() {
    cd "${pkgname}"
    install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 LICENSE           "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm644 README.md         "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
