# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=adguardhome-git
_name=${pkgname%-git}
_upstream_name=AdGuardHome
pkgver=0.108.0.b.76.r9.g2fde53b
pkgrel=1
pkgdesc='Network-wide ads and trackers blocking DNS server'
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/AdguardTeam/AdGuardHome'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('git' 'go' 'nodejs' 'npm')
provides=("$_name")
conflicts=("$_name")
source=("$_name-$pkgver::git+$url"
        "$_name.service")
b2sums=('SKIP'
        '161152f91e09fe491db631eb6ed603c0c975453b682467945fdade6091bf427ec932230f3a10e40e2f054dc01567930ecc27343c04882fb0e736b4f6becc96da')

pkgver() {
    cd $_name-$pkgver
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $_name-$pkgver
    npm --prefix client ci
    go mod download
}

build() {
    cd $_name-$pkgver
    npm --prefix client run build-prod

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    [[ $CARCH == "armv7h" ]] && export GOARCH=arm GOARM=7
    [[ $CARCH == "aarch64" ]] && export GOARCH=arm64
    [[ $CARCH == "i686" ]] && export GOARCH=386
    [[ $CARCH == "x86_64" ]] && export GOARCH=amd64

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X 'github.com/AdguardTeam/AdGuardHome/internal/version.version=v$pkgver' -X 'github.com/AdguardTeam/AdGuardHome/internal/version.channel=release'" \
        -o $_name
}

package() {
    install -Dm755 $_name-$pkgver/$_name "$pkgdir/usr/bin/$_name"
    install -Dm644 $_name.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -dm755 "$pkgdir/etc"
    ln -s /var/lib/$_name/$_upstream_name.yaml "$pkgdir/etc/$_name.yaml"
}
