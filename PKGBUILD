# Maintainer: halvacoffee <halvalatte@proton.me>
# Fork: https://github.com/hoaxisr/amnezia-box (AmneziaWG + xhttp + mieru support)
#
# This is the development package: it builds from the tip of the awg-1.14 branch
# (latest commit), not a tagged release. pkgver() derives a monotonic version from
# the latest tag + commit count + short hash, so AUR rebuilds sort correctly.
#
# To update the tracked branch, change _branch below and regenerate .SRCINFO.

pkgname=amnezia-box-git
_branch=awg-1.14
pkgver=1.14.0alpha.48awg3xhttpmieru.r2546.930d9b79
pkgrel=1

pkgdesc='The universal proxy platform, forked with AmneziaWG (awg) outbound, xhttp and mieru support. Development build from latest commit.'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url='https://github.com/hoaxisr/amnezia-box'
license=('GPL3')

# Binary / unit files are still named "sing-box" (kept as upstream for compatibility).
makedepends=('git' 'go' 'clang' 'lld')
source=("$pkgname::git+https://github.com/hoaxisr/amnezia-box.git#branch=$_branch")
sha256sums=('SKIP')
conflicts=('sing-box' 'sing-box-git' 'sing-box-beta' 'amnezia-box')
depends=('glibc')
optdepends=('sing-geosite-rule-set: GeoSite rule sets'
            'sing-geoip-rule-set: GeoIP rule sets')

backup=('etc/sing-box/config.json')

pkgver() {
    cd "$pkgname"
    local tag
    tag=$(git describe --tags --abbrev=0 2>/dev/null | tr -d '-')
    printf '%s.r%s.%s' "$tag" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    export GOPATH="${srcdir}"
    export GOMODCACHE="${srcdir}/modcache"
    export GOTOOLCHAIN=local
    go mod download -modcacherw
}

build() {
    cd "$pkgname"

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
    local GITVER
    GITVER=$(git describe --tags --always 2>/dev/null)

    go build -v \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -tags "$TAGS" \
        -ldflags "-linkmode external -X github.com/sagernet/sing-box/constant.Version=${GITVER} ${LDFLAGS_SHARED} -s -buildid=" \
        -o sing-box \
        ./cmd/sing-box

    install -d completions
    ./sing-box completion bash > completions/bash
    ./sing-box completion fish > completions/fish
    ./sing-box completion zsh  > completions/zsh
}

package() {
    cd "$pkgname"

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
