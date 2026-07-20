# Maintainer: hoaxisr <hoaxisr@users.noreply.github.com>
# Fork: https://github.com/hoaxisr/amnezia-box (AmneziaWG + xhttp + mieru support)
#
# To update: bump _pkgver to the new release tag, then run
#   updpkgsums                 # refreshes sha256sums from the downloaded tarball
#   makepkg --printsrcinfo > .SRCINFO
# The pkgver() is intentionally omitted (pinned release); the fork's tags always
# carry the "-awgN-..." suffix, so stripping hyphens keeps ordering monotonic.

pkgname=amnezia-box
_pkgver=1.14.0-alpha.48-awg3-xhttp-mieru
pkgver=${_pkgver//-/}
pkgrel=1

pkgdesc='The universal proxy platform, forked with AmneziaWG (awg) outbound, xhttp and mieru support.'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url='https://github.com/hoaxisr/amnezia-box'
license=('GPL3')

# Binary / unit files are still named "sing-box" (kept as upstream for compatibility).
makedepends=('go' 'clang' 'lld')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/hoaxisr/amnezia-box/archive/$_pkgver.tar.gz")
sha256sums=('6048b6d8dacff28308b9e9286591a8dd2f22e057c1a8333af56477b9001ae389')
conflicts=('sing-box' 'sing-box-git' 'sing-box-beta')
depends=('glibc')
optdepends=('sing-geosite-rule-set: GeoSite rule sets'
            'sing-geoip-rule-set: GeoIP rule sets')

backup=('etc/sing-box/config.json')

prepare() {
    cd "${pkgname}-${_pkgver}"
    export GOPATH="${srcdir}"
    export GOMODCACHE="${srcdir}/modcache"
    export GOTOOLCHAIN=local
    go mod download -modcacherw
}

build() {
    cd "${pkgname}-${_pkgver}"

    export GOPATH="${srcdir}"
    export GOMODCACHE="${srcdir}/modcache"
    export GOTOOLCHAIN=local

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS} -fuse-ld=lld"
    export CGO_ENABLED=1
    export CC=clang
    export CXX=clang++

    local TAGS=$(cat release/DEFAULT_BUILD_TAGS)
    local LDFLAGS_SHARED=$(cat release/LDFLAGS)

    go build -v \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -tags "$TAGS" \
        -ldflags "-linkmode external -X github.com/sagernet/sing-box/constant.Version=${_pkgver} ${LDFLAGS_SHARED} -s -buildid=" \
        -o sing-box \
        ./cmd/sing-box

    install -d completions
    ./sing-box completion bash > completions/bash
    ./sing-box completion fish > completions/fish
    ./sing-box completion zsh  > completions/zsh
}

package() {
    cd "${pkgname}-${_pkgver}"

    install -Dm644 LICENSE                                 -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm755 "sing-box"                              -t "$pkgdir/usr/bin"
    install -Dm644 "release/config/config.json"            -t "$pkgdir/etc/sing-box"
    install -Dm644 "release/config/sing-box.rules"         -t "$pkgdir/usr/share/polkit-1/rules.d"
    install -Dm644 "release/config/sing-box.service"       -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/sing-box.sysusers"         "$pkgdir/usr/lib/sysusers.d/sing-box.conf"
    install -Dm644 "release/config/sing-box@.service"      -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/sing-box-split-dns.xml"    "$pkgdir/usr/share/dbus-1/system.d/sing-box-split-dns.conf"

    install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/sing-box.bash"
    install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/sing-box.fish"
    install -Dm644 completions/zsh  "${pkgdir}/usr/share/zsh/site-functions/_sing-box"
}
