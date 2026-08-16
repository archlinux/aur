# Maintainer: AzPepoze <azpepoze@gmail.com>

pkgname=linux-wallpaperengine-gui-git
_pkgname=linux-wallpaperengine-gui
pkgver=r1.0000000
pkgrel=1
pkgdesc="GUI for linux-wallpaperengine using Go(Backend) and Electron(Frontend)"
arch=('x86_64')
url="https://github.com/AzPepoze/linux-wallpaperengine-gui"
license=('GPL-3.0-only')

depends=(
    'linux-wallpaperengine'
    'gtk3'
    'nss'
    'libxss'
    'alsa-lib'
	'libayatana-appindicator'
)

makedepends=(
    'git'
    'bun'
    'go'
    'python'
)

provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")

source=("git+${url}.git")
sha256sums=('SKIP')


_setup_go_env() {
    local _golang_workspace_path="$srcdir/go"
    local _golang_module_cache_path="$srcdir/go/pkg/mod"
    local _golang_build_cache_path="$srcdir/go-build"

    mkdir -p \
        "$_golang_workspace_path/bin" \
        "$_golang_module_cache_path" \
        "$_golang_build_cache_path"

    export GOPATH="$_golang_workspace_path"
    export GOMODCACHE="$_golang_module_cache_path"
    export GOCACHE="$_golang_build_cache_path"

    if [[ " ${GOFLAGS:-} " != *" -modcacherw "* ]]; then
        export GOFLAGS="${GOFLAGS:+${GOFLAGS} }-modcacherw"
    fi

    export PATH="${GOPATH}/bin:${PATH}"
}


pkgver() {
    cd "$srcdir/$_pkgname"

    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}


prepare() {
    cd "$srcdir/$_pkgname"

    mkdir -p \
        "$srcdir/electron-cache" \
        "$srcdir/bun-cache" \
        "$srcdir/bun-install"

    _setup_go_env

    if [[ -d "src/backend" ]]; then
        msg2 "Entering src/backend to download Go modules..."

        pushd "src/backend"
        go mod download -x
        popd
    fi
}


build() {
    cd "$srcdir/$_pkgname"

    export ELECTRON_CACHE="$srcdir/electron-cache"
    export ELECTRON_BUILDER_CACHE="$srcdir/electron-cache"

    export BUN_CACHE="$srcdir/bun-cache"
    export BUN_INSTALL="$srcdir/bun-install"

    _setup_go_env

    bun install
    bun run build
}


package() {
    cd "$srcdir/$_pkgname"

    local _dist_dir="dist/linux-unpacked"

    install -d "$pkgdir/opt/$_pkgname"
    cp -r "$_dist_dir/"* "$pkgdir/opt/$_pkgname/"

    install -d "$pkgdir/usr/bin"
    ln -s \
        "/opt/$_pkgname/$_pkgname" \
        "$pkgdir/usr/bin/$_pkgname"

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

    if [[ -f "$_dist_dir/resources/icon.png" ]]; then
        install -Dm644 \
            "$_dist_dir/resources/icon.png" \
            "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    fi
}
