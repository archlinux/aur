# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=sing-box
pkgver=1.2.4
pkgrel=1

pkgdesc='The universal proxy platform.'
arch=('x86_64' 'i686')
url='https://sing-box.sagernet.org/'
license=('GPL3 with name use or association addition')

makedepends=('go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/SagerNet/sing-box/archive/v$pkgver.tar.gz")
sha256sums=('72dd2f358ce17605e17862be8cd34b84e150ce505f08d0d75af50c5cf5a23c29')

conflicts=("$pkgname-git" "$pkgname-beta")
optdepends=('sing-geosite: sing-geosite database'
            'sing-geoip: sing-geoip database')

backup=("etc/$pkgname/config.json")

_tags=with_gvisor,with_quic,with_wireguard,with_utls,with_reality_server,with_clash_api
build(){
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"

    go build \
        -v \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -tags "$_tags" \
        -ldflags "
            -X \"github.com/sagernet/sing-box/constant.Version=$pkgver\"
            -s -w -buildid= -linkmode=external" \
        ./cmd/sing-box

    sed -i "/^\[Service\]$/a User=$pkgname" release/config/$pkgname*.service

    echo "u $pkgname - \"Sing-box Service\" - -" > "release/config/$pkgname.sysusers"
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm644 LICENSE                            -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm755 "$pkgname"                         -t "$pkgdir/usr/bin"
    install -Dm644 "release/config/config.json"       -t "$pkgdir/etc/$pkgname"
    install -Dm644 "release/config/$pkgname.service"  -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$pkgname@.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$pkgname.sysusers"    "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
