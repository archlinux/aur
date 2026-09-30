# Maintainer: Blacky Fox <blacky@blackyfox.net>
_pkgname='vrc-get'
pkgname=alcom-git
pkgver=1.1.9_beta.0.r6006.g29bb9ea3
pkgrel=1
pkgdesc="A fast open-source alternative of VRChat Creator Companion (VCC)"
arch=('x86_64')
url='https://github.com/vrc-get/vrc-get'
license=('MIT')
depends=(gtk3 openssl webkit2gtk-4.1 libappindicator-gtk3 librsvg)
makedepends=(cargo nodejs npm)
optdepends=('unityhub: Used to open created projects and migrate projects from older versions of Unity.' 'libxml2-legacy: Fix the issue of the missing libxml2.so.2 error in Unity for Linux.')
provides=('alcom' 'vrc-get-gui')
conflicts=('alcom' 'vrc-get-gui')
options+=(!lto)
source=("git+${url}.git" "build.patch")
sha256sums=('SKIP'
            '594d53001e366084417a18fa88928563cfb6571464394718d7f556416ca216d5')

pkgver() {
    cd "$_pkgname"
    # Extract version, strip any injected commit hash (+...), and translate hyphens
    _version=$(grep -m 1 '^version = ' "$_pkgname-gui/Cargo.toml" | cut -d '"' -f 2 | cut -d '+' -f 1 | tr '-' '_')
    printf "%s.r%s.g%s" "$_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"

    #Patch Updater
    patch -p 1 -i "${srcdir}/build.patch"

    # Disable bundling updater
    cd vrc-get-gui
    sed -i '/remove if ci/d' Tauri.toml
    
    # Apply new version to Cargo.toml (append git commit hash)
    _commit=$(git rev-parse --short HEAD)
    sed -i -E "s/^version = \"(.*)\"/version = \"\1+$_commit\"/" Cargo.toml
    cd ..

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"

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
    cargo test -p vrc-get-gui --release
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
