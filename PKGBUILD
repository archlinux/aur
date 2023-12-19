# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=sing-box-beta
_pkgname=sing-box
_version="1.8.0-beta.8"
pkgver="${_version//-/.}"
pkgrel=1

pkgdesc='The universal proxy platform (beta version).'
arch=('x86_64' 'i686')
url='https://sing-box.sagernet.org/'
license=('GPL3 with name use or association addition')

makedepends=('go')

source=("$_pkgname-$_version.tar.gz::https://github.com/SagerNet/sing-box/archive/v$_version.tar.gz")
sha256sums=('ea47f251f62f50e22c17f0115e372cb1d48837adad106ab1f20fa93fc4f67072')

provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=('sing-geosite: sing-geosite database'
            'sing-geoip: sing-geoip database')

backup=("etc/$_pkgname/config.json")


_tags=with_gvisor,with_quic,with_wireguard,with_utls,with_reality_server,with_clash_api,with_ech
build(){
    cd "$_pkgname-$_version" || return

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
        -ldflags "-s -w -buildid= -X github.com/sagernet/sing-box/constant.Version=v$_version -linkmode=external" \
        ./cmd/sing-box

    sed -i "/^\[Service\]$/a StateDirectory=$_pkgname"    release/config/$_pkgname.service
    sed -i "/^\[Service\]$/a StateDirectory=$_pkgname-%i" release/config/$_pkgname@.service
    sed -i "/^\[Service\]$/a User=$_pkgname"              release/config/$_pkgname*.service

    echo "u $_pkgname - \"Sing-box Service\" - -" > "release/config/$_pkgname.sysusers"

    install -d completions
    go run ./cmd/sing-box completion bash   > completions/bash
    go run ./cmd/sing-box completion fish   > completions/fish
    go run ./cmd/sing-box completion zsh    > completions/zsh
}

package() {
    cd "$_pkgname-$_version" || return

    install -Dm644 LICENSE                             -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm755 "$_pkgname"                         -t "$pkgdir/usr/bin"
    install -Dm644 "release/config/config.json"        -t "$pkgdir/etc/$_pkgname"
    install -Dm644 "release/config/$_pkgname.service"  -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$_pkgname@.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$_pkgname.sysusers"    "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"

    install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash"
    install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 completions/zsh  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
