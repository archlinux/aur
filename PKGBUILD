# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>

pkgname=dero
pkgver=2.1.5
_gituser=deroproject
_gitrepo=derosuite
_gitver=v2.1.5
pkgrel=1
pkgdesc='Dero: cryptonote currency daemon and wallet'
arch=( 'x86_64' )
url="https://github.com/$_gituser/$_gitrepo"
license=( 'custom:Research' )
makedepends=( 'go' )
depends=( 'glibc' )
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_gitver.tar.gz")
md5sums=('21c3c5961de71e2901bf85d77db4c768')

prepare() {
    # set source folder name:
    if [ ! -d "$srcdir/$pkgname-$pkgver" ]; then
        if [ -d "$srcdir/$_gitrepo-$_gitver" ]; then
            mv "$srcdir/$_gitrepo-$_gitver" "$srcdir/$pkgname-$pkgver"
        elif [ -d "$srcdir/$_gitrepo-$pkgver" ]; then
            mv "$srcdir/$_gitrepo-$pkgver" "$srcdir/$pkgname-$pkgver"
        elif [ -d "$srcdir/$pkgname-$_gitver" ]; then
            mv "$srcdir/$pkgname-$_gitver" "$srcdir/$pkgname-$pkgver"
        fi
    fi
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
    export GOPATH="$HOME/go"
    export GOBIN="$GOPATH/bin"
    export DEROSUITE="$GOPATH/src/github.com/deroproject/derosuite"
    mkdir -p "$GOBIN"
    mkdir -p "$GOPATH/src/github.com/deroproject/"
    mv "$srcdir/$pkgname-$pkgver" "$DEROSUITE"
    cd "$DEROSUITE/cmd"
    cd derod
    printf "\e[1;34m  ->\e[1;37m go build derod..."
    printf "\e[0;38;5;15m\n"
	go build -v
    cd ../dero-wallet-cli
    printf "\e[1;34m  ->\e[1;37m go build dero-wallet-cli..."
    printf "\e[0;38;5;15m\n"
    go build -v
    cd ../explorer
    printf "\e[1;34m  ->\e[1;37m go build dero-explorer..."
    printf "\e[0;38;5;15m\n"
    go build -v
}

package() {
	cd "$DEROSUITE"
    install -Dm755 "cmd/derod/derod" \
		"$pkgdir/usr/bin/derod"
    install -Dm755 "cmd/dero-wallet-cli/dero-wallet-cli" \
		"$pkgdir/usr/bin/dero-wallet-cli"
    install -Dm755 "cmd/explorer/explorer" \
		"$pkgdir/usr/bin/dero-explorer"
    install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
