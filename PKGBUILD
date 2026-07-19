# Maintainer: ldgnu <ldgnu@github>
pkgname=qwertywm
pkgver=1.0.0
pkgrel=1
pkgdesc="Dynamic tiling window manager for the River Wayland compositor"
arch=('x86_64')
url="https://github.com/ldgnu/qwertywm"
license=('MIT')
depends=('river' 'kitty' 'fuzzel' 'foot' 'waybar' 'wlr-randr' 'ttf-liberation')
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/ldgnu/qwertywm.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    go build ./cmd/qwertywm
    go build -o qwertywmctl ./cmd/qwertywmctl
    gcc -shared -fPIC -o libqwertywm-rename.so cmd/qwertywm-session/rename.c -ldl
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 qwertywm "$pkgdir/usr/bin/qwertywm"
    install -Dm755 qwertywmctl "$pkgdir/usr/bin/qwertywmctl"
    install -Dm644 libqwertywm-rename.so "$pkgdir/usr/local/lib/libqwertywm-rename.so"

    install -Dm755 config/river/init "$pkgdir/etc/skel/.config/river/init"
    install -Dm644 config/qwertywm/config "$pkgdir/etc/skel/.config/qwertywm/config"
    install -Dm755 config/qwertywm/bar-status.sh "$pkgdir/etc/skel/.config/qwertywm/bar-status.sh"
    install -Dm644 config/waybar/config "$pkgdir/etc/skel/.config/waybar/config"
    install -Dm644 config/waybar/style.css "$pkgdir/etc/skel/.config/waybar/style.css"
    install -Dm644 config/fuzzel/fuzzel.ini "$pkgdir/etc/skel/.config/fuzzel/fuzzel.ini"
    install -Dm644 config/foot/foot.ini "$pkgdir/etc/skel/.config/foot/foot.ini"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/wayland-sessions/qwertywm.desktop" <<EOF
[Desktop Entry]
Name=qwertywm
Comment=River Wayland compositor with qwertywm window manager
Exec=env XDG_CURRENT_DESKTOP=qwertywm XDG_SESSION_DESKTOP=qwertywm river
Type=Application
EOF
}
