# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=sing-box
pkgver=1.1.5
pkgrel=1

pkgdesc='The universal proxy platform.'
arch=('x86_64' 'i686')
url='https://sing-box.sagernet.org/'
license=('GPL3')

makedepends=('go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/SagerNet/sing-box/archive/v$pkgver.tar.gz")
sha256sums=('a1e642362f41bd0e362cd9c8d2f0d29d2eca6a55a948677f6f03cfb81c4f0657')

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
            s|CapabilityBoundingSet=\(.*\)$|CapabilityBoundingSet=\1 CAP_SYS_PTRACE CAP_DAC_READ_SEARCH|
            s|AmbientCapabilities=\(.*\)$|AmbientCapabilities=\1 CAP_SYS_PTRACE CAP_DAC_READ_SEARCH|
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
