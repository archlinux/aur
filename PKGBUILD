pkgname=ferronweb
pkgver=1.3.1
pkgrel=1
pkgdesc="Ferron web server"
arch=('x86_64' 'i686' 'armv7' 'aarch64' 'riscv64')
url="https://www.ferronweb.org"
license=('custom')
depends=('libcap')
makedepends=('unzip')
backup=('etc/ferron.yaml')
install=ferron.install
_sha256sums_x86_64='c777cbb6122b9dac55e3ec3db1933a36f29b7e999054746d71b226dc048c748f'
_sha256sums_i686='4420935391cead7705bcfd92b31405c7123877ad475d279297e67d85e7df0dbb'
_sha256sums_armv7='4147dd21e46243bac0b739116b809e75627b6e89591266f1ad7dff23587e8ead'
_sha256sums_aarch64='af417c891558d6e36ed5ddb8d95a81abfc62d9971b2cfb9709b0c058344e0fcb'
_sha256sums_riscv64='d3b89c71df2851aa12aedd7df8c61d386b13bc75df771aab65f48a46cc31be5e'
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
if [ "$_arch" = "armv7" ]; then
    abi="eabihf"
else
    abi=""
fi
source=("https://downloads.ferronweb.org/${pkgver}/ferron-${pkgver}-${_arch}-unknown-linux-gnu${abi}.zip")
sha256sums=("$_checksum")
provides=('ferron')

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