# Maintainer: m8D2 <omui (at) proton mail (dot) com>
# Maintainer: Dct Mei <dctxmei@gmail.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

pkgname=v2ray-git
pkgver=4.20.0.r22.ge9f53059
pkgrel=1
pkgdesc="A set of network tools that help you to build your own computer network (git version)."
arch=(x86_64)
url="https://github.com/v2ray/v2ray-core"
license=(MIT)
makedepends=(go)
provides=(v2ray)
conflicts=(v2ray)
source=("$pkgname::git+$url.git"
        "v2ray.service")
sha512sums=('SKIP'
            '37efc20ef71147f4400eba2bf57766462b5803b5952768bd32d5224f35e37c9c5639aaa19e0f3b63b52063dafd0381f40e2bfbb60dace08b055f0b3245cfa2b7')

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

    install -Dm644 "$srcdir"/v2ray.service "$pkgdir"/usr/lib/systemd/system/v2ray@.service
}
