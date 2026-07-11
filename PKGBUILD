# Maintainer: Bastien 'neitsab' Traverse <neitsab@archlinux.org>
# Maintainer: René Jochum <r3j0@jochum.dev>

pkgname=incus-compose-git
pkgver=r577.f885e8b
pkgrel=2
pkgdesc="Bring the familiar Docker Compose workflow to Incus containers"
arch=('x86_64' 'aarch64')
url="https://github.com/lxc/incus-compose"
license=('Apache-2.0')
source=("git+$url.git")
depends=('incus')
optdepends=(
  'podman: build service images locally with `incus-compose build`'
  'docker: build service images locally with `incus-compose build`'
)
makedepends=('git' 'go>=1.26.5')
b2sums=('SKIP')

provides=('incus-compose')
conflicts=('incus-compose' 'incus-compose-bin')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname%-git}"
    # docs/ is a git submodule; a plain clone leaves it empty.
    git submodule update --init --recursive
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
    go build -o bin/"${pkgname%-git}" ./cmd/"${pkgname%-git}"
}

# Requires the incus daemon to be running, which breaks when building in a clean chroot
# check() {
#     cd "${pkgname%-git}"
#     go test ./...
# }

package() {
    cd "${pkgname%-git}"
    install -Dm755 "bin/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # Documentation
    install -v -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -v -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    cp -vr docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
