# Maintainer: Void Modding team
pkgname=void-mod-manager-git
pkgver=r62.f083c3a
pkgrel=1
pkgdesc="A simple mod manager made for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/void-modding/app"
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'rust' 'bun-bin')
provides=('void-mod-manager' 'void-mod-manager-git')
conflicts=('void-mod-manager')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=(strip docs !libtool !staticlibs emptydirs zipman purge debug !lto)

pkgver() {
    cd $srcdir/$pkgname

    git fetch --all

    _commit_count=$(git rev-list --count HEAD)
    _commit_hash=$(git rev-parse --short HEAD)

    printf "r%s.%s" "$_commit_count" "$_commit_hash"
}

prepare() {
    cd $srcdir/$pkgname
    bun install
}

build() {
    cd $srcdir/$pkgname
    export ZSTD_STATIC=1
    # We have to enable NO_STRIP due to a bug
    NO_STRIP=1 bun run tauri build -b appimage
}

package() {
    cd $srcdir/$pkgname/src-tauri/target/release/bundle/appimage/void-mod-manager.AppDir

    # Install the main binary
    install -Dm755 usr/bin/void-mod-manager "$pkgdir/usr/bin/void-mod-manager"

    # Desktop entry
    install -Dm644 usr/share/applications/void-mod-manager.desktop \
        "$pkgdir/usr/share/applications/void-mod-manager.desktop"

    # Icons (From bundle)
    find usr/share/icons -type f | while read -r icon; do
        target_dir="$pkgdir/${icon}"
        mkdir -p "$(dirname "$target_dir")"
        install -Dm644 "$icon" "$target_dir"
    done
}
