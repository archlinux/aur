# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=sing-box-beta
_pkgname=sing-box
_version="1.2-beta7"
pkgver="${_version//[v-]/}"
pkgrel=1

pkgdesc='The universal proxy platform (beta version).'
arch=('x86_64' 'i686')
url='https://sing-box.sagernet.org/'
license=('GPL3')

makedepends=('go')

source=("${_pkgname}-${_version}.tar.gz::https://github.com/SagerNet/sing-box/archive/v${_version}.tar.gz")
sha256sums=('f0c6d438fff54ac5dc0ff8ef01a2a016dc9dc8a6dd7e428fe7546d38daaa6e63')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('sing-geosite: sing-geosite database'
            'sing-geoip: sing-geoip database')

backup=("etc/${_pkgname}/config.json")


_tags=with_gvisor,with_quic,with_wireguard,with_utls,with_clash_api
build(){
    cd "$_pkgname-$_version"

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
        -ldflags "-s -w -buildid= -X github.com/sagernet/sing-box/constant.Version=${pkgver} -linkmode=external" \
        ./cmd/sing-box

    sed -i "/^\[Service\]$/a User=${_pkgname}
            s|WorkingDirectory=\(.*\)$|WorkingDirectory=-\1\nExecStartPre=+install -o ${_pkgname} -g ${_pkgname} -d -m 0700 \1|" release/config/${_pkgname}*.service

    echo "u ${_pkgname} - \"Sing-box Service\" - -" > "release/config/${_pkgname}.sysusers"
}

package() {
    cd "$_pkgname-$_version" || return

    install -Dm755 "${_pkgname}"                         -t "${pkgdir}/usr/bin"
    install -Dm644 "release/config/config.json"          -t "${pkgdir}/etc/${_pkgname}"
    install -Dm644 "release/config/${_pkgname}.service"  -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "release/config/${_pkgname}@.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "release/config/${_pkgname}.sysusers"    "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}
