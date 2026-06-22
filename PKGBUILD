# Maintainer: koh11235813 <koh11235813@gmail.com>
# Contributor: shinya-saita <>
pkgname='bokuchi'
pkgver='0.9.3'
pkgrel=2
pkgdesc="A lightweight, cross-platform Markdown editor"
arch=('x86_64')
url="https://github.com/Bokuchi-Editor/bokuchi"
license=('MIT')
options=('!lto' '!debug')
depends=('webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'cairo' 'glib2' 'dbus' 'libsoup3')
makedepends=('jq' 'npm' 'rust' 'openssl' 'librsvg')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fecbc7ac6f9729a52639030e98411461c1a3b202b87ed68b34d0490390d0f666')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    rm -rf src-tauri/target

    # patch createUpdateArtifacts.
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
