# Packager: Adam Levy <adam@canonical-ledgers.com>
# Maintainer: Adam Levy <adam@canonical-ledgers.com>
pkgname=fatd-git
pkgver=1.0.0.r1.gce0a4cf
pkgrel=1
pkgdesc="Factom Asset Tokens Daemon (develop branch)"
url="https://github.com/Factom-Asset-Tokens/fatd"
license=(MIT)

provides=(fatd)
conflicts=(fatd)

options=(emptydirs)

install=fatd.install

arch=('x86_64')
depends=("glibc")
optdepends=("factomd")
makedepends=("go-pie" "git")
source=("git+https://github.com/Factom-Asset-Tokens/fatd#branch=develop")
md5sums=('SKIP')

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

pkgver() {
    cd "$srcdir/fatd"
    ./revision | sed 's/^v//'
}
