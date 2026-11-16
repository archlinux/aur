# Maintainer: JuhLabs (Julian Hermstad) <juhlabs@example.com>
# Co-Maintainer: Lucas Hubner <lucasguilhermehubner@hotmail.com>
# Arch Linux PKGBUILD for JuhRadial MX

pkgname=juhradial-mx
pkgver=0.4.4
pkgrel=1
pkgdesc="Beautiful radial menu for Logitech MX Master mice on Linux"
arch=('x86_64')
url="https://github.com/JuhLabs/juhradial-mx"
license=('GPL3')
depends=(
    'gtk4'
    'gtk4-layer-shell'
    'python'
    'python-gobject'
    'python-cairo'
    'python-cryptography'
    'dbus'
)
makedepends=(
    'rust'
    'cargo'
    'nodejs'
    'git'
)
optdepends=(
    'ydotool: for cursor capture on Wayland'
    'npm: kwin-script'
)
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6157b211db5a9bc879f466b609e5bd9e28e59c7efd8762ccc7f8d9a35672edf4')

build() {
    cd "$pkgname-$pkgver"

    # Build Rust daemon
    cd daemon
    cargo build --release --locked
    cd ..

    # Build KWin script (optional)
    if [ -d "kwin-script" ]; then
        cd kwin-script
        npm ci --legacy-peer-deps 2>/dev/null || npm install --legacy-peer-deps
        npm run build 2>/dev/null || true
        cd ..
    fi
}

package() {
    cd "$pkgname-$pkgver"

    # Install daemon binary
    install -Dm755 daemon/target/release/juhradiald "$pkgdir/usr/local/bin/juhradiald"

    # Install launcher script
    install -Dm755 scripts/juhradial-mx.sh "$pkgdir/usr/bin/juhradial-mx"

    # Install overlay Python files
    install -dm755 "$pkgdir/usr/share/juhradial"
    install -Dm644 overlay/*.py "$pkgdir/usr/share/juhradial/"

    # Install flow module
    cp -r overlay/flow "$pkgdir/usr/share/juhradial/flow"

    # Install locales
    if [ -d "overlay/locales" ]; then
        cp -r overlay/locales "$pkgdir/usr/share/juhradial/"
    fi

    # Install assets
    install -dm755 "$pkgdir/usr/share/juhradial/assets"
    cp -r assets/* "$pkgdir/usr/share/juhradial/assets/"

    # Install desktop file
    install -Dm644 packaging/juhradial-mx.desktop "$pkgdir/usr/share/applications/juhradial-mx.desktop"

    # Install icon
    install -Dm644 assets/juhradial-mx.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/juhradial-mx.svg"

    # Install systemd user service
    install -Dm644 packaging/systemd/juhradialmx-daemon.service "$pkgdir/usr/lib/systemd/user/juhradialmx-daemon.service"

    # Install udev rules
    install -Dm644 packaging/udev/99-juhradialmx.rules "$pkgdir/usr/lib/udev/rules.d/99-juhradialmx.rules"
    install -Dm644 packaging/udev/60-ydotool-uinput.rules "$pkgdir/usr/lib/udev/rules.d/60-ydotool-uinput.rules"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
}

post_install() {
    echo ">>> To start JuhRadial MX:"
    echo "    systemctl --user enable --now juhradialmx-daemon"
    echo "    juhradial-mx"
    echo ""
    echo ">>> Or find 'JuhRadial MX' in your application menu"
}

post_upgrade() {
    post_install
}
