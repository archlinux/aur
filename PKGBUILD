# Maintainer: Celeste <celdaemon at voidgroup dot net>
pkgname=fabricmc-cli-git
pkgver=r206.cc276f1c
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
    'fabricmc::git+https://github.com/FabricMC/fabricmc.net.git'
    'no-upgrade.patch'
)
sha256sums=(
    'SKIP'
    'ba97033b90e7fe01775c3edcc69de438a6a97fe400467f18f4a0463b9dfb47a7'
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
