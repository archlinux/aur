# Contributor: Ben Goldberg <ben@benaaron.dev>

_pkgname=gemcert
pkgname=gemcert-git
pkgver=r15.fc14deb
pkgrel=4
pkgdesc="A simple tool for creating self-signed certs for use in Geminispace."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
depends=('glibc')
makedepends=('go' 'git')
url="https://git.sr.ht/~solderpunk/gemcert"
license=('BSD')
provides=(gemcert)
conflicts=(gemcert)
source=("gemcert::git+https://git.sr.ht/~solderpunk/gemcert")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_pkgname}
    mkdir -p build/
    if [ ! -f go.mod ]; then
        go mod init "${url#https://}" # strip https:// from canonical URL
        go mod tidy
    fi
}

build() {
    cd ${_pkgname}
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build \
        -o build/gemcert \
        main.go
}

#check() {
#    cd ${_pkgname}
#    go test ./...
#}

package() {
    cd ${_pkgname}
    install -Dm755 build/gemcert "$pkgdir"/usr/bin/gemcert
}
