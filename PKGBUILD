# Maintainer: Svynct <ricardoamaral2703@gmail.com>
#
# AUR recipe for mgnx (builds from a tagged release tarball).
# Publish: tag a release (git tag v$pkgver && push), then in a clean AUR clone:
#   cp packaging/PKGBUILD .
#   updpkgsums                       # refresh sha256sums when bumping pkgver
#   makepkg --printsrcinfo > .SRCINFO
#   git add PKGBUILD .SRCINFO && git commit && git push
# Build/test locally with: makepkg -si

pkgname=mgnx
pkgver=0.1.1
pkgrel=1
pkgdesc="Keyboard-driven system monitor for Linux (Tauri + React)"
arch=('x86_64')
url="https://github.com/Svynct/mgnx"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3')
makedepends=('rust' 'cargo' 'nodejs' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c22f6108c2fa61bc46912b157a4503be83c91800ce57e535b7c73fa20b840150')

build() {
    cd "$pkgname-$pkgver"
    npm ci
    npm run tauri -- build --no-bundle
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "mgnx.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "src-tauri/icons/128x128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
