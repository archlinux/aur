# Maintainer: Raphaël Plassart <raphael.plassart@gmail.com>
# https://github.com/QoreDB/QoreDB

pkgname=qoredb-git
_pkgname=qoredb
pkgver=0.1.22.r0.g0000000
pkgrel=1
pkgdesc="Next gen database client — lightweight alternative to DBeaver/pgAdmin (git version)"
arch=('x86_64')
url="https://github.com/QoreDB/QoreDB"
license=('Apache-2.0')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup'
    'openssl'
    'pango'
    'webkit2gtk'
)
makedepends=(
    'cargo'
    'git'
    'nodejs'
    'pnpm'
    'rust'
    'tauri-cli'
    'webkit2gtk'
    'base-devel'
    'curl'
    'wget'
    'file'
    'appmenu-gtk-module'
    'libappindicator-gtk3'
    'librsvg'
)
optdepends=(
    'postgresql-libs: PostgreSQL connection support'
    'libmysqlclient: MySQL connection support'
    'sqlite: SQLite connection support'
    'openssh: SSH tunnel support'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustup show active-toolchain | sed 's/ .*//')-unknown-linux-gnu" \
        --manifest-path src-tauri/Cargo.toml 2>/dev/null || true
}

build() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # Install frontend dependencies
    pnpm install --frozen-lockfile

    # Build frontend
    pnpm build

    # Build Tauri application (release mode)
    cd src-tauri
    cargo build --release
}

package() {
    cd "${_pkgname}"

    # Install binary
    install -Dm755 "src-tauri/target/release/${_pkgname}" \
        "${pkgdir}/usr/bin/${_pkgname}"

    # Install desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/qoredb.desktop" <<EOF
[Desktop Entry]
Name=QoreDB
Comment=Next gen database client
Exec=qoredb %U
Icon=qoredb
Terminal=false
Type=Application
Categories=Development;Database;
StartupWMClass=QoreDB
MimeType=x-scheme-handler/qoredb;
EOF

    # Install icons
    for size in 32x32 64x64 128x128; do
        if [ -f "src-tauri/icons/${size}.png" ]; then
            install -Dm644 "src-tauri/icons/${size}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}/apps/qoredb.png"
        fi
    done
    # Main icon as 256x256
    if [ -f "src-tauri/icons/icon.png" ]; then
        install -Dm644 "src-tauri/icons/icon.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/qoredb.png"
    fi

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
