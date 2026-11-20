pkgname=ferronweb
pkgver=2.8.1
pkgrel=1
pkgdesc="Ferron web server"
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv64')
url="https://ferron.sh"
license=('custom')
depends=('libcap' 'unzip')
backup=('etc/ferron.kdl')
install=ferron.install
_sha256sums_x86_64='3cf41cb1758c9fc653354a7fa5be2ca88a10a03a764cd82df67545216a3c5302'
_sha256sums_i686='f6143583f9b78c3e9fb75c09844fb87eca2f1173c91230f87ee63f950d3432d4'
_sha256sums_armv7='d704a2148eb3c6b4e340534b4de02a4ef396969474fe347a1d075daa62cb410d'
_sha256sums_aarch64='d4b5174146cbbd57a83f61b52dc2f969c5afbcaeb212531416ae7d5aa9769d07'
_sha256sums_riscv64='bc322aadb79b67c8b3a3ea0e10515aac6c5976c4e842b7451b9f5df2d96ea6e4'
case "$CARCH" in
    x86_64) 
        _arch="x86_64" 
        _checksum="$_sha256sums_x86_64"
        ;;
    i386 | i486 | i586 | i686) 
        _arch="i686" 
        _checksum="$_sha256sums_i686"
        ;;
    armv7h) 
        _arch="armv7" 
        _checksum="$_sha256sums_armv7"
        abi="eabihf"
        ;;
    aarch64) 
        _arch="aarch64" 
        _checksum="$_sha256sums_aarch64"
        ;;
    riscv64) 
        _arch="riscv64gc"
        _checksum="$_sha256sums_riscv64"
        ;;
    *) error "Unsupported architecture: $CARCH"; exit 1 ;;
esac
source=("https://dl.ferron.sh/${pkgver}/ferron-${pkgver}-${_arch}-unknown-linux-gnu${abi}.zip")
sha256sums=("$_checksum")
provides=('ferron')
conflicts=('ferron')

prepare() {
    cd "$srcdir"
    unzip -qo "ferron-$pkgver-${_arch}-unknown-linux-gnu${abi}.zip"
}

package() {
    case "$CARCH" in
        x86_64) _arch="x86_64" ;;
        i686) _arch="i686" ;;
        armv7h) _arch="armv7" ;;
        aarch64) _arch="aarch64" ;;
        riscv64) _arch="riscv64gc" ;;
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
    cat > "$pkgdir/etc/ferron.kdl" << 'EOF'
// Global-only configuration
* {
    default_http_port 80
    default_https_port #null
    auto_tls #false
    protocols h1 h2
    log "/var/log/ferron/access.log"
    error_log "/var/log/ferron/error.log"
}
// Global configuration
* {
    root "/var/www/ferron"
}
EOF
    cat > "$pkgdir/usr/lib/systemd/system/ferron.service" << 'EOF'
[Unit]
Description=Ferron web server
After=network.target

[Service]
Type=simple
User=ferron
ExecStart=/usr/sbin/ferron -c /etc/ferron.kdl
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
