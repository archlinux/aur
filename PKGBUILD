# Maintainer: Aria Arctic <aria@zeusteam.dev>
# Contributor: Rowan <rowan@zeusteam.dev>
pkgname=ferron
pkgver=2.8.1
pkgrel=4
pkgdesc='A fast, modern web server written in Rust'
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv64')
url='https://ferron.sh'
license=('MIT')
depends=('gcc-libs' 'glibc' 'ca-certificates')
makedepends=('cargo' 'git')
conflicts=('ferron-git' 'ferron-rc' 'ferronweb' 'ferron-bin' 'ferronweb-bin' 'ferronweb-git')
install=ferron.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/ferronweb/ferron/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('32354ffed4fbe8caede924d420e6a7ac84127f264c47e1e738b462d9479c0680')

build() {
    cd "$srcdir/ferron-$pkgver"
    export CARGO_TARGET_DIR="$srcdir/target"
    # makepkg's -flto=auto breaks the static mimalloc the 2.x crates link
    # against, with undefined mi_malloc_aligned and friends. Drop LTO from the
    # flags and keep the hardening.
    CFLAGS=${CFLAGS//-flto=auto/}
    CXXFLAGS=${CXXFLAGS//-flto=auto/}
    LDFLAGS=${LDFLAGS//-flto=auto/}
    export CFLAGS CXXFLAGS LDFLAGS
    cargo build --release --locked --workspace
}

check() {
    cd "$srcdir/ferron-$pkgver"
    # 2.x has no validate subcommand, so check the binary reports the tag
    local version
    version=$("$srcdir/target/release/ferron" --version)
    printf '%s\n' "${version%%$'\n'*}" | grep -xF "Ferron $pkgver"
}

package() {
    cd "$srcdir/ferron-$pkgver"
    install -dm755 "$pkgdir/var/log/ferron"
    install -dm755 "$pkgdir/var/www/ferron"
    install -dm755 "$pkgdir/var/lib/ferron"
    install -dm755 "$pkgdir/etc"
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -dm755 "$pkgdir/usr/lib/tmpfiles.d"
    install -dm755 "$pkgdir/usr/lib/sysusers.d"
    install -dm755 "$pkgdir/usr/share/ferron"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -Dm755 "$srcdir/target/release/ferron" "$pkgdir/usr/bin/ferron"
    install -Dm755 "$srcdir/target/release/ferron-passwd" "$pkgdir/usr/bin/ferron-passwd"
    install -Dm755 "$srcdir/target/release/ferron-yaml2kdl" "$pkgdir/usr/bin/ferron-yaml2kdl"
    install -Dm755 "$srcdir/target/release/ferron-precompress" "$pkgdir/usr/bin/ferron-precompress"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -r wwwroot "$pkgdir/usr/share/ferron/wwwroot"
    cp -r docs "$pkgdir/usr/share/doc/$pkgname/html"
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