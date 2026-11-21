# Maintainer: Aria Arctic <aria@zeusteam.dev>
# Contributor: Rowan <rowan@zeusteam.dev>
pkgname=ferron-git
pkgver=3.0.0rc11.r0.g0000000
pkgrel=3
pkgdesc='A fast, modern web server written in Rust (git)'
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv64')
url='https://ferron.sh'
license=('MIT')
depends=('gcc-libs' 'glibc' 'ca-certificates')
makedepends=('cargo' 'git')
provides=("ferron=$pkgver")
conflicts=('ferron' 'ferron-rc' 'ferronweb' 'ferron-bin' 'ferronweb-bin' 'ferronweb-git')
install=ferron-git.install
source=("git+https://github.com/ferronweb/ferron.git#branch=develop-3.x")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/ferron"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf '0.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/ferron"
    export CARGO_TARGET_DIR="$srcdir/target"
    # makepkg's -flto=auto breaks the static mimalloc and aws-lc these crates
    # link against, with undefined symbols. Drop LTO from the flags and keep
    # the hardening.
    CFLAGS=${CFLAGS//-flto=auto/}
    CXXFLAGS=${CXXFLAGS//-flto=auto/}
    LDFLAGS=${LDFLAGS//-flto=auto/}
    export CFLAGS CXXFLAGS LDFLAGS
    cargo build --release --locked --workspace
}

package() {
    cd "$srcdir/ferron"
    install -dm755 "$pkgdir/var/log/ferron"
    install -dm755 "$pkgdir/var/www/ferron"
    install -dm755 "$pkgdir/var/lib/ferron"
    install -dm755 "$pkgdir/etc/ferron"
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -dm755 "$pkgdir/usr/lib/tmpfiles.d"
    install -dm755 "$pkgdir/usr/lib/sysusers.d"
    install -dm755 "$pkgdir/usr/share/ferron"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -Dm755 "$srcdir/target/release/ferron" "$pkgdir/usr/bin/ferron"
    for binary in ferron-serve ferron-passwd ferron-fmt ferron-kdl2ferron ferron-precompress; do
        if [ ! -f "$srcdir/target/release/$binary" ]; then
            echo "ERROR: $binary was not built, the workspace layout may have changed"
            exit 1
        fi
        install -Dm755 "$srcdir/target/release/$binary" "$pkgdir/usr/bin/$binary"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -r wwwroot "$pkgdir/usr/share/ferron/wwwroot"
    [[ -d docs ]] && cp -r docs "$pkgdir/usr/share/doc/$pkgname/html"
    # the packaged config is upstream's, with the webroot pointed at the Arch path
    local cfg="configs/ferron.pkgunix.conf"
    if [ ! -f "$cfg" ]; then
        echo "ERROR: $cfg missing, upstream may have renamed the packaged config"
        exit 1
    fi
    grep -qxF '    root /var/www/ferron' "$cfg" || {
        echo "ERROR: $cfg no longer sets root /var/www/ferron, review the config before packaging"
        exit 1
    }
    install -Dm644 "$cfg" "$pkgdir/usr/share/ferron/ferron.conf.default"
    cat > "$pkgdir/usr/lib/systemd/system/ferron.service" << 'EOF'
[Unit]
Description=Ferron web server
After=network.target

[Service]
Type=exec
User=ferron
Group=ferron
ExecStart=/usr/bin/ferron run -c /etc/ferron/ferron.conf
ExecReload=/usr/bin/kill -HUP $MAINPID
Restart=on-failure
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_BIND_SERVICE
NoNewPrivileges=yes
StateDirectory=ferron
StateDirectoryMode=0700
Environment=XDG_DATA_HOME=/var/lib/ferron
LogsDirectory=ferron

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