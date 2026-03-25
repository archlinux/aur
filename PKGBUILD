# Maintainer: Christian Pfeiffer <cpfeiffer@live.de> 

pkgname=ergochat-dnsbl
_upstream_pkgname=ergo-dnsbl
pkgver=r8.3e66d08
pkgrel=1
pkgdesc="DNSBL plugin for the IRC server Ergo"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/ergochat/ergo-dnsbl"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url")
sha256sums=('SKIP')
backup=("etc/ergochat/dnsbl-config.yaml")

pkgver() {
    cd "${srcdir}/$_upstream_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    GOPATH=$(pwd)/..
    export GOPATH
    cd "${srcdir}/$_upstream_pkgname" || exit

    GIT_COMMIT="$(git rev-parse HEAD)" # 2>/dev/null)"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=vendor \
        -modcacherw \
        -ldflags "-X main.commit=${GIT_COMMIT} -compressdwarf=false -linkmode external -extldflags \"${LDFLAGS}\"" \
        -v \
        .
}

package() {
    cd "$srcdir/$_upstream_pkgname" || exit
    install -Dm755 oragono-dnsbl "$pkgdir/usr/bin/$pkgname"
    install -Dm644 config.yaml "$pkgdir/etc/ergochat/dnsbl-config.yaml"
}
