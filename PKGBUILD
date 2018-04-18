# Maintainer: max-k <max-kATpostDOTcom>
# Contributor: Ben Reul <breul99<NOSPAM>gmail.com>
# Contributor: Arthur D'Andréa Alemar

pkgname=prometheus
pkgver=2.2.1
pkgrel=3
pkgdesc="An open-source service monitoring system and time series database."
arch=('i686' 'x86_64')
url="http://$pkgname.io"
license=('APACHE')
depends=('glibc')
makedepends=('go' 'git')
backup=("etc/$pkgname/$pkgname.yml")
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz"
        "${pkgname}.service" "${pkgname}.sysusers")
sha256sums=('4f75427449bb72d1886f6cd46f752fe6300242da48b8bb870dbbd7ffc879ed92'
            'c38a5ea7b0fbab32d391102a915b73bad98eabf7e18dab3c4c3945f46951c203'
            '1ccc0cb5bcd94c5b6cafe795f7bdcc411c4bcc2ef8bd84a7683a604136c609e4')

prepare() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    export GOPATH="$srcdir/gopath"
    mkdir -p "$GOPATH/src/github.com/$pkgname"
    rm -f "$GOPATH/src/github.com/$pkgname/$pkgname"
    ln -sr "$srcdir/$pkgname-$pkgver" "$GOPATH/src/github.com/$pkgname/$pkgname"
}

build() {
    export GOPATH="$srcdir/gopath"
    export GOBIN="$GOPATH/bin"
    cd "$GOPATH/src/github.com/$pkgname/$pkgname" || exit 1
    make build

}
check() {
    read -ra mount_infos <<<"$(findmnt -n -o SOURCE,TARGET --target /tmp)"
    if grep "^${mount_infos[0]}\\s${mount_infos[1]}\\s.*noexec" /proc/mounts >/dev/null 2>&1; then
        echo "Tests are skipped because /tmp is mounted with noexec option."
    elif ss -lnt | awk '{print $4}' | grep 9090 >/dev/null 2>&1; then
        echo "Tests are skipped because TCP port 9090 is already in use."
    else
        export GOPATH="$srcdir/gopath"
        export GOBIN="$GOPATH/bin"
        cd "$GOPATH/src/github.com/$pkgname/$pkgname" || exit 1
        make test
    fi
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname-$pkgver/promtool" "$pkgdir/usr/bin"

    install -dm755 "$pkgdir/etc/prometheus"
    install -m644 "$srcdir/$pkgname-$pkgver/documentation/examples/prometheus.yml" "$pkgdir/etc/prometheus"
    install -dm755 "$pkgdir/etc/prometheus"
    install -dm755 "$pkgdir/etc/prometheus/console_libraries"
    install -dm755 "$pkgdir/etc/prometheus/consoles"

    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -m644 "$srcdir/prometheus.service" "$pkgdir/usr/lib/systemd/system/prometheus.service"

    install -dm755 "$pkgdir/usr/share/doc/prometheus/examples"
    cp -R "$srcdir/$pkgname-$pkgver/consoles" "$pkgdir/usr/share/doc/prometheus/examples"
    cp -R "$srcdir/$pkgname-$pkgver/console_libraries" "$pkgdir/usr/share/doc/prometheus/examples"

    install -dm755 "$pkgdir/usr/share/prometheus/web"
}
