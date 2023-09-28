# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=dendrite
pkgname=$_pkgname-libvips
pkgver=0.13.3
pkgrel=1
pkgdesc="A second-generation Matrix homeserver written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/matrix-org/$_pkgname"
license=('Apache')
depends=('libvips')
makedepends=('go')
optdepends=('postgresql: recommended database for large instances')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/matrix-org/$_pkgname/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz"
        "$_pkgname.sysusers"
        "$_pkgname.tmpfiles"
        "$_pkgname.service")
sha256sums=('8840730ede16cc7e150344f5cdaa5f78d6abaa8aa3c588ec39c20d735bcf5dd7'
            'aba328d7a7244e82f866f9d0ead0a53e79e1590b9c449ad6d18ff2659cb5e035'
            '620b634419e94cb09423d39ecd7edf859bf458e9d72c35be30610b37acc1e8bf'
            '7d33160209ed11f0ed6de84b0891becf175887a679eb5a3e01b672884fdf0c1d')
install="$_pkgname.install"

build() {
    cd "$_pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    install -d bin
    go build -ldflags='-s -w -linkmode=external' -tags bimg -o bin/ ./cmd/...
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm 644 "$_pkgname-sample.yaml" "$pkgdir/etc/$_pkgname/config-example.yaml"
    install -Dm 644 "$srcdir/$_pkgname.service"      "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm 644 "$srcdir/$_pkgname.sysusers"     "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm 644 "$srcdir/$_pkgname.tmpfiles"     "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
    cd bin/
    for bin in *; do
        if [[ "$bin" =~ ^$_pkgname-* ]]; then
            install -Dm 755 "$bin" "$pkgdir/usr/bin/$bin"
        else
            install -Dm 755 "$bin" "$pkgdir/usr/bin/$_pkgname-$bin"
        fi
    done
}
