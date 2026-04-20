# Maintainer: Blacky Fox <blacky@blackyfox.net>
_pkgname='vrc-get'
pkgname=alcom-git
pkgver=1.1.6_beta.0.r5348.g64779918
pkgrel=1
pkgdesc="A fast open-source alternative of VRChat Creator Companion (VCC)"
arch=('x86_64')
url='https://github.com/vrc-get/vrc-get'
license=('MIT')
depends=(gtk3 openssl webkit2gtk-4.1 libappindicator-gtk3 librsvg)
makedepends=(cargo nodejs npm)
optdepends=('unityhub: Used to open created projects and migrate projects from older versions of Unity.')
provides=('alcom' 'vrc-get-gui')
conflicts=('alcom' 'vrc-get-gui')
options+=(!lto)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    _version=$(grep -m 1 '^version = ' "$_pkgname-gui/Cargo.toml" | cut -d '"' -f 2 | tr '-' '_')
    printf "%s.r%s.g%s" "$_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

prepare() {
    cd "$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

    cd $_pkgname-gui
    npm ci
}

build() {
    cd "$_pkgname/$_pkgname-gui"

    # Applying the RUSTFLAGS from the workflow matrix
    export RUSTFLAGS="-C link-arg=-fuse-ld=lld"
    
    # Using the custom xtask defined in your workflow
    cargo xtask build-alcom --release
}

check() {
    cd "$_pkgname/$_pkgname-gui"
    cargo test -p vrc-get-gui --release --frozen
}

package() {
    cd "$_pkgname"

    install -Dm755 "target/release/ALCOM" "$pkgdir/usr/bin/ALCOM"
    
    # Fixed for Wayland and install the desktop file
    sed -e 's/{{exec}}/GDK_BACKEND=x11 WEBKIT_DISABLE_DMABUF_RENDERER=1 ALCOM/g' \
        -e 's/Categories=Development/Categories=Development;/g' \
        -e 's/MimeType=x-scheme-handler\/vcc/MimeType=x-scheme-handler\/vcc;/g' \
        $_pkgname-gui/bundle/alcom.desktop > $_pkgname-gui/bundle/alcom-fixed.desktop

    install -Dm644 "$_pkgname-gui/bundle/alcom-fixed.desktop" "$pkgdir/usr/share/applications/ALCOM.desktop"    
    install -Dm644 "$_pkgname-gui/icons/128x128.png" "$pkgdir/usr/share/pixmaps/alcom.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ALCOM/LICENSE"
}
