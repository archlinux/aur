# Maintainer: Adam Levy <adam@canonical-ledgers.com>
pkgname=fatd-git
_pkgname=${pkgname%-git}
pkgver=v0.4.2.r35.g10782a8
pkgrel=1
pkgdesc="Factom Asset Tokens Daemon (develop git branch)"
url="https://github.com/Factom-Asset-Tokens/fatd"
license=('MIT')

provides=("$_pkgname")
conflicts=("$_pkgname")

arch=('x86_64')
depends=("glibc")
makedepends=("go-pie" "go-tools" "git" "sqlite")
source=("git+https://github.com/Factom-Asset-Tokens/fatd#branch=develop")
md5sums=('SKIP')

prepare() {
    # Generate completion files. Each cmd is its own completion program.
    cd "$srcdir"
    mkdir -p completions
    for cmd in fatd fat-cli; do
        echo "complete -C /usr/bin/$cmd $cmd" > completions/$cmd
    done
}

build() {
    #export GOPROXY="http://localhost:3000"
    export LDFLAGS
    export CGO_LDFLAGS=$LDFLAGS
    cd "$srcdir/$_pkgname"
    make clean
    make
}

package() {
    cd "$srcdir/"
    completions_dir="$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$completions_dir"
    cd ./completions
    install -m644 fatd fat-cli "$completions_dir"

    cd "$srcdir/$_pkgname"
    bin_dir="$pkgdir/usr/bin"
    install -dm755 "$bin_dir"
    install -m755 fatd fat-cli "$bin_dir"

    license_dir="$pkgdir/usr/share/licenses/$pkgname"
    install -dm755 "$license_dir"
    install -m644 LICENSE "$license_dir"
}

pkgver() {
    cd "$srcdir/$_pkgname"
    ./revision
}
