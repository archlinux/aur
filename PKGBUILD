# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=sing-box
pkgver=1.2.0
pkgrel=1

pkgdesc='The universal proxy platform.'
arch=('x86_64' 'i686')
url='https://sing-box.sagernet.org/'
license=('GPL3')

makedepends=('go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/SagerNet/sing-box/archive/v$pkgver.tar.gz")
sha256sums=('ec70c2eecf85788e82c29ec4ca129e25292d5fc66a510b4b713fe337650740a9')

conflicts=("${pkgname}-git" "${pkgname}-beta")
optdepends=('sing-geosite: sing-geosite database'
            'sing-geoip: sing-geoip database')

backup=("etc/${pkgname}/config.json")

_tags=with_gvisor,with_quic,with_wireguard,with_utls,with_clash_api
build(){
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -v \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -tags "$_tags" \
        -ldflags '-s -w -buildid= -linkmode=external' \
        ./cmd/sing-box

    sed -i "/^\[Service\]$/a User=${pkgname}
            s/WorkingDirectory=\(.*\)$/WorkingDirectory=-\1\nExecStartPre=+install -o ${pkgname} -g ${pkgname} -d -m 0700 \1/" release/config/${pkgname}*.service

    echo "u ${pkgname} - \"Sing-box Service\" - -" > "release/config/${pkgname}.sysusers"
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "${pkgname}"                         -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE"                            -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "release/config/config.json"         -t "${pkgdir}/etc/${pkgname}"
    install -Dm644 "release/config/${pkgname}.service"  -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "release/config/${pkgname}@.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "release/config/${pkgname}.sysusers"    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
