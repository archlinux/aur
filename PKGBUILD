# Maintainer: BGME <i@bgme.me>
# Maintainer: everyx <lunt.luo@gmail.com>

pkgname=sing-box-git
_pkgname=sing-box
pkgver=1.1_beta18.r3.gee3cd49
pkgrel=1

pkgdesc='The universal proxy platform (git version).'
arch=('x86_64' 'i686')
url='https://sing-box.sagernet.org/'
license=('GPL3')

provides=("$_pkgname")
conflicts=("sing-box" "sing-box-beta")

makedepends=('go')
optdepends=('sing-geosite:  sing-geosite database'
            'sing-geoip:    sing-geoip database')

backup=('etc/sing-box/config.json')

source=("$_pkgname::git+https://github.com/SagerNet/sing-box.git#branch=dev-next")
sha256sums=('e6b1024d80f7fd9e06c9d02d624e994a4537b0d6078617be499c89dc1c974869')
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-\([^-]*\)-\([^-]*\)$/.\1.\2/;s/-/_/'
}

_tags=with_gvisor,with_quic,with_wireguard,with_utls,with_clash_api
build(){
    cd "$_pkgname"

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

    sed -i '/^\[Service\]$/a User=sing-box' release/config/${_pkgname}*.service

    echo 'u sing-box - "Sing-box Service" - -' > release/config/${_pkgname}.sysusers
}

package() {
    cd "$_pkgname"

    install -Dm755 "${_pkgname}"                         -t "${pkgdir}/usr/bin"
    install -Dm644 "release/config/config.json"          -t "${pkgdir}/etc/${_pkgname}"
    install -Dm644 "release/config/${_pkgname}.service"  -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "release/config/${_pkgname}@.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "release/config/${_pkgname}.sysusers"    "${pkgdir}/usr/lib/sysusers.d//${_pkgname}.conf"
}
