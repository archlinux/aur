# Maintainer: Aria Arctic <aria@zeusteam.dev>
# Contributor: Rowan <rowan@zeusteam.dev>
pkgname=ferronweb
pkgver=2.8.1
pkgrel=2
pkgdesc='A fast, modern web server written in Rust (prebuilt binaries)'
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv64')
url='https://ferron.sh'
license=('MIT')
depends=('gcc-libs' 'glibc' 'ca-certificates')
provides=("ferron=$pkgver")
conflicts=('ferron' 'ferron-git' 'ferron-rc' 'ferron-bin' 'ferronweb-bin' 'ferronweb-git')
install=ferron.install
options=('!strip')

# upstream names riscv64 riscv64gc and armv7 armv7 with an eabihf suffix
case "$CARCH" in
    x86_64) _arch='x86_64' ; _abi='' ;;
    i686) _arch='i686' ; _abi='' ;;
    armv7h) _arch='armv7' ; _abi='eabihf' ;;
    aarch64) _arch='aarch64' ; _abi='' ;;
    riscv64) _arch='riscv64gc' ; _abi='' ;;
    *) error "Unsupported architecture: $CARCH"; exit 1 ;;
esac
_archive="ferron-$pkgver-$_arch-unknown-linux-gnu${_abi}.zip"
# pin the license to the tagged commit rather than the tag, so a re-pointed tag
# cannot change what the package installs
_commit=8ac3f138f1a37c2c18bb74338d718e06946dcb83
source=("$_archive::https://dl.ferron.sh/$pkgver/$_archive"
        "LICENSE::https://raw.githubusercontent.com/ferronweb/ferron/$_commit/LICENSE")
sha256sums_x86_64=('3cf41cb1758c9fc653354a7fa5be2ca88a10a03a764cd82df67545216a3c5302')
sha256sums_i686=('f6143583f9b78c3e9fb75c09844fb87eca2f1173c91230f87ee63f950d3432d4')
sha256sums_armv7=('d704a2148eb3c6b4e340534b4de02a4ef396969474fe347a1d075daa62cb410d')
sha256sums_aarch64=('d4b5174146cbbd57a83f61b52dc2f969c5afbcaeb212531416ae7d5aa9769d07')
sha256sums_riscv64=('a29e9cb38b4d5245dcecdd64cd035c50f9ef7b96efb617eab2d3caa2ee9804e0')
sha256sums_LICENSE=('c1db5c351e357ea68362c01faff8dc046c59e1d7466317f64482c2a6d3e6a695')

check() {
    cd "$srcdir"
    # 2.x has no validate subcommand, so check the binary reports the tag
    local version
    version=$(./ferron --version)
    printf '%s\n' "${version%%$'\n'*}" | grep -xF "Ferron $pkgver"
}

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/var/log/ferron"
    install -dm755 "$pkgdir/var/www/ferron"
    install -dm755 "$pkgdir/etc"
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -dm755 "$pkgdir/usr/lib/tmpfiles.d"
    install -dm755 "$pkgdir/usr/lib/sysusers.d"
    install -dm755 "$pkgdir/usr/share/ferron"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -Dm755 ferron "$pkgdir/usr/bin/ferron"
    # the release zip is expected to carry these; fail rather than ship a partial package
    for binary in ferron-passwd ferron-yaml2kdl ferron-precompress; do
        if [ ! -f "$binary" ]; then
            echo "ERROR: $binary missing from $(
                basename "$_archive")"
            exit 1
        fi
        install -Dm755 "$binary" "$pkgdir/usr/bin/$binary"
    done
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -r wwwroot "$pkgdir/usr/share/ferron/wwwroot"
    # seeded into /etc by the install script, so an upgrade can tell a stock
    # config from one the user has edited
    cat > "$pkgdir/usr/share/ferron/ferron.kdl.default" << 'EOF'
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
ExecStart=/usr/bin/ferron -c /etc/ferron.kdl
ExecReload=kill -HUP $MAINPID
Restart=on-failure
AmbientCapabilities=CAP_NET_BIND_SERVICE

[Install]
WantedBy=multi-user.target
EOF
    cat > "$pkgdir/usr/lib/tmpfiles.d/ferron.conf" << 'EOF'
d /var/log/ferron 0755 ferron ferron -
EOF
    cat > "$pkgdir/usr/lib/sysusers.d/ferron.conf" << 'EOF'
u ferron - "Ferron web server" /var/lib/ferron
EOF
}