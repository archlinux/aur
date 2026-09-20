# Maintainer: Nelson Lee <skyli at skyli dot xyz>

pkgname=echowarp
pkgver=0.9.1
pkgrel=1
pkgdesc='Real-time network audio streaming between hosts'
arch=('x86_64')
url='https://github.com/lHumaNl/EchoWarp'
license=('MIT')
depends=('opus')
makedepends=('go' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lHumaNl/EchoWarp/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f5a3e0c0a8bd2b774fbc43d4980de127824cba880b2192e1dd7afde4faef4c59')

_commit=82e6f010a53cb6b4b91866bd245709694139fc56

prepare() {
    cd "EchoWarp-$pkgver"
    go mod download
}

build() {
    cd "EchoWarp-$pkgver"
    export CGO_ENABLED=1
    export GOFLAGS='-buildmode=pie -trimpath -mod=readonly'

    go build \
        -buildvcs=false \
        -tags nolibopusfile \
        -ldflags "-s -w -X github.com/lHumaNl/echowarp/internal/version.Version=$pkgver -X github.com/lHumaNl/echowarp/internal/version.Commit=$_commit" \
        -o echowarp \
        ./cmd/echowarp
}

package() {
    cd "EchoWarp-$pkgver"
    install -Dm755 echowarp "$pkgdir/usr/bin/echowarp"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
