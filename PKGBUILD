# Maintainer: Adam Levy <adam@canonical-ledgers.com>
pkgname=fatd
pkgver=1.0.0
pkgrel=1
pkgdesc="Factom Asset Tokens Daemon"
url="https://github.com/Factom-Asset-Tokens/fatd"
license=(MIT)

options=(emptydirs)

install=fatd.install

arch=('x86_64')
depends=("glibc")
optdepends=("factomd")
makedepends=("go-pie" "git")
source=("git+https://github.com/Factom-Asset-Tokens/fatd#tag=v${pkgver}")
md5sum=('skip')

prepare() {
    # Generate completion files. Each cmd is its own completion program.
    cd "$srcdir"
    mkdir -p completions
    rm -f completions/fatd
    for cmd in fatd fat-cli; do
        echo "complete -C /usr/bin/$cmd $cmd" >> completions/fatd
    done
}

build() {
    export LDFLAGS
    export CGO_LDFLAGS=$LDFLAGS
    cd "$srcdir/fatd"
    make
}

package() {
    install -Dm644 "$srcdir/completions/fatd" \
        "$pkgdir/usr/share/bash-completion/completions/fatd"

    cd "$srcdir/fatd"

    bin_dir="$pkgdir/usr/bin"
    install -dm755 "$bin_dir"
    install -m755 fatd fat-cli "$bin_dir"

    install -dm755 "$pkgdir/var/lib/fatd"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/fatd/LICENSE"

    install -Dm644 fatd@.service       "$pkgdir/usr/lib/systemd/system/fatd@.service"
    install -Dm644 sysusers-fatd.conf "$pkgdir/usr/lib/sysusers.d/fatd.conf"

}
md5sums=('SKIP')
