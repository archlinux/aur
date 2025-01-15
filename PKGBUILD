# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=dendrite
pkgname=$_pkgname-libvips
pkgver=0.14.0
pkgrel=1
pkgdesc="A second-generation Matrix homeserver written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/element-hq/$_pkgname"
license=('AGPL-3.0-or-later')
depends=('libvips')
makedepends=('git' 'go')
optdepends=('postgresql: recommended database for large instances')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/element-hq/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "$_pkgname.sysusers"
        "$_pkgname.tmpfiles"
        "$_pkgname.service")
b2sums=('52360f62e24293579c398702211e15ef33b3806d91c2a929fea5f2879191b7d9764a83414792c348c9a32725c5006eb5cf2810e25fb5c82386a1d5f7023a55ab'
        'bd0cf2ee02603340cb0066a6786896ee5dec048e665516ad4e66913969175876e480470503093dff274377cabf7d9fe5fbe70ded605c9e6d05531a6298a634bc'
        'b35856b8d5a289f5333b0a20658b602da588676cbbc12f543044b014d8b9a244053763bae39acf7ec54387eb738cd518e460996fc687787592c63fd2d7bbd69b'
        'c129643657e2f8d97235e7eff48d33925439b8e07cd8631410fbc84082bf0e0131e7a5d64675d9d0f450e0c79bf48055a8fef2420256d85187ebee2d998c2481')
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
