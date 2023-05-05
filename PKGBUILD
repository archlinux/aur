# Maintainer: solopasha <daron439 at gmail dot com>
pkgname=torrserver-git
pkgver=123.1.r0.g5179d15
pkgrel=1
pkgdesc="Torrent stream server"
arch=('x86_64' 'armv7h' 'aarch64' 'i686')
url="https://github.com/YouROK/TorrServer"
license=("GPL3")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=("glibc" "gcc-libs")
makedepends=("git" "go" "yarn")
options=(!lto)
source=("${pkgname}::git+${url}.git"
        "torrserver.service")
install=torrserver.install
sha512sums=('SKIP'
            '73766959e977015a928fd9739344c51893fac5a119a80bbb499410fab8093c9d6e5f3b884d825fff48ff749b375f53e6a15c525cc0e0700e726b3945f49c287e')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^MatriX\.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"/web
    export YARN_CACHE_FOLDER="$srcdir"/yarn
    yarn install --no-fund
    sed '10 i const crypto = require("crypto");\nconst crypto_orig_createHash = crypto.createHash;\ncrypto.createHash = algorithm => crypto_orig_createHash(algorithm == "md4" ? "sha256" : algorithm);' \
        -i node_modules/react-scripts/config/webpack.config.js
}

build() {
    export GOPATH="$srcdir"/gopath
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -tags=nosqlite"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1
    cd "$srcdir/$pkgname/web" 
    yarn run build --no-fund
    cd "$srcdir/$pkgname"
    go run gen_web.go
    cd "$srcdir/$pkgname/server"
    go build -o "${pkgname%-git}" ./cmd
}
package() {
    install -Dm755 "${pkgname}/server/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "torrserver.service" -t "${pkgdir}/usr/lib/systemd/user"
}
