pkgname=ferronweb
pkgver=1.3.0
pkgrel=1
pkgdesc="Ferron web server"
arch=('x86_64' 'i686' 'armv7' 'aarch64' 'riscv64')
url="https://www.ferronweb.org"
license=('custom')
depends=('libcap')
makedepends=('unzip')
backup=('etc/ferron.yaml')
install=ferron.install
_sha256sums_x86_64='399c6439cb9834b25d1e78cc9699423616513b13422c95931489199280c5c221'
_sha256sums_i686='4e388bf92fa890b4eeedebf07537e471fe27ff0a3208a0ed54acd989692f7662'
_sha256sums_armv7='9bacdc7f0f900e6f2f5552ff8a0964881bb4f3c90b5b9bd30e0ab82100a493ff'
_sha256sums_aarch64='f40c87e14f0dcdb3be4f19b2b03b67c9ec6d3b3b16f19de3e23a2f9c1528bd7e'
_sha256sums_riscv64='f74617c6573efabe907965c6f09f1996b5b48df2021c010346462dd0f0fe2a45'
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