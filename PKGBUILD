# Maintainer: sim0n <aur.direction446@aleeas.com>
pkgname=sing-box-ref1nd
_pkgname=sing-box
pkgver=1.14.4
pkgrel=1

pkgdesc='The universal proxy platform.'
arch=('x86_64' 'aarch64')
url='https://github.com/reF1nd/sing-box'
license=('LicenseRef-sing-box')

depends=('glibc' 'libgcc')
makedepends=('go' 'clang' 'lld')
provides=("$_pkgname")
options=('!debug')

source=("$_pkgname-$pkgver-reF1nd.tar.gz::https://github.com/reF1nd/sing-box/archive/refs/tags/v$pkgver-reF1nd.tar.gz")
sha256sums=('50d8688711a606a0de75d3e2e602f01e7d01921171feca5cabeeabcb706f01e2')

conflicts=("$_pkgname-git" "$_pkgname-alpha" "$_pkgname-beta" "$pkgname-git")

backup=("etc/$_pkgname/config.json")

prepare() {
    cd "$_pkgname-$pkgver-reF1nd"

    export GOPATH="$srcdir"
    go mod download -modcacherw
}

build(){
    cd "$_pkgname-$pkgver-reF1nd"

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
    cd "$_pkgname-$pkgver-reF1nd"

    install -Dm644 LICENSE                            -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm755 sing-box-bin "$pkgdir/usr/lib/$_pkgname/$_pkgname"
    install -Dm755 libcronet.so  -t "$pkgdir/usr/lib/$_pkgname"
    install -d "$pkgdir/usr/bin"
    ln -s "../lib/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "release/config/config.json"       -t "$pkgdir/etc/$_pkgname"
    install -Dm644 "release/config/$_pkgname.service"  -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$_pkgname@.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$_pkgname.sysusers"    "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "release/config/sing-box.rules"       "$pkgdir/usr/share/polkit-1/rules.d/sing-box.rules"
    install -Dm644 "release/config/sing-box-split-dns.xml" "$pkgdir/usr/share/dbus-1/system.d/sing-box-split-dns.conf"

    install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash"
    install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 completions/zsh  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
