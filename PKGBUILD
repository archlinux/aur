# Maintainer: Dct Mei <dctxmei@gmail.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>
pkgname=v2ray-git
pkgver=3.33
pkgrel=1
pkgdesc="A platform for building proxies to bypass network restrictions"
arch=('x86_64')
url="https://github.com/v2ray/v2ray-core"
license=('MIT')
makedepends=("git" "go")
provides=('v2ray')
conflicts=('v2ray')
source=("git+${url}.git"
        "v2ray.service")
sha512sums=("SKIP"
            "80ea8dde70e43133bbb2803496863e8001fff580281abdbb3be2406ab8789853d4ba7295fbce07058af980a4606eda89c9fc4a7c0f81ec078ae67c38abefbc0c")

pkgver() {
    git -C v2ray-core describe | sed -e 's/^v//' -e 's/-/./g'
}

prepare() {
    export GOPATH="$srcdir/build"
    go get v2ray.com/core github.com/miekg/dns golang.org/x/sys/unix v2ray.com/ext/assert \
        github.com/gorilla/websocket golang.org/x/crypto/chacha20poly1305 golang.org/x/crypto/sha3 \
        v2ray.com/ext golang.org/x/net/proxy github.com/google/go-github/github golang.org/x/oauth2 \
        github.com/gogo/protobuf/proto google.golang.org/grpc
    go install v2ray.com/ext/tools/build/vbuild
}

build() {
    cd v2ray-core
    "$GOPATH"/bin/vbuild
}

check() {
    cd v2ray-core
    go test -p 1 -tags json -v v2ray.com/core/...
}

package() {
    cd v2ray-core
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/v2ray/LICENSE
    install -Dm644 release/config/systemd/v2ray.service ${pkgdir}/usr/lib/systemd/system/v2ray.service
    sed -i '/ExecStart/c\ExecStart=/usr/bin/env V2RAY_VMESS_PADDING=1 v2ray.location.asset=/etc/v2ray /usr/bin/v2ray -config /etc/v2ray/config.json' "$pkgdir"/usr/lib/systemd/system/v2ray.service
    install -Dm644 release/config/geoip.dat release/config/geosite.dat release/config/*.json -t "$pkgdir"/etc/v2ray/
    install -Dm755 "$GOPATH"/bin/v2ray-custom-linux-64/{v2ray,v2ctl} -t "$pkgdir"/usr/bin/

    install -Dm644 "$srcdir"/v2ray.service "$pkgdir"/usr/lib/systemd/system/v2ray@.service
}
