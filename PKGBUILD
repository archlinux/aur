# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgbase=zrok
pkgname=(zrok zrok-agent zrok-share)
pkgver=1.1.10
pkgrel=2
pkgdesc="zrok is a next-generation sharing platform, designed to make sharing network and file resources simple and secure."
arch=('x86_64')
url='https://zrok.io'
license=('Apache-2.0')
depends=('glibc')
makedepends=('npm' 'go')

source=("$pkgbase-$pkgver.tar.gz::https://github.com/openziti/zrok/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1567de28d6e2c123f52069889fce8715263596b2eba9001b98f2a9f72d37ba53')

prepare() {
    cd "$pkgbase-$pkgver"
    export GOPATH="$srcdir"

    pushd ./nfpm
    for f in ./zrok-agent.service ./zrok-share.env ./zrok-share.service ./zrok-share@.service; do
        sed -i -e 's|/opt/openziti/etc|/etc|g' -e 's|/opt/openziti|/usr|g' "$f"
    done
    popd

    for ui in ./ui ./agent/agentUi; do
        pushd "$ui"
        npm install --cache "$srcdir/npm-cache"
        popd
    done

    go mod download -modcacherw
}

build() {
    cd "$pkgbase-$pkgver"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOPATH="$srcdir"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    for ui in ./ui ./agent/agentUi; do
        pushd "$ui"
        npm run build
        popd
    done

    go build -o ./build ./cmd/zrok
}

package_zrok() {
    cd "$pkgbase-$pkgver"
    install -Dm755 ./build/zrok -t "$pkgdir/usr/bin"
}

package_zrok-agent() {
    pkgdesc='This package provides zrok-agent.service.'
    depends=('zrok')

    cd "$pkgbase-$pkgver"
    install -Dm0644 ./nfpm/zrok-agent.service -t "$pkgdir/usr/lib/systemd/user"
}

package_zrok-share() {
    pkgdesc='This package provides zrok-share.service.'
    depends=('zrok')

    cd "$pkgbase-$pkgver"
    install -Dm755 ./nfpm/zrok-enable.bash -t "$pkgdir/usr/bin"
    install -Dm755 ./nfpm/zrok-share.bash -t "$pkgdir/usr/bin"

    install -Dm644 ./nfpm/zrok-share.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 ./nfpm/zrok-share@.service -t "$pkgdir/usr/lib/systemd/user"

    install -Dm0644 ./nfpm/zrok-share.env -t "$pkgdir/etc/zrok"
    install -Dm0644 ./etc/caddy/multiple_upstream.Caddyfile -t "$pkgdir/etc/zrok"
}
