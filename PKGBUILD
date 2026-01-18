# Maintainer: rainypixel <me@bobchenkov.ru>
pkgname=hyprism-git
pkgver=r92.c8ee552
pkgrel=1
pkgdesc="A multiplatform Hytale launcher with mod manager"
arch=('x86_64')
url="https://github.com/yyyumeniku/HyPrism"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
makedepends=('go' 'npm' 'git')
provides=('hyprism')
conflicts=('hyprism' 'hyprism-bin')
source=("${pkgname}::git+https://github.com/yyyumeniku/HyPrism.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    # Install wails if not present
    if ! command -v wails &> /dev/null; then
        go install github.com/wailsapp/wails/v2/cmd/wails@latest
    fi
    export PATH="$PATH:$(go env GOPATH)/bin"

    # Create pkg-config shim for webkit2gtk-4.1 -> 4.0 compatibility
    mkdir -p "$srcdir/pkgconfig-compat"
    cat > "$srcdir/pkgconfig-compat/webkit2gtk-4.0.pc" << 'EOF'
prefix=/usr
exec_prefix=${prefix}
libdir=/usr/lib
includedir=${prefix}/include

Name: WebKitGTK
Description: Web content engine for GTK (4.1 compat shim)
URL: https://webkitgtk.org
Version: 2.50.0
Requires: glib-2.0 gtk+-3.0 libsoup-3.0 javascriptcoregtk-4.1
Libs: -L${libdir} -lwebkit2gtk-4.1
Cflags: -I${includedir}/webkitgtk-4.1
EOF
    export PKG_CONFIG_PATH="$srcdir/pkgconfig-compat:$PKG_CONFIG_PATH"
    export GOFLAGS="-trimpath"

    wails build -ldflags "-s -w"
}

package() {
    cd "$pkgname"

    install -Dm755 "build/bin/HyPrism" "$pkgdir/usr/bin/hyprism"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/hyprism.desktop" << EOF
[Desktop Entry]
Name=HyPrism
Comment=Hytale Launcher with mod manager
Exec=hyprism
Icon=hyprism
Terminal=false
Type=Application
Categories=Game;
EOF

    # Icon (if exists)
    if [[ -f "build/appicon.png" ]]; then
        install -Dm644 "build/appicon.png" "$pkgdir/usr/share/pixmaps/hyprism.png"
    elif [[ -f "appicon.png" ]]; then
        install -Dm644 "appicon.png" "$pkgdir/usr/share/pixmaps/hyprism.png"
    fi
}
