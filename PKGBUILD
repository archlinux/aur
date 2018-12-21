# Maintainer: max-k <max-kATpostDOTcom>
# Contributor: Rémi Audebert <rflah0+aurATgmailDOTcom>
# Contributor: Ben Reul <breul99ATgmailDOTcom>
# Contributor: Arthur D'Andréa Alemar

pkgname=prometheus
pkgver=2.6.0
pkgrel=1
pkgdesc="An open-source service monitoring system and time series database."
arch=('i686' 'x86_64')
url="http://$pkgname.io"
license=('APACHE')
depends=('glibc')
makedepends=('go' 'git')
backup=("etc/$pkgname/$pkgname.yml")
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz"
        "${pkgname}.service" "${pkgname}.sysusers" "${pkgname}.tmpfiles")
sha256sums=('e0d3e77e45466fd055726268354a02834968a3275791be6cbd17513ec7860c1d'
            'b6960a1eb44f13c059a61015a58426b3377c77d5ed763314d7f46253a0480598'
            '1ccc0cb5bcd94c5b6cafe795f7bdcc411c4bcc2ef8bd84a7683a604136c609e4'
            'c0367fb4748103352fba1321a30a70d8328169ab7eaf3bda7a6fb54d0cb08d0d')

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
    install -dm755 "$pkgdir"/usr/bin
    install -m755 "$srcdir"/"$pkgname"-"$pkgver"/"$pkgname" "$pkgdir"/usr/bin
    install -m755 "$srcdir"/"$pkgname"-"$pkgver"/promtool "$pkgdir"/usr/bin

    install -dm755 "$pkgdir"/etc/prometheus
    install -dm755 "$pkgdir"/etc/prometheus/{consoles,console_libraries}
    install -m644 "$srcdir"/"$pkgname"-"$pkgver"/documentation/examples/prometheus.yml "$pkgdir"/etc/prometheus

    install -dm755 "$pkgdir"/usr/lib/systemd/system
    install -dm755 "$pkgdir"/usr/lib/{sysusers.d,tmpfiles.d}
    install -m644 "$srcdir"/prometheus.service "$pkgdir"/usr/lib/systemd/system/prometheus.service
    install -m644 "$srcdir"/prometheus.sysusers "$pkgdir"/usr/lib/sysusers.d/prometheus.conf
    install -m644 "$srcdir"/prometheus.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/prometheus.conf

    install -dm755 "$pkgdir"/usr/share/doc/prometheus/examples
    cp -R "$srcdir"/"$pkgname"-"$pkgver"/{consoles,console_libraries} "$pkgdir"/usr/share/doc/prometheus/examples

    install -dm755 "$pkgdir"/usr/share/prometheus/web
    cp -R "$srcdir"/"$pkgname"-"$pkgver"/web/ui/{static,templates} "$pkgdir"/usr/share/prometheus/web
}
