# Maintainer: katcote <s@katcote.com>
pkgbase=mesee-git
_pkgname=mesee
pkgname=('mesee-x11-git' 'mesee-wayland-git')
pkgver=0.1.0.r0.geec16f5
pkgrel=2
pkgdesc="Modular screen-capture daemon and OCR translator client"
arch=('x86_64')
url="https://github.com/MatieBaal/mesee"
license=('MIT')

makedepends=('gcc' 'make' 'go' 'git' 'wayland' 'libx11' 'tesseract')
source=("git+$url.git#tag=v0.1.0")
sha256sums=('SKIP')
options=('!debug')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    
    make all

    cd client
    go build -o ../build/mesee-client ./cmd/app/main.go
}

package_mesee-x11-git() {
    pkgdesc="Modular screen-capture daemon and OCR translator client (X11 Backend)"
    depends=('glibc' 'tesseract' 'libx11')
    provides=('mesee-git' 'mesee-backend')
    conflicts=('mesee-git' 'mesee-backend')

    cd "$_pkgname"

    install -Dm755 build/mesee_daemon "$pkgdir/usr/bin/mesee-daemon"
    install -Dm755 build/mesee-client "$pkgdir/usr/bin/mesee-client"
    install -Dm755 build/libmesee_backend_x11.so "$pkgdir/usr/lib/mesee/libmesee_backend_x11.so"
    install -Dm644 daemon/backend/mesee_backend.h "$pkgdir/usr/include/mesee/mesee_backend.h"

    # Создаем главный запускаемый скрипт /usr/bin/mesee
    install -d "$pkgdir/usr/bin"
    cat << 'EOF' > "$pkgdir/usr/bin/mesee"
#!/bin/sh
cd /usr/lib/mesee || exit 1

/usr/bin/mesee-daemon &
DAEMON_PID=$!

trap 'kill $DAEMON_PID 2>/dev/null' EXIT INT TERM

/usr/bin/mesee-client "$@"
EOF
    chmod +x "$pkgdir/usr/bin/mesee"

    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}

package_mesee-wayland-git() {
    pkgdesc="Modular screen-capture daemon and OCR translator client (Wayland Backend)"
    depends=('glibc' 'tesseract' 'wayland' 'libx11')
    provides=('mesee-git' 'mesee-backend')
    conflicts=('mesee-git' 'mesee-backend')

    cd "$_pkgname"

    install -Dm755 build/mesee_daemon "$pkgdir/usr/bin/mesee-daemon"
    install -Dm755 build/mesee-client "$pkgdir/usr/bin/mesee-client"
    install -Dm755 build/libmesee_backend_wayland.so "$pkgdir/usr/lib/mesee/libmesee_backend_wayland.so"
    install -Dm644 daemon/backend/mesee_backend.h "$pkgdir/usr/include/mesee/mesee_backend.h"

    # Создаем главный запускаемый скрипт /usr/bin/mesee
    install -d "$pkgdir/usr/bin"
    cat << 'EOF' > "$pkgdir/usr/bin/mesee"
#!/bin/sh
cd /usr/lib/mesee || exit 1

/usr/bin/mesee-daemon &
DAEMON_PID=$!

trap 'kill $DAEMON_PID 2>/dev/null' EXIT INT TERM

/usr/bin/mesee-client "$@"
EOF
    chmod +x "$pkgdir/usr/bin/mesee"

    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
