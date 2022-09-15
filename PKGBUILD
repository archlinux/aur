# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=sing-box
pkgver=1.0.4
pkgrel=1

pkgdesc='The universal proxy platform.'
arch=('x86_64' 'i686')
url='https://sing-box.sagernet.org/'
license=('GPL3')

makedepends=('go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/SagerNet/sing-box/archive/v$pkgver.tar.gz")
sha256sums=('bf477345e54166c6226ef864f602ac048a26a13f9628d80f837a2084c777187a')

provides=("${pkgname}")
conflicts=("${pkgname}-git")

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
