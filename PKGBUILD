# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgbase=zrok2
pkgname=(zrok2 zrok2-agent zrok2-controller zrok2-frontend zrok2-metrics-bridge)
pkgver=2.0.2
pkgrel=1
pkgdesc='zrok is a next-generation sharing platform, designed to make sharing network and file resources simple and secure.'
arch=('x86_64')
url='https://zrok.io'
license=('Apache-2.0')
depends=('glibc')
makedepends=('npm' 'go')

source=("$pkgbase-$pkgver.tar.gz::https://github.com/openziti/zrok/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6de76009bd724315346a2ae2ccde108416035ad256693c7d132919e1771ec495')

prepare() {
    cd "zrok-$pkgver"
    export GOPATH="$srcdir"

    for ui in ./ui ./agent/agentUi; do
        pushd "$ui"
        npm install --cache "$srcdir/npm-cache"
        popd
    done

    go mod download -modcacherw
}

build() {
    cd "zrok-$pkgver"
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

    go build -o ./build ./cmd/zrok2
}

package_zrok2() {
    cd "zrok-$pkgver"
    install -Dm755 ./build/zrok2 -t "$pkgdir/usr/bin"
}

package_zrok2-agent() {
    pkgdesc='This package provides zrok2-agent.service.'
    depends=('zrok2' 'bash')

    cd "zrok-$pkgver"
    install -Dm755 ./nfpm/zrok2-enable.bash "$pkgdir/usr/bin/zrok2-enable"
    install -Dm644 ./nfpm/zrok2-agent.service -t "$pkgdir/usr/lib/systemd/user"
    install -Dm644 ./etc/caddy/multiple_upstream.Caddyfile -t "$pkgdir/etc/zrok2"
}

package_zrok2-controller() {
    pkgdesc='This package provides zrok2-controller.service.'
    depends=('zrok2' 'bash')

    cd "zrok-$pkgver"
    install -Dm755 ./nfpm/zrok2-controller.bash -t "$pkgdir/usr/bin"
    install -Dm644 ./nfpm/zrok2-controller.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 ./etc/ctrl.yml "$pkgdir/etc/zrok2/ctrl.yml.example"
}

package_zrok2-frontend() {
    pkgdesc='This package provides zrok2-frontend.service.'
    depends=('zrok2' 'bash')

    cd "zrok-$pkgver"
    install -Dm755 ./nfpm/zrok2-frontend.bash -t "$pkgdir/usr/bin"
    install -Dm644 ./nfpm/zrok2-frontend.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 ./etc/frontend.yml "$pkgdir/etc/zrok2/frontend.yml.example"
}

package_zrok2-metrics-bridge() {
    pkgdesc='This package provides zrok2-metrics-bridge.service.'
    depends=('zrok2' 'zrok2-controller' 'bash')

    cd "zrok-$pkgver"
    install -Dm755 ./nfpm/zrok2-metrics-bridge.bash -t "$pkgdir/usr/bin"
    install -Dm644 ./nfpm/zrok2-metrics-bridge.service -t "$pkgdir/usr/lib/systemd/system"
}
