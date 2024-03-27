# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=clash-meta
pkgver=1.18.2
pkgrel=1
pkgdesc="Another Clash Kernel"
arch=(x86_64)
url="https://github.com/MetaCubeX/mihomo"
license=(GPL-3.0-or-later)
depends=(clash-geoip glibc)
makedepends=(go)
backup=('etc/clash-meta/config.yaml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/MetaCubeX/Meta-Docs/main/docs/example/yaml"
        "https://raw.githubusercontent.com/MetaCubeX/mihomo/Alpha/.github/mihomo.service")
        # Please remove the line once the upstream Meta branch contains mihomo.service file
sha256sums=('49855c53e5717932b9cb933e7f42f58155b52a42bf7db7f35f1fb1d4baa7ee00'
            '25a125934bf524b340ec0bfe9be258f41b3ee55b0b23555f1c83ea3a3e776c4f'
            '7d2f6de01adbb5dbe7e0d2a00582467faafdb08dce74dd32675cfd94dcbae014')

prepare(){
    cd "$srcdir"
    mv mihomo-$pkgver $pkgname
    mv yaml           $pkgname/config.yaml
    mv mihomo.service $pkgname/mihomo.service
}

build(){
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1
    cd "$srcdir/$pkgname"
    BUILDTIME=$(date -u)
    GOOS=linux go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" \
        -X \"github.com/metacubex/mihomo/constant.Version=${pkgver}\" \
        -X \"github.com/metacubex/mihomo/constant.BuildTime=${BUILDTIME}\" \
        " \
        -tags with_gvisor -o $pkgname-$pkgver
    
    echo "u $_pkgname - \"Clash-Meta Service\" - -"        >  "$_pkgname.sysusers"
    echo "d /etc/$_pkgname     0755 $_pkgname $_pkgname -" >  "$_pkgname.tmpfiles"
    echo "d /var/log/$_pkgname 0700 $_pkgname $_pkgname -" >> "$_pkgname.tmpfiles"
    sed -i -e '/Description/s/mihomo/Clash-Meta/' \
           -e "s/mihomo/$_pkgname/g"              \
           -e "/^Type=simple/a User=$_pkgname"    \
           -e "/^Type=simple/a Group=$_pkgname"   mihomo.service
}

check() {
    cd "$srcdir/$pkgname"
    go test ./...
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname-$pkgver"      "$pkgdir/usr/bin/clash-meta"
    install -Dm644 "$_pkgname.sysusers"    "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "$_pkgname.tmpfiles"    "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
    install -Dm644 config.yaml             "$pkgdir/etc/clash-meta/config.yaml"
    install -Dm644 mihomo.service          "$pkgdir/usr/lib/systemd/system/clash-meta.service"
    ln -s          /etc/clash/Country.mmdb "$pkgdir/etc/$_pkgname/Country.mmdb"
}
