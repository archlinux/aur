# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=blocky
pkgver=0.20
pkgrel=1
pkgdesc="Fast and lightweight DNS proxy as ad-blocker"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/0xERR0R/blocky"
license=('Apache')
depends=('glibc')
makedepends=('go')
backup=('etc/blocky.yml')
install=blocky.install
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'blocky.service'
        'blocky.sysusers'
        'blocky.yml')
sha256sums=('aae5346e9c1ce4b326b9e578939aa26ddca39338d79d0ddb3eb079ae7a949e87'
            '21a56bc11ad08186b0f6d3394106500c8e662662fe9af5bed56d788fc3c91ebb'
            '8ef3cfa71ee8d2ad427dc5d83df7967a6b3e6e1dfafaec8cb4520e7269c2471b'
            'b2240a9a3a0d732920c481b3d6c80c8d78d7f8153129c8cdf33851c9b16e6e39')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    go mod download
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    cd "$pkgname-$pkgver"
    ## make build overrides our GOFLAGS
    local _BUILDTIME="$(date '+%Y%m%d-%H%M%S')"
    local _govar="${url#https://}/util"
    go build -o build \
        -ldflags "-linkmode=external -extldflags ${LDFLAGS} -X $_govar.Version=$pkgver -X $_govar.BuildTime=$_BUILDTIME"
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    install -Dvm644 blocky.sysusers "$pkgdir/usr/lib/sysusers.d/blocky.conf"
    install -Dvm644 blocky.service -t "$pkgdir/usr/lib/systemd/system/"
    install -Dvm644 blocky.yml -t "$pkgdir/etc/"
    cd "$pkgname-$pkgver"
    install -Dv build/blocky -t "$pkgdir/usr/bin/"
    install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=4 sw=4 et:
