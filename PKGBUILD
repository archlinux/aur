# Maintainer: Bastien 'neitsab' Traverse <neitsab@archlinux.org>

pkgname=incus-compose-git
pkgver=r93.ccd25d4
pkgrel=1
pkgdesc="Bring the familiar Docker Compose workflow to Incus containers"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/r3j0/incus-compose"
license=('Apache-2.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
depends=('incus')
makedepends=('git' 'go')
b2sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname%-git}"
    mkdir -p build/
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd "${pkgname%-git}"
    export GOPATH="${srcdir}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/...
}

# Requires the incus daemon to be running, which breaks when building in a clean chroot
# check() {
#     cd "${pkgname%-git}"
#     go test ./...
# }

package() {
    cd "${pkgname%-git}"
    install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
