# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=v2ray-cap-git
pkgver=4.20.0.r22.ge9f53059
pkgrel=1
pkgdesc="V2Ray core with capabilities. Special for Transparent Proxies."
arch=(x86_64)
url="https://github.com/v2ray/v2ray-core"
license=(MIT)
depends=(glibc v2ray-domain-list-community v2ray-geoip)
makedepends=(go-pie golang-golang-x-crypto golang-golang-x-net git)
backup=(etc/v2ray/config.json)
provides=(v2ray)
conflicts=(v2ray)
source=("$pkgname::git+$url.git"
        'v2ray.service')
sha512sums=('SKIP'
            '80ea8dde70e43133bbb2803496863e8001fff580281abdbb3be2406ab8789853d4ba7295fbce07058af980a4606eda89c9fc4a7c0f81ec078ae67c38abefbc0c')

prepare() {
    export GOPATH="$srcdir/build:/usr/share/gocode"
    mkdir -p "$srcdir"/build/src/v2ray.com

    # mv *.com *.io *.org *.net "$srcdir"/build/src/
    mv $pkgname "$srcdir"/build/src/v2ray.com/core

    # Future makedepends
    go get github.com/golang/protobuf/proto go.starlark.net/starlark go.starlark.net/syntax \
         google.golang.org/grpc

    # Future checkdepends
    go get github.com/golang/mock/gomock github.com/google/go-cmp/cmp \
         golang.org/x/sync/errgroup github.com/miekg/dns h12.io/socks
}


pkgver() {
    # $pkgname was moved in prepare(), so need to enter new directory
    cd "$srcdir"/build/src/v2ray.com/core

    # cutting off 'v' prefix that presents in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    go build -o v2ray v2ray.com/core/main
    go build -o v2ctl v2ray.com/core/infra/control/main
}

check() {
    cd "$srcdir"/build/src/v2ray.com/core
    go test -p 1 -tags json -v -timeout 30m v2ray.com/core/...
}

package() {
    cd "$srcdir"/build/src/v2ray.com/core
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/v2ray/LICENSE
    install -Dm644 release/config/systemd/v2ray.service "$pkgdir"/usr/lib/systemd/system/v2ray.service
    sed -i -e '/ExecStart/i Environment=V2RAY_LOCATION_ASSET=/etc/v2ray' \
         -e 's|/usr/bin/v2ray/v2ray|/usr/bin/v2ray|' \
         "$pkgdir"/usr/lib/systemd/system/v2ray.service
    install -Dm644 release/config/*.json -t "$pkgdir"/etc/v2ray/
    install -Dm755 "$srcdir"/v2ray -t "$pkgdir"/usr/bin/
    install -Dm755 "$srcdir"/v2ctl -t "$pkgdir"/usr/bin/
    setcap "cap_net_admin,cap_net_bind_service=ep" "$pkgdir"/usr/lib/v2ray/v2ray

    install -Dm644 "$srcdir"/v2ray.service "$pkgdir"/usr/lib/systemd/system/v2ray@.service
}
