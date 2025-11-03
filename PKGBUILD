# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=zrok
pkgver=1.1.10
pkgrel=1
pkgdesc="Secure internet sharing made simple."
arch=('x86_64')
url='https://zrok.io'
license=('Apache-2.0')
depends=('glibc')
makedepends=('npm' 'go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/openziti/zrok/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1567de28d6e2c123f52069889fce8715263596b2eba9001b98f2a9f72d37ba53')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"

    for ui in ./ui ./agent/agentUi; do
        pushd "$ui"
        npm install --cache "$srcdir/npm-cache"
        popd
    done

    go mod download -modcacherw
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    for ui in ./ui ./agent/agentUi; do
        pushd "$ui"
        npm run build
        popd
    done

    go build -o ./build ./cmd/zrok
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 ./build/zrok -t "$pkgdir/usr/bin"
    install -Dm0644 ./nfpm/zrok-agent.service -t "$pkgdir/usr/lib/systemd/user"
}
