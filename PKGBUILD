# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>

pkgname=dero
pkgver=2.1.6
pkgrel=1
_gitrepo=derosuite
_gituser=deroproject
_gitver=v2.1.6-1
pkgdesc='Dero: cryptonote currency daemon and wallet'
arch=('x86_64')
url="https://github.com/$_gituser/$_gitrepo"
license=('custom:Research')
makedepends=('go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_gitver.tar.gz")
md5sums=('4250f4673704d3417c8deef73373f410')

prepare() {
    mv derosuite-2.1.6-1 "$pkgname-$pkgver"
}

build() {
    export GOPATH="$HOME/go"
    export GOBIN="$GOPATH/bin"
    export DEROSUITE="$GOPATH/src/github.com/deroproject/derosuite"
    mkdir -p "$GOBIN"
    mkdir -p "$GOPATH/src/github.com/deroproject/"
    mv "$pkgname-$pkgver" "$DEROSUITE"
    cd "$DEROSUITE/cmd/derod"
    printf "\e[1;34m  ->\e[1;37m go build derod...\e[0;37m\n"
	go build -v
    cd ../dero-wallet-cli
    printf "\e[1;34m  ->\e[1;37m go build dero-wallet-cli...\e[0;37m\n"
    go build -v
    cd ../explorer
    printf "\e[1;34m  ->\e[1;37m go build dero-explorer...\e[0;37m\n"
    go build -v
}

package() {
	cd "$DEROSUITE"
    install -Dm755 ./cmd/derod/derod "$pkgdir/usr/bin/derod"
    install -Dm755 ./cmd/dero-wallet-cli/dero-wallet-cli \
		"$pkgdir/usr/bin/dero-wallet-cli"
    install -Dm755 ./cmd/explorer/explorer \
        "$pkgdir/usr/bin/dero-explorer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
