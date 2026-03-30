# Maintainer: oditynet <oditynet@gmail.com>
pkgname=2fa-unix
pkgver=0.1
pkgrel=1
options=('!debug')
pkgdesc="2fa-unix util fot 2fa login at console ans GUI"
arch=('x86_64')
install="$pkgname.install"
url="https://github.com/oditynet/2fa-unix"
license=('MIT license')
depends=('go' 'gcc')
makedepends=('go')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/oditynet/2fa-unix/archive/refs/tags/$pkgver.tar.gz"
"$pkgname.install")
sha256sums=('47cc10dddedaf03daad7f787cb829da4b50d6ca8408806fb86f1b02a357dc7f1' 'f3d671772cc89bff18711e4f704700ccda50f4e1aeed76ebad9496e79e233ad0')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    gcc -fPIC -shared -o pam_2fact.so 2fact.c -lcurl -lpam
    go build -ldflags="-s -w"  -o aserver server.go
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Установка бинарников
    install -Dm755 aserver "$pkgdir/usr/bin/aserver"
    install -Dm755 pam_2fact.so "$pkgdir/usr/lib/security/pam_2fact.so"
    
    # systemd сервис
    install -Dm644 aserver.service "$pkgdir/usr/lib/systemd/system/aserver.service"
    
    # Конфиг
    install -dm755 "$pkgdir/etc/2fact"
    
    # Документация
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
}
