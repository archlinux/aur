# Maintainer: koh11235813 <koh11235813@gmail.com>
# Contributor: shinya-saita <>
pkgname='bokuchi'
pkgver='0.8.5'
pkgrel=2
pkgdesc="A lightweight, cross-platform Markdown editor"
arch=('x86_64')
url="https://github.com/Bokuchi-Editor/bokuchi"
license=('MIT')
options=('!lto' '!debug')
depends=('webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'cairo' 'glib2' 'dbus' 'libsoup3')
makedepends=('jq' 'npm' 'rust' 'openssl' 'libappindicator' 'librsvg' 'xdotool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('89c5be35c08091075b6ce666e2df8da32c572d0188b6f4d086d7685e07e14dba')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    rm -rf src-tauri/target

    # Upstream v0.8.5 tarball still declares 0.8.4 in app metadata.
    # Patch metadata to pkgver so Tauri builds Bokuchi_0.8.5_* artifacts.
    jq --arg version "$pkgver" '.version = $version' package.json > package.json.tmp
    mv package.json.tmp package.json

    jq --arg version "$pkgver" '.version = $version | .packages[""].version = $version' package-lock.json > package-lock.json.tmp
    mv package-lock.json.tmp package-lock.json

    sed -i "0,/^version = /s/^version = .*/version = \"$pkgver\"/" src-tauri/Cargo.toml
    sed -i "/^name = \"bokuchi\"$/,/^\[/ s/^version = \".*\"/version = \"$pkgver\"/" src-tauri/Cargo.lock

    jq --arg version "$pkgver" '.version = $version | .bundle.createUpdaterArtifacts = false' src-tauri/tauri.conf.json > tauri.conf.json.tmp
    mv tauri.conf.json.tmp src-tauri/tauri.conf.json
}

build() {
    cd "$srcdir/$pkgname-$pkgver/"

    local _target="$CARCH-unknown-linux-gnu"

    npm ci
    npm run tauri:build -- --target "$_target" --bundles deb
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    local _target="$CARCH-unknown-linux-gnu"
    local _release_dir="src-tauri/target/$_target/release"
    local _desktop="$_release_dir/bundle/deb/Bokuchi_${pkgver}_amd64/data/usr/share/applications/Bokuchi.desktop"

    install -Dm755 "$_release_dir/bokuchi" \
        "$pkgdir/usr/bin/bokuchi"

    install -Dm644 "$_desktop" \
        "$pkgdir/usr/share/applications/bokuchi.desktop"
    sed -i 's/^Categories=.*/Categories=Development;TextEditor;/' \
        "$pkgdir/usr/share/applications/bokuchi.desktop"

    install -Dm644 "src-tauri/icons/bokuchi-icon_32x32.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/bokuchi.png"
    install -Dm644 "src-tauri/icons/bokuchi-icon_128x128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/bokuchi.png"

    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
