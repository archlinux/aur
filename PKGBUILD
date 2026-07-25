# Maintainer: darksworm <https://github.com/darksworm>
pkgname=argonaut-git
_pkgname=argonaut
pkgver=2.17.1.r14.g4c2667e
pkgrel=1
pkgdesc="A GitOps CLI tool for managing ArgoCD applications (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/darksworm/argonaut"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
source=("${_pkgname}::git+https://github.com/darksworm/argonaut.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    # e.g. v2.17.0-3-gabc1234 -> 2.17.0.r3.gabc1234
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${_pkgname}"
    export CGO_ENABLED=0
    export GOFLAGS="-trimpath -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X main.appVersion=${pkgver}" -o "${_pkgname}" ./cmd/app
}

package() {
    cd "${_pkgname}"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 README.md   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    [ -f CHANGELOG.md ] && install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
    return 0
}
