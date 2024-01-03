# Maintainer: cubercsl <2014cais01 at gmail dot com>
pkgname=dae-beta
pkgver=0.5.0rc2
pkgrel=1
pkgdesc="A Linux lightweight and high-performance transparent proxy solution based on eBPF."
arch=(x86_64 aarch64)
url="https://github.com/daeuniverse/dae"
license=('AGPL')
makedepends=(clang go)
provides=('dae')
conflicts=('dae')
source=(
    "$_pkgname-$pkgver.zip::https://github.com/daeuniverse/dae/releases/download/v$pkgver/dae-full-src.zip"
)
sha256sums=('c3afea4bed1664a565f313fe9a47a72de7374023f70496c3f3a9eeccd304c37e')

build() {
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    export CFLAGS="-fno-stack-protector"
    cd "$srcdir"
    make VERSION="$pkgver"
}

package() {
    depends=(
        glibc
        v2ray-geoip
        v2ray-domain-list-community
    )
    backup=("etc/dae/config.dae")

    cd "$srcdir"
    install -Dm755 "dae" "$pkgdir/usr/bin/dae"
    install -Dm644 "install/dae.service" "$pkgdir/usr/lib/systemd/system/dae.service"
    install -Dm640 "install/empty.dae" "$pkgdir/etc/dae/config.dae"
    install -Dm644 "example.dae" "$pkgdir/etc/dae/config.dae.example"

    mkdir -p "$pkgdir/usr/share/dae"
    ln -vs /usr/share/v2ray/geoip.dat $pkgdir/usr/share/dae/geoip.dat
    ln -vs /usr/share/v2ray/geosite.dat $pkgdir/usr/share/dae/geosite.dat 
}
