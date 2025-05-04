pkgname=ferronweb
pkgver=1.2.0
pkgrel=1
pkgdesc="Ferron web server"
arch=('x86_64' 'i686' 'armv7' 'aarch64' 'riscv64')
url="https://www.ferronweb.org"
license=('custom')
depends=('libcap')
makedepends=('unzip')
backup=('etc/ferron.yaml')
install=ferron.install
_sha256sums_x86_64='186d5d3410d6a51023dc983a28407ac81f8699561e06a39e6ae9ac0f65caf69c'
_sha256sums_i686='9966c9822060ad3ee7399b18256b3147e182fd1b7ae2b17daef18a42fb25fb7c'
_sha256sums_armv7='125cb99107cb86d87df6cead01c35118e386f0b42ea15e0f9d68127834787f62'
_sha256sums_aarch64='cec568a5de3d272a0b5eb118b9d376a5dfc8292b251e4b21348fc0f4a81466cc'
_sha256sums_riscv64='80bdda596f49d09aa0754203ae5c068a875a96094533f7b8f136ff04a7de847b'
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