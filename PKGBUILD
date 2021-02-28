# Maintainer: Benoît Allard <benoit.allard@gnx.de>
pkgname=pwngrid
pkgver=1.10.3
pkgrel=1
pkgdesc="This is the source code of the API server for http://pwnagotchi.ai"
arch=('x86_64')
url="https://github.com/evilsocket/pwngrid"
license=('GPL3')
depends=('libpcap')
source=("$pkgname-$pkgver.tar.gz::https://github.com/evilsocket/${pkgname}/archive/v$pkgver.tar.gz")
md5sums=('250eccce3cfe5745fe1d4aac7e75bb5b')

prepare(){
    cd $pkgname-$pkgver
    mkdir -p build/
}

build() {
    cd $pkgname-$pkgver
    export CGO_CPPFLAGS="${CPPFLAGS}"    
    export CGO_CFLAGS="${CFLAGS}"    
    export CGO_CXXFLAGS="${CXXFLAGS}"    
    export CGO_LDFLAGS="${LDFLAGS}"    
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"    
    go build -o build/$pkgname cmd/pwngrid/*.go
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 pwngrid.service "$pkgdir"/usr/lib/systemd/system/pwngrid.service
    install -Dm644 env.example "$pkgdir"/etc/pwngrid/pwngrid.conf
}
