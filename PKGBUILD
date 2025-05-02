pkgname=ferronweb
pkgver=1.1.2
pkgrel=1
pkgdesc="Ferron web server"
arch=('x86_64' 'i686' 'armv7' 'aarch64' 'riscv64')
url="https://www.ferronweb.org"
license=('custom')
depends=('libcap')
makedepends=('unzip')
backup=('etc/ferron.yaml')
install=ferron.install
case "$CARCH" in
    x86_64) _arch="x86_64" ;;
    i386 | i486 | i586 | i686) _arch="i686" ;;
    armv7h) _arch="armv7" ;;
    aarch64) _arch="aarch64" ;;
    riscv64) _arch="riscv64gc" ;;
    *) error "Unsupported architecture: $CARCH"; exit 1 ;;
esac
if [ "$_arch" = "armv7" ]; then
    abi="eabihf"
else
    abi=""
fi
source=("https://downloads.ferronweb.org/${pkgver}/ferron-${pkgver}-${_arch}-unknown-linux-gnu${abi}.zip")
sha256sums=('cab4173babb3e98ca9e3a42a7a15d062842428c06b709c4ef627bc68646f53d6')
provides=('ferron')

prepare() {
    cd "$srcdir"
    unzip -q "ferron-$pkgver-${_arch}-unknown-linux-gnu${abi}.zip"
}

package() {
    case "$CARCH" in
        x86_64) _arch="x86_64" ;;
        i686) _arch="i686" ;;
        armv7h) _arch="armv7" ;;
        aarch64) _arch="aarch64" ;;
        riscv64) _arch="riscv64" ;;
        *) error "Unsupported architecture: $CARCH"; exit 1 ;;
    esac
    cd "$srcdir"
    install -dm755 "$pkgdir/var/log/ferron"
    install -dm755 "$pkgdir/var/www/ferron"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/etc"
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    cp -r wwwroot/* "$pkgdir/var/www/ferron/"
    install -Dm755 ferron "$pkgdir/usr/bin/ferron"
    for binary in ferron-*; do
        if [[ -f "$binary" && "$binary" != *.zip ]]; then
                install -Dm755 "$binary" "$pkgdir/usr/bin/$binary"
        fi
    done
    cat > "$pkgdir/etc/ferron.yaml" << 'EOF'
global:
    wwwroot: /var/www/ferron
    logFilePath: /var/log/ferron/access.log
    errorLogFilePath: /var/log/ferron/error.log
EOF
    cat > "$pkgdir/usr/lib/systemd/system/ferron.service" << 'EOF'
[Unit]
Description=Ferron web server
After=network.target

[Service]
Type=simple
User=ferron
ExecStart=/usr/sbin/ferron -c /etc/ferron.yaml
ExecReload=kill -HUP $MAINPID
Restart=on-failure
AmbientCapabilities=CAP_NET_BIND_SERVICE

[Install]
WantedBy=multi-user.target
EOF
    install -Dm644 /dev/null "$pkgdir/usr/lib/tmpfiles.d/ferron.conf"
    cat > "$pkgdir/usr/lib/tmpfiles.d/ferron.conf" << 'EOF'
d /var/log/ferron 0755 ferron ferron -
EOF
    install -Dm644 /dev/null "$pkgdir/usr/lib/sysusers.d/ferron.conf"
    cat > "$pkgdir/usr/lib/sysusers.d/ferron.conf" << 'EOF'
u ferron - "Ferron web server" /nonexistent /usr/sbin/nologin
EOF
}