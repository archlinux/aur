# Maintainer: sim0n <aur.direction446@aleeas.com>
pkgname=sing-box-ref1nd
_pkgname=sing-box
pkgver=1.13.2
pkgrel=1

pkgdesc='The universal proxy platform.'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/reF1nd/sing-box'
license=('GPL3 with name use or association addition')

makedepends=('go' 'mold')
provides=("$_pkgname")
options=('!debug')

source=("$_pkgname-$pkgver-reF1nd.tar.gz::https://github.com/reF1nd/sing-box/archive/refs/tags/v$pkgver-reF1nd.tar.gz")
sha256sums=('2f40e2245731c5c097eed1ceeced341f82c36218ef6f24167242ad30e97f024a')

conflicts=("$_pkgname-git" "$_pkgname-alpha" "$_pkgname-beta" "$pkgname-git")

backup=("etc/$_pkgname/config.json")

_tags=with_utls,with_gvisor,with_quic,with_wireguard,with_clash_api,with_acme,with_dhcp,with_tailscale,with_naive_outbound
build(){
    cd "$_pkgname-$pkgver-reF1nd"

    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export VERSION="$pkgver"
    export CGO_ENABLED=1
    export CGO_LDFLAGS="-fuse-ld=mold"

    go build \
        -v \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -tags "$_tags" \
        -ldflags "
            -X \"github.com/sagernet/sing-box/constant.Version=$VERSION\"
            -s -w -buildid= -linkmode=external" \
        ./cmd/sing-box

    echo "u $_pkgname - \"Sing-box Service\" - -" > "release/config/$_pkgname.sysusers"

    install -d completions
    go run ./cmd/sing-box completion bash   > completions/bash
    go run ./cmd/sing-box completion fish   > completions/fish
    go run ./cmd/sing-box completion zsh    > completions/zsh
}

package() {
    cd "$_pkgname-$pkgver-reF1nd"

    install -Dm644 LICENSE                            -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm755 "$_pkgname"                         -t "$pkgdir/usr/bin"
    install -Dm644 "release/config/config.json"       -t "$pkgdir/etc/$_pkgname"
    install -Dm644 "release/config/$_pkgname.service"  -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$_pkgname@.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$_pkgname.sysusers"    "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "release/config/sing-box.rules"       "$pkgdir/usr/share/polkit-1/rules.d/sing-box.rules"

    install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash"
    install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 completions/zsh  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
