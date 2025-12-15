# Maintainer: Junaid Rahman <junaid.cloud2@gmail.com>
pkgname=guiman
pkgver=1.6.0
pkgrel=1
pkgdesc="The Ultimate Arch Linux Package Manager - GUI with 100% pacman & AUR feature parity"
arch=('x86_64')
url="https://github.com/Junaid433/guiman"
license=('MIT')
depends=(
    'webkit2gtk'
    'gtk3'
    'libayatana-appindicator'
    'pacman'
    'sudo'
)
makedepends=(
    'nodejs'
    'npm'
    'git'
    'ffmpeg'
    'pkgconf'
    'openssl'
    'rust'
    'cargo'
    'base-devel'
)
optdepends=(
    'yay: AUR helper support'
    'paru: AUR helper support'
    'reflector: Mirror management'
    'polkit: Password-free operations'
)
provides=('guiman')
conflicts=('guiman-bin' 'guiman-git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/guiman"
    git describe --tags --abbrev=0 | sed 's/^v//'
}

prepare() {
    cd "$srcdir/guiman"

    if [ -f "src-tauri/icons/icon.png" ]; then
        ffmpeg -y -loglevel error -i src-tauri/icons/icon.png -vf "format=rgba,scale=512:512:force_original_aspect_ratio=increase,crop=512:512" src-tauri/icons/icon_rgba.png
        mv src-tauri/icons/icon_rgba.png src-tauri/icons/icon.png
        echo "Icon converted to RGBA format and made square"
    fi

    if [ -f "src-tauri/tauri.conf.json" ]; then
        sed -i 's/"productName": "GuiMan"/"productName": "guiman"/' src-tauri/tauri.conf.json
        echo "Fixed productName in tauri.conf.json"
    fi
}

build() {
    cd "$srcdir/guiman"

    npm ci --silent || npm install --silent

    npm install --silent @tauri-apps/cli

    npx tauri build || {
        echo "Build failed" >&2
        exit 1
    }
}

package() {
    cd "$srcdir/guiman"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash
export WEBKIT_DISABLE_COMPOSITING_MODE=0
export WEBKIT_USE_GPU=1
export WEBKIT_DISABLE_DMABUF_RENDERER=1
export GDK_BACKEND=x11
exec /usr/lib/guiman/guiman "$@"
EOF
    
    install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/lib/guiman/$pkgname"

    [ -f "$pkgname.desktop" ] && install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    [ -f "src-tauri/icons/icon.png" ] && install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    if [ -f "polkit/com.guiman.pkexec.policy" ]; then
        install -Dm644 "polkit/com.guiman.pkexec.policy" "$pkgdir/usr/share/polkit-1/actions/com.guiman.pkexec.policy"
    fi

    [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    [ -f README.md ] && install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
