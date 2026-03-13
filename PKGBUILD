# Maintainer: jalovisko <https://github.com/jalovisko>
#
# RELEASING A NEW VERSION
# ───────────────────────
# 1. Bump version in Cargo.toml
# 2. Commit, push, and tag:
#      git tag v0.X.0 && git push origin v0.X.0
# 3. Update pkgver below and regenerate sha256sums:
#      makepkg -g
# 4. Paste the new sha256sums value below, then in aur-presshold/:
#      cp ~/dev/accentd/presshold/PKGBUILD .
#      makepkg --printsrcinfo > .SRCINFO
#      git add PKGBUILD .SRCINFO
#      git commit -m "Release v0.X.0"
#      git push origin master
pkgname=presshold
pkgver=0.2.9
pkgrel=1
pkgdesc="macOS-style accent character selector for Linux"
arch=('x86_64')
url="https://github.com/jalovisko/presshold"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'libx11')
makedepends=('cargo' 'pkg-config')
optdepends=(
    'wtype: character injection on Wayland'
    'xdotool: character injection on X11'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('422027fea158cc8556d71a5c1a83204dc5f4937ab0c8ac43e21a16bc5cc05969')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Patch the service file to use the system binary path
    sed 's|%h/.local/bin/presshold|/usr/bin/presshold|' \
        "$pkgname.service" \
        | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/$pkgname.service"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
