# Maintainer: AkinoKaede <autmaple@protonmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>
# Contributor: Dct Mei <dctxmei@yandex.com>

pkgname=xray-git
pkgver=1.4.2.r4.1e3d739
pkgrel=1
pkgdesc="The best v2ray-core, with XTLS support."
arch=('x86_64')
url="https://github.com/XTLS/Xray-core"
license=('MPL2')
depends=('glibc' 'xray-domain-list-community' 'xray-geoip')
makedepends=('go' 'git')
backup=(etc/xray/config.json)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "Xray-core::git+${url}.git"
    "xray.sysusers"
    "xray.tmpfiles"
    "xray.service"
    "xray@.service"
)
sha256sums=(
    'SKIP'
    '801131bf2eb079750f17d3e703e414eab8494db0d512164cdef3cc68cef308b8'
    '2d301e9f2fae728da55f33a15b2c36e90cdb657deafb5d6ab7d74375ce9fdf38'
    '66a8a3280aa5b3ed41b9855ba3de3f884bd2113b4a965cf097fcb31c3a6066ed'
    '05d16acd6e00989ece245bf0df919accae858555c7165a50ce2b3db9c0c5a725'
)

pkgver() {
    cd "${srcdir}"/Xray-core
    printf "%s" "$(git describe --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${srcdir}"/Xray-core
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    go build -o xray ./main
}

check() {
    cd "${srcdir}"/Xray-core
    go test -p 1 -tags json -v -timeout 30m github.com/xtls/xray-core/core/...
}

package() {
    install -Dm755 "${srcdir}"/Xray-core/xray -t "${pkgdir}"/usr/bin/
    install -Dm644 "${srcdir}"/Xray-core/LICENSE -t "${pkgdir}"/usr/share/licenses/xray/
    install -Dm644 "${srcdir}"/xray.sysusers "${pkgdir}"/usr/lib/sysusers.d/xray.conf
    install -Dm644 "${srcdir}"/xray.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/xray.conf
    install -Dm644 "${srcdir}"/xray.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 "${srcdir}"/xray@.service -t "${pkgdir}"/usr/lib/systemd/system/
}
