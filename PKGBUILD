# Maintainer: skint007 <archlinux.repose742@passmail.net>
pkgname=yay-sys-tray-git
pkgver=1.4.0.68.49906ac
pkgrel=3
pkgdesc="Arch Linux system tray update checker using yay (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/skint007/yay-sys-tray"
license=('MIT')
depends=(webkit2gtk-4.1 gtk3 libayatana-appindicator pacman-contrib yay)
optdepends=('tailscale: remote server update checking via Tailscale'
            'openssh: SSH access for remote server update checks')
# pnpm (current) needs Node 22.13+ (it imports node:sqlite), so require it
# explicitly — otherwise an older system Node fails mid-build with a cryptic
# crash. Users who can't/won't bump Node should install yay-sys-tray-bin.
makedepends=(git rust cargo 'nodejs>=22.13.0' pnpm)
# ring (via reqwest/rustls, used for the AUR RPC check) compiles its C and
# assembly through the cc crate, which picks up makepkg's CFLAGS. With Arch's
# default `lto` option those objects become LLVM bitcode that the final Rust
# link can't resolve, and the build dies on `undefined symbol: ring_core_*`.
options=(!lto)
provides=('yay-sys-tray')
conflicts=('yay-sys-tray' 'yay-sys-tray-bin')
install=yay-sys-tray-git.install
source=("git+https://github.com/skint007/yay-sys-tray.git")
sha256sums=('SKIP')

pkgver() {
    # Fall back to the stamped pkgver= if source hasn't been fetched yet
    # (e.g. when makepkg --printsrcinfo is run by CI before cloning)
    local src="${srcdir}/yay-sys-tray"
    [ -d "$src" ] || { echo "$pkgver"; return; }
    cd "$src"
    git describe --tags --long --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/-0-g[0-9a-f]*$//;s/-\([0-9]*\)-g\([0-9a-f]*\)$/.\1.\2/' \
        || printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd yay-sys-tray
    pnpm install --frozen-lockfile
    pnpm tauri build --no-bundle
}

package() {
    cd yay-sys-tray

    install -Dm755 src-tauri/target/release/yay-sys-tray "$pkgdir/usr/bin/yay-sys-tray"
    install -Dm644 resources/yay-sys-tray.desktop "$pkgdir/usr/share/applications/yay-sys-tray.desktop"
    install -Dm644 resources/yay-sys-tray.service "$pkgdir/usr/lib/systemd/user/yay-sys-tray.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
