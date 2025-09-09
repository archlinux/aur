# Maintainer: ElmForestW <elmforestw@proton.me>

pkgname=pawbar-git
_pkgname=pawbar
pkgver=r314.3aec858
pkgrel=3
pkgdesc="A kitten-panel based desktop panel for your desktop"
arch=("x86_64")
url="https://github.com/codelif/pawbar"
license=("BSD-3-Clause")
depends=("glibc" "systemd-libs" "librsvg" "glib2" "cairo" "kitty")
makedepends=("git" "gcc-objc" "go")
source=("git+${url}.git")
sha256sums=('SKIP')
b2sums=('SKIP')

pkgver() {
    cd pawbar

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd pawbar

    git submodule init
    git config submodule.vaxis.url https://git.sr.ht/~codelif/vaxis
    git submodule update

    export GOPATH="${srcdir}"
    go mod download
}

build() {
    cd pawbar

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -ldflags="-s -w" ./cmd/pawbar
}

package() {
    cd pawbar

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
