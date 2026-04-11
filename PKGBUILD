# Maintainer: Lucasion <https://github.com/LucasionGS>
pkgname=ionix-file-manager-git
pkgver=r22.e9606ea
pkgrel=1
pkgdesc="A keyboard-focused terminal file manager with Kitty graphics protocol support"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/LucasionGS/ionix-file-manager"
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=('ifm')
conflicts=('ifm')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    export GOPATH="${srcdir}/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build -trimpath -mod=readonly -o bin/ifm .

    # During build, for some reason, a library gets readonly files.
    # We need to make them writable so that makepkg can clean up after itself.
    chmod -R u+w "${GOPATH}/pkg/mod"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 bin/ifm "${pkgdir}/usr/bin/ifm"
}
