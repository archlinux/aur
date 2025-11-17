# Maintainer: shtorm <sergeimaklagin7#gmail.com>

_pkgname=sing-box
pkgname=sing-box-extended
_pkgver="1.12.12-extended-1.4.2"
pkgver="${_pkgver//-/\~}"
pkgrel=1

pkgdesc='Sing-box with extended features.'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/shtorm-7/sing-box-extended'
license=("LicenseRef-${pkgname}")

makedepends=('go')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/shtorm-7/sing-box-extended/archive/v$_pkgver.tar.gz"
        "sing-box.rules")
sha256sums=('9c86b5d7b6c739f5ff86f4ab8f7db4818dc883229c3e78e9a9fa71f2f1140cef'
            '1365536e1875043b969e2e18d7313ab7c6f7f9f63387f25506bb04362b44f206')
conflicts=($_pkgname "$_pkgname-git" "$_pkgname-beta" "$pkgname-bin" )
depends=("glibc")
optdepends=('sing-geosite: sing-geosite database'
            'sing-geoip: sing-geoip database')

backup=("etc/$_pkgname/config.json")

prepare() {
    cd "${pkgname}-${_pkgver}"
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

_tags=with_gvisor,with_quic,with_dhcp,with_wireguard,with_utls,with_acme,with_clash_api,with_tailscale
build(){
    cd "${pkgname}-${_pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build \
        -v \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -tags "$_tags" \
        -ldflags "-s -buildid= -X \"github.com/sagernet/sing-box/constant.Version=${_pkgver}\" -checklinkname=0
            -linkmode external -extldflags \"${LDFLAGS}\"" \
        ./cmd/sing-box

    install -d completions
    go run ./cmd/sing-box completion bash   > completions/bash
    go run ./cmd/sing-box completion fish   > completions/fish
    go run ./cmd/sing-box completion zsh    > completions/zsh
}

package() {
    cd "$pkgname-$_pkgver"

    install -Dm644 LICENSE                                 -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm755 "$_pkgname"                              -t "$pkgdir/usr/bin"
    install -Dm644 "release/config/config.json"            -t "$pkgdir/etc/$_pkgname"
    install -Dm644 "release/config/$_pkgname.service"       -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$_pkgname@.service"      -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$_pkgname.sysusers"         "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "release/config/sing-box.rules"         -t "$pkgdir/usr/share/polkit-1/rules.d"
    install -Dm644 "release/config/sing-box-split-dns.xml"    "$pkgdir/usr/share/dbus-1/system.d/sing-box-split-dns.conf"

    install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash"
    install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 completions/zsh  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}