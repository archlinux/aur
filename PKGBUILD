# Maintainer: Celeste <celdaemon at voidgroup dot net>
pkgname=fabricmc-cli-git
pkgver=r208.f56ecc4
pkgrel=1
pkgdesc="Fabric modding CLI utility"
arch=('any')
url="https://github.com/FabricMC/fabricmc.net/tree/main/cli"
license=('MIT')
depends=('deno')
makedepends=('git' 'npm')
provides=("fabricmc-cli=$pkgver")
conflicts=('fabricmc-cli')
source=(
    'fabricmc::git+https://github.com/CelDaemon/fabricmc.net.git'
    'no-upgrade.patch'
)
sha256sums=(
    'SKIP'
    'f6b7bbe83143362422439d7f669b365ce5e36e011423c544191bea4fdb39e9d3'
)

pkgver() {
	cd "$srcdir/fabricmc"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/fabricmc"
    git apply "$srcdir/no-upgrade.patch"
    cd "$srcdir/fabricmc/scripts"
    npm i
}

build() {
    cd "$srcdir/fabricmc/scripts"
    npm run buildLib
    cd "$srcdir/fabricmc/cli"
    make build
}

package() {
    cd "$srcdir/fabricmc/cli"
    install -Dm755 bundled.ts "$pkgdir/usr/bin/fabric"
    cd "$srcdir/fabricmc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
