# Author: Kyle Manna <kyle at kylemanna dot com>

pkgname=(terrad)
#pkgname=(terrad terra-genesis)
_pkgname=core
pkgver=0.5.14
pkgrel=1
pkgdesc='GO implementation of the Terra Protocol'
url='https://github.com/terra-money/core'
arch=('x86_64')
makedepends=('go')
depends=()
#optdepends_terrad=('terra-genesis')

license=('Apache')
# File is too massive to permanently be installed in to the the filesystem
# "mainnet-genesis.json::https://cloudflare-ipfs.com/ipfs/QmZAMcdu85Qr8saFuNpL9VaxVqqLGWNAs72RVFhchL9jWs"
source=("https://github.com/terra-money/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "terrad.service")

sha512sums=('32a2f90edef0fd31a2b10363ad05df29d0740646a2f2e52dd403d0ec6723457b004e8436ecc00cd0ef466526199a7a2e6e98bf2357cf8928beab370bd9c10683'
            '4130c54f4fa88fa08379461c6e4255a8ac47910181b89cb3f666d8b4c9ef4ab70a344eb3c5a908d0b7cf41201d31546d990f346096ee508c9ae30a96e84f5de2')


BUILD_FLAGS=('-tags' 'netgo ledger' 
             '-ldflags' "-X github.com/cosmos/cosmos-sdk/version.Name=terra -X github.com/cosmos/cosmos-sdk/version.AppName=terrad -X github.com/cosmos/cosmos-sdk/version.Version=$pkgver -X github.com/cosmos/cosmos-sdk/version.Commit=0a7dd0236095d3578d97ee55301853b71dae34e5 -X 'github.com/cosmos/cosmos-sdk/version.BuildTags=netgo ledger' -w -s"
             '-trimpath')

build() {
    cd "$_pkgname-$pkgver"
    go build -mod=readonly "${BUILD_FLAGS[@]}" -o build/terrad ./cmd/terrad
}

package_terrad() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver/build/terrad" "$pkgdir/usr/bin/terrad"
    install -Dm644 "$srcdir/terrad.service" "$pkgdir/usr/lib/systemd/system/terrad.service"
}

#package_terra-genesis() {
#    install -Dm644 "$srcdir/mainnet-genesis.json" "$pkgdir/usr/share/terrad/mainnet-genesis.json"
#}
