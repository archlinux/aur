# Maintainer: everyx <lunt.luo@gmail.com>
# Contributor: BGME <i@bgme.me>

pkgname=sing-box-git
_pkgname=sing-box
pkgver=1.3beta11.r13.g9ee0f0e
pkgrel=1

pkgdesc='The universal proxy platform (git version).'
arch=('x86_64' 'i686')
url='https://sing-box.sagernet.org/'
license=('GPL3 with name use or association addition')

provides=("$_pkgname")
conflicts=("sing-box" "sing-box-beta")

makedepends=('go')
optdepends=('sing-geosite:  sing-geosite database'
            'sing-geoip:    sing-geoip database')

backup=("etc/$_pkgname/config.json")

source=("$_pkgname::git+https://github.com/SagerNet/sing-box.git#branch=dev-next")
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-\([^-]*\)-\([^-]*\)$/.\1.\2/;s/-//'
}

_tags=with_gvisor,with_quic,with_wireguard,with_utls,with_clash_api
build(){
    cd "$_pkgname"

    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export VERSION=$(go run ./cmd/internal/read_tag)

    go build \
        -v \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -tags "$_tags" \
        -ldflags "
            -X \"github.com/sagernet/sing-box/constant.Version=$VERSION\"
            -s -w -buildid= 
            -linkmode=external" \
        ./cmd/sing-box

    sed -i "/^\[Service\]$/a StateDirectory=$_pkgname"    release/config/$_pkgname.service
    sed -i "/^\[Service\]$/a StateDirectory=$_pkgname-%i" release/config/$_pkgname@.service
    sed -i "/^\[Service\]$/a User=$_pkgname"              release/config/$_pkgname*.service

    echo 'u sing-box - "Sing-box Service" - -' > "release/config/$_pkgname.sysusers"
}

package() {
    cd "$_pkgname"

    install -Dm644 LICENSE                             -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm755 "$_pkgname"                         -t "$pkgdir/usr/bin"
    install -Dm644 "release/config/config.json"        -t "$pkgdir/etc/$_pkgname"
    install -Dm644 "release/config/$_pkgname.service"  -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$_pkgname@.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "release/config/$_pkgname.sysusers"    "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
}
