# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=sing-box
pkgver=1.0.6
pkgrel=1

pkgdesc='The universal proxy platform.'
arch=('x86_64' 'i686')
url='https://sing-box.sagernet.org/'
license=('GPL3')

makedepends=('go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/SagerNet/sing-box/archive/v$pkgver.tar.gz")
sha256sums=('0216f4512fa355eeb69083e0240f19284c9674f7227991c7a858bc0ba16dcb34')

conflicts=("${pkgname}-git")
optdepends=('sing-geosite: sing-geosite database'
            'sing-geoip: sing-geoip database')

backup=('etc/sing-box/config.json')

_tags=with_quic,with_wireguard,with_clash_api
build(){
    cd $pkgname-$pkgver

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
        -ldflags '-linkmode=external -w -s' \
        ./cmd/sing-box
}

package() {
    cd $pkgname-$pkgver

    install -Dm755 "${pkgname}"                         -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE"                            -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "release/config/config.json"         -t "${pkgdir}/etc/${pkgname}"
    install -Dm644 "release/config/sing-box.service"    -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "release/config/sing-box@.service"   -t "${pkgdir}/usr/lib/systemd/system"
}
