# Maintainer: sim0n <aur.direction446@aleeas.com>
pkgname=sing-box-ref1nd-git
_pkgname=sing-box
pkgver=1.15.0.alpha.13.reF1nd.0.g17397d022
pkgrel=1
options=('!lto' '!debug')

pkgdesc='The universal proxy platform.'
arch=('x86_64' 'aarch64')
url='https://github.com/reF1nd/sing-box/tree/reF1nd-testing'
license=('LicenseRef-sing-box')

depends=('glibc' 'libgcc')
makedepends=('go' 'git' 'clang' 'lld')
provides=("$_pkgname")

source=("$_pkgname::git+https://github.com/reF1nd/sing-box.git#branch=reF1nd-testing")
sha256sums=('SKIP')

conflicts=("$_pkgname-git" "$_pkgname-alpha" "$_pkgname-beta" "$_pkgname-ref1nd")

backup=("etc/$_pkgname/config.json")

pkgver() {
    cd "$_pkgname"

    git describe --long --tags --match '*-reF1nd' HEAD \
        | sed -E 's/^v//; s/-/./g'
}

prepare() {
    cd "$_pkgname"

    export GOPATH="$srcdir"
    go mod download -modcacherw
}

build(){
    cd "$_pkgname"

    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS -fuse-ld=lld"
    export CGO_ENABLED=1
    export CC=clang
    export CXX=clang++
    export GOFLAGS='-p=2'

    local _goarch
    local _cronet_libdir
    case "$CARCH" in
        x86_64) _goarch=amd64 ;;
        aarch64) _goarch=arm64 ;;
        *) echo "Unsupported architecture: $CARCH" >&2; return 1 ;;
    esac
    _cronet_libdir="$(go env GOPATH)/pkg/mod/github.com/sagernet/cronet-go/lib/linux_${_goarch}@$(go list -mod=readonly -m -f '{{.Version}}' github.com/sagernet/cronet-go/lib/linux_${_goarch})"

    local _tags
    local _ldflags
    _tags="$(<release/DEFAULT_BUILD_TAGS),with_purego"
    _ldflags="$(<release/LDFLAGS)"
    local _capabilities='CAP_NET_ADMIN CAP_NET_RAW CAP_NET_BIND_SERVICE CAP_SYS_PTRACE CAP_DAC_READ_SEARCH'

    sed -i "/^\[Service\]$/a AmbientCapabilities=$_capabilities\nCapabilityBoundingSet=$_capabilities\nUser=$_pkgname" release/config/"$_pkgname".service release/config/"$_pkgname"@.service
    printf 'u %s - "Sing-box Service" - -\n' "$_pkgname" > release/config/"$_pkgname".sysusers

    go build \
        -v \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -tags "$_tags" \
        -ldflags "
            -X \"github.com/sagernet/sing-box/constant.Version=$pkgver\"
            $_ldflags -s -w -buildid= -linkmode=external" \
        -o sing-box-bin \
        ./cmd/sing-box

    install -Dm755 "$_cronet_libdir/libcronet.so" libcronet.so

    install -d completions
    ./sing-box-bin completion bash > completions/bash
    ./sing-box-bin completion fish > completions/fish
    ./sing-box-bin completion zsh  > completions/zsh
}

package() {
    cd "$_pkgname"

    install -Dm644 LICENSE                            -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm755 sing-box-bin "$pkgdir/usr/lib/$_pkgname/$_pkgname"
    install -Dm755 libcronet.so  -t "$pkgdir/usr/lib/$_pkgname"
    install -d "$pkgdir/usr/bin"
    ln -s "../lib/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "release/config/config.json"       -t "$pkgdir/etc/$_pkgname"
    install -Dm644 "release/config/$_pkgname.service"  -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$_pkgname@.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$_pkgname.sysusers"    "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    if [[ -f release/config/sing-box.rules ]]; then
        install -Dm644 release/config/sing-box.rules -t "$pkgdir/usr/share/polkit-1/rules.d"
    fi
    install -Dm644 release/config/sing-box-split-dns.xml "$pkgdir/usr/share/dbus-1/system.d/sing-box-split-dns.conf"

    install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash"
    install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 completions/zsh  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
