pkgname=ferronweb
pkgver=1.3.3
pkgrel=1
pkgdesc="Ferron web server"
arch=('x86_64' 'i686' 'armv7' 'aarch64' 'riscv64')
url="https://www.ferronweb.org"
license=('custom')
depends=('libcap')
makedepends=('unzip')
backup=('etc/ferron.yaml')
install=ferron.install
_sha256sums_x86_64='090546eea55aa5fac6e774391d3c4c31671a14abd73680184d41c70c2efee209'
_sha256sums_i686='6e0ced1bba8996927cc0ce1ef574b95370e0482e48bf5e1392a6d09fa5300cde'
_sha256sums_armv7='f90ae17a1a5756fdf5cf30c96c406440e67e35bc5d17427fcabf57ed3d8a1979'
_sha256sums_aarch64='0c7eab6cc09208fc560f59840ed0bc31e899eb45829ec58bb9d17c010dc70d93'
_sha256sums_riscv64='ee1193977fc9a1b072970f680b936277d6dbe66406a9be6c2fdc7a1aad948dc3'
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