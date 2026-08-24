# Maintainer: detestern <detestern@proton.me>
pkgname=karincore-git
pkgver=1.2.6.r19.33c53b1
pkgrel=1
pkgdesc="KarinCore - Modern and secure proxy client"
arch=('x86_64')
url="https://github.com/detestern/KarinCore"
license=('MIT')

depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'pango' 'glib2' 'xray' 'openvpn' 'wireguard-tools')
makedepends=('npm' 'rust' 'cargo' 'git')
provides=('karincore')
conflicts=('karincore')

source=("KarinCore::git+https://github.com/detestern/KarinCore.git"
"karin-proxy-daemon.service")
sha256sums=('SKIP'
            '311fe87274a68e4df31012fdf83e30d27e9efec8d144642873b56e757dc898a5')

pkgver() {
    cd "$srcdir/KarinCore"
    printf "%s.r%s.%s" \
        "$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//' || echo 0)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/KarinCore"
    npm install
    npm run tauri build -- --no-bundle

    cd src-tauri
    cargo build --release --bin karin-proxy-daemon
}

package() {
    cd "$srcdir/KarinCore"

    install -Dm755 "src-tauri/target/release/karin-proxy" "$pkgdir/usr/bin/karincore"
    install -Dm755 "src-tauri/target/release/karin-proxy-daemon" "$pkgdir/usr/bin/karin-proxy-daemon"

    install -Dm644 "$srcdir/karin-proxy-daemon.service" "$pkgdir/usr/lib/systemd/system/karin-proxy-daemon.service"
    install -Dm755 "src-tauri/system/route.sh" "$pkgdir/etc/karin-proxy/route.sh"
    install -Dm440 "src-tauri/system/karincore-sudoers" "$pkgdir/etc/sudoers.d/karincore"

    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/karincore.png"
    mkdir -p "$pkgdir/usr/share/applications"
    cat <<EOF > "$pkgdir/usr/share/applications/karincore.desktop"
[Desktop Entry]
Type=Application
Name=KarinCore
Comment=Modern and secure proxy client
Exec=karincore
Icon=karincore
StartupWMClass=karin-proxy
Terminal=false
Categories=Network;Utility;
EOF
}
