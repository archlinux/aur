# Maintainer: AzPepoze <azpepoze@gmail.com>
pkgname=linux-wallpaperengine-gui-git
_pkgname=linux-wallpaperengine-gui
pkgver=r1.0000000
pkgrel=1
pkgdesc="GUI for linux-wallpaperengine using Go(Backend) and Electron(Frontend)"
arch=('x86_64')
url="https://github.com/AzPepoze/linux-wallpaperengine-gui"
license=('GPL-3.0-only')
depends=('linux-wallpaperengine' 'gtk3' 'nss' 'libxss' 'alsa-lib')
makedepends=('git' 'bun' 'go' 'python') 
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    
    # Create local cache directories
    mkdir -p "$srcdir/electron-cache"
    mkdir -p "$srcdir/go-build"
    mkdir -p "$srcdir/go/pkg/mod"
    mkdir -p "$srcdir/bun-cache"
    mkdir -p "$srcdir/bun-install"

    # Set Go Environment explicitly
    export GOPATH="$srcdir/go"
    export GOCACHE="$srcdir/go-build"
    export GOMODCACHE="$srcdir/go/pkg/mod"
    
    if [ -d "src/backend" ]; then
        msg2 "Entering src/backend to download Go modules..."
        pushd "src/backend"
        go mod download -x
        popd
    fi
}

build() {
    cd "$srcdir/$_pkgname"
    
    # Set local caches for Electron and Go to avoid using global user directories
    export ELECTRON_CACHE="$srcdir/electron-cache"
    export ELECTRON_BUILDER_CACHE="$srcdir/electron-cache"
    
    export GOPATH="$srcdir/go"
    export GOCACHE="$srcdir/go-build"
    export GOMODCACHE="$srcdir/go/pkg/mod"
    export BUN_CACHE="$srcdir/bun-cache"
    export BUN_INSTALL="$srcdir/bun-install"
    
    bun install
    bun run build

    # Fix permissions for Go module cache to allow cleanup
    chmod -R u+w "$srcdir/go"
}

package() {
    cd "$srcdir/$_pkgname"
    local _dist_dir="dist/linux-unpacked" 

    install -d "$pkgdir/opt/$_pkgname"
    cp -r "$_dist_dir/"* "$pkgdir/opt/$_pkgname/"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -d "$pkgdir/usr/share/applications"
    cat <<EOF > "$pkgdir/usr/share/applications/$_pkgname.desktop"
[Desktop Entry]
Name=Linux Wallpaper Engine GUI
Comment=Manage wallpapers for linux-wallpaperengine
Exec=/usr/bin/$_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Categories=Utility;
EOF

    if [ -f "$_dist_dir/resources/icon.png" ]; then
        install -Dm644 "$_dist_dir/resources/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    fi
}
