# Maintainer: Qingxu <me@linioi.com>
pkgname=nowledge-mem
pkgver=0.10.41
pkgrel=1
pkgdesc='Local-first memory and context management system for AI-powered workflows'
url='https://mem.nowledge.co'
arch=(
    'x86_64'
)
license=(
    'LicenseRef-proprietary'
)
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'libayatana-appindicator'
)
makedepends=(
    'zstd'
)
optdepends=(
    'gnome-keyring: for credential storage'
    'xdg-utils: for opening links and nowledgemem:// URLs'
)
provides=(
    'nmem-cli'
)
conflicts=(
    'nmem-cli'
    'nowledge-mem-bin'
)
options=(
    '!strip'
    '!debug'
)
source_x86_64=(
    "nowledge-mem-$pkgver.deb::https://download-mem.nowledge.co/app/$pkgver/$CARCH-unknown-linux-gnu.deb"
)
noextract=(
    "nowledge-mem-$pkgver.deb"
)
sha256sums_x86_64=('10eebaff30e425dcc8bd2de1a0a67225f253454c928d478b8a5e2056805baef7')

package() {
    local _deb="$srcdir/nowledge-mem-$pkgver.deb"
    ar p "$_deb" data.tar.gz | tar xz -C "$pkgdir"

    chmod -R u=rwX,go=rX "$pkgdir"

    local _app_dir="$pkgdir/usr/lib/Nowledge Mem"
    local _up_dir="$_app_dir/_up_"
    local _runtime_archive="$_up_dir/python-runtime.tar.zst"

    # Upstream ships the Python runtime compressed and unpacks it in postinst;
    # unpack at build time instead so pacman owns every installed file.
    if [[ -f "$_runtime_archive" ]]; then
        tar --zstd -xf "$_runtime_archive" -C "$_up_dir"
        if [[ -f "$_up_dir/runtime-version.txt" ]]; then
            cp "$_up_dir/runtime-version.txt" "$_up_dir/python-standalone/.runtime-version"
        fi
        rm -f "$_runtime_archive"
    fi

    # The upstream Debian layout puts the Tauri GUI in /usr/bin while its
    # Rust backend lives under /usr/lib, so automatic backend discovery fails.
    [[ -x "$pkgdir/usr/bin/nowledge-mem" ]]
    [[ -x "$_up_dir/rust-backend/nmem-server" ]]
    mv "$pkgdir/usr/bin/nowledge-mem" "$_app_dir/nowledge-mem"

    cat > "$pkgdir/usr/bin/nowledge-mem" << 'EOF'
#!/bin/sh
: "${NMEM_SERVER_BIN:=/usr/lib/Nowledge Mem/_up_/rust-backend/nmem-server}"
export NMEM_SERVER_BIN
exec "/usr/lib/Nowledge Mem/nowledge-mem" "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/nowledge-mem"

    # Expose the bundled Rust CLIs on PATH. Upstream's Debian package ships
    # them under the private application directory without creating links.
    local _rust_backend="$_up_dir/rust-backend"
    [[ -x "$_rust_backend/nmem" ]]
    [[ -x "$_rust_backend/browse-now" ]]
    ln -s '/usr/lib/Nowledge Mem/_up_/rust-backend/nmem' \
        "$pkgdir/usr/bin/nmem"
    ln -s '/usr/lib/Nowledge Mem/_up_/rust-backend/browse-now' \
        "$pkgdir/usr/bin/browse-now"

    # Upstream ships no license file; record where the terms live.
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << 'EOF'
Nowledge Mem is proprietary software.
Terms of service: https://mem.nowledge.co/terms
EOF
}
