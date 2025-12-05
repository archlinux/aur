# Maintainer: Zack <zack@internetuniverse.org>
pkgname=search-cache
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast file search daemon with trigram indexing for Nautilus integration"
arch=('x86_64')
url="https://github.com/johnzfitch/search-cache"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
install=search-cache.install
source=("git+https://github.com/johnzfitch/search-cache.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/search-cache/search-cache"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/search-cache/search-cache"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

package() {
    cd "$srcdir/search-cache/search-cache"

    # Install binaries
    install -Dm755 "target/release/sc" "$pkgdir/usr/bin/sc"
    install -Dm755 "target/release/sc-daemon" "$pkgdir/usr/bin/sc-daemon"

    # Install systemd user service
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/search-cache.service" << 'EOF'
[Unit]
Description=Search Cache Daemon
After=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/sc-daemon start
Restart=on-failure
RestartSec=5

[Install]
WantedBy=default.target
EOF

    # Install default config
    install -Dm644 /dev/stdin "$pkgdir/etc/skel/.config/search-cache/config.toml" << 'EOF'
[indexing]
directories = []
exclude_patterns = [
    "**/node_modules/**",
    "**/.git/**",
    "**/target/**",
    "**/__pycache__/**",
    "**/.cache/**",
]
max_file_size_mb = 100
index_hidden_files = true

[cache]
max_query_results = 1000
hot_cache_size_mb = 50
query_history_size = 100

[performance]
indexing_threads = 8
batch_interval_ms = 100
sync_interval_sec = 30

[features]
enable_content_search = false
enable_fuzzy_match = true
enable_autocomplete = true
EOF
}
