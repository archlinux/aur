# Maintainer: oditynet <oditynet@gmail.com>
pkgname=2fa-unix
pkgver=0.1
pkgrel=1
options=('!debug')
pkgdesc="2fa-unix util fot 2fa login at console ans GUI"
arch=('x86_64')
url="https://github.com/oditynet/2fa-unix"
license=('MIT license')
depends=('go' 'gcc')
makedepends=('go')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/oditynet/2fa-unix/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('47cc10dddedaf03daad7f787cb829da4b50d6ca8408806fb86f1b02a357dc7f1')

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
# Post-install сообщения пользователю
post_install() {
    cat << "EOF"

╔═══════════════════════════════════════════════════════════════╗
║                    CONFIG  2FA-UNIX                           ║
╚═══════════════════════════════════════════════════════════════╝
1. Start service:
   sudo systemctl enable --now aserver.service

2. Genarate your token for access:
  curl -X POST http://localhost:13031/api/v1/register \
  -H "Content-Type: application/json" \
  -d '{"username":"<user>","password":"<pass>"}'

3. Config a PAM:
   Add to  /etc/pam.d/system-auth new line:
   auth required pam_2fact.so username=<login> token=<token>
EOF
}

post_upgrade() {
    # При обновлении перезапускаем службу
    systemctl daemon-reload
    systemctl restart aserver.service
}

pre_remove() {
    # ПЕРЕД УДАЛЕНИЕМ: останавливаем и отключаем службу
    echo "Stopping and disabling 2fa-aserver service..."
    systemctl stop aserver.service
    systemctl disable aserver.service
}

post_remove() {
    # ПОСЛЕ УДАЛЕНИЯ: очистка
    echo "2fa-unix has been removed."
    echo "Don't forget to remove PAM configuration lines from /etc/pam.d/"
}