# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=webwormhole-git
_pkgname=${pkgname%-git}
pkgver=r195.1c8919c
pkgrel=1
pkgdesc='WebWormhole creates ephemeral pipes between computers to send files or other data.'
arch=('x86_64')
url="https://github.com/saljam/${_pkgname}"
license=('BSD')
depends=('glibc')
makedepends=('go' 'git')
provides=("${_pkgname}")
source=("${_pkgname}::git+${url}.git" "web.patch")
sha256sums=('SKIP'
    '4f87d9e62c2629066f3eaf260a44d6e6a348d27ea6f6a58b3edb4a0c7327ec42')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${_pkgname}"
    patch -p1 -i "${srcdir}/web.patch"
}

build() {
    cd "${srcdir}/${_pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    GOOS=js GOARCH=wasm go build -o ./web/webwormhole.wasm ./web
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    GO111MODULE=on go build ./cmd/ww
}

package() {
    install -D -m755 "${srcdir}/${_pkgname}/ww" "$pkgdir"/usr/bin/ww
    install -d -m755 "$pkgdir"/usr/share/webwormhole
    cp -r "${srcdir}/${_pkgname}/web" "$pkgdir"/usr/share/webwormhole/web
}
