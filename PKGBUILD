pkgname=wmacro-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Macro recorder and automation tool for Hyprland"
arch=('x86_64')
url="https://github.com/uint82/wmacro"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme')
options=("!debug" "!lto")
makedepends=('cargo' 'git')
provides=('wmacro')
conflicts=('wmacro')
source=("git+https://github.com/uint82/wmacro.git")
sha256sums=('SKIP')
install="wmacro.install"

pkgver() {
    cd wmacro
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd wmacro
    cargo build --release --locked --workspace
}

package() {
    cd wmacro

    # 1. install binaries
    install -Dm755 "target/release/wmacro-daemon" "$pkgdir/usr/bin/wmacro-daemon"
    install -Dm755 "target/release/wmacro-gui" "$pkgdir/usr/bin/wmacro"

    # 2. assets
    install -Dm644 "scripts/assets/wmacro.desktop" "$pkgdir/usr/share/applications/wmacro.desktop"

    install -Dm644 "gui/src/ui/assets/icons/16x16/apps/wmacro.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/wmacro.png"
    install -Dm644 "gui/src/ui/assets/icons/32x32/apps/wmacro.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/wmacro.png"
    install -Dm644 "gui/src/ui/assets/icons/48x48/apps/wmacro.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/wmacro.png"
    install -Dm644 "gui/src/ui/assets/icons/64x64/apps/wmacro.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/wmacro.png"
    install -Dm644 "gui/src/ui/assets/icons/128x128/apps/wmacro.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/wmacro.png"
    install -Dm644 "gui/src/ui/assets/icons/256x256/apps/wmacro.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/wmacro.png"

    install -Dm644 "scripts/assets/99-wmacro.rules" "$pkgdir/usr/lib/udev/rules.d/99-wmacro.rules"

    # 3. system configurations
    install -Dm644 "scripts/packaging/arch/wmacro.sysusers" "$pkgdir/usr/lib/sysusers.d/wmacro.conf"
    install -Dm644 "scripts/packaging/arch/wmacro-modules.conf" "$pkgdir/usr/lib/modules-load.d/wmacro.conf"

    # 4. system-level systemd service configuration
    install -Dm644 "scripts/daemon/wmacro.service" "$pkgdir/usr/lib/systemd/system/wmacro-daemon.service"
}
