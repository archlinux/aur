# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=adguardhome-git
_name=${pkgname%-git}
pkgver=0.108.0.b.82.r8.g4c1dcfe
pkgrel=1
pkgdesc='Network-wide ads and trackers blocking DNS server'
arch=(armv7h aarch64 pentium4 riscv64 x86_64)
url='https://github.com/AdguardTeam/AdGuardHome'
license=(GPL-3.0-only)
depends=(glibc)
makedepends=(git go nodejs npm)
provides=($_name)
conflicts=($_name)
source=("git+$url.git"
        "$_name.service"
        "$_name.sysusers")
b2sums=('SKIP'
        'b668bf969fddf94b28a5ece22f69dd5879b01ccac3ddf18dfebbcec94fefe6bfaeb43f74d11b575406a686a86587cab72ed9693d6f85f8f420ab16cafc975ab9'
        '39c0caacf9261d1be4668086701b4b207ec63f40f575dd322bdb37b1e6796ab89d7bbc56806867ddf11a0c71bcac5f62629518a3065cbcb2eea340ab8272abb4')

pkgver() {
    cd AdGuardHome
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd AdGuardHome
    npm --prefix client ci
    go mod download
}

build() {
    cd AdGuardHome
    npm --prefix client run build-prod

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    [[ $CARCH == "armv7h" ]] && export GOARCH=arm GOARM=7
    [[ $CARCH == "aarch64" ]] && export GOARCH=arm64
    [[ $CARCH == "pentium4" ]] && export GOARCH=386
    [[ $CARCH == "riscv64" ]] && export GOARCH=riscv64
    [[ $CARCH == "x86_64" ]] && export GOARCH=amd64

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-s -w -linkmode external -extldflags \"${LDFLAGS}\" -X 'github.com/AdguardTeam/AdGuardHome/internal/version.version=v$pkgver' -X 'github.com/AdguardTeam/AdGuardHome/internal/version.channel=development'" \
        -o $_name
}

package() {
    install -Dm755 AdGuardHome/$_name -t "$pkgdir/usr/bin"
    install -Dm644 AdGuardHome/CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 $_name.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -Dm644 $_name.sysusers "$pkgdir/usr/lib/sysusers.d/$_name.conf"
    install -d "$pkgdir/etc"
    ln -s /var/lib/$_name/AdGuardHome.yaml "$pkgdir/etc/$_name.yaml"
}
