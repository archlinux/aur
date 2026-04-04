# Maintainer: TheAnonymous <github.com/TheAnonymous>
pkgname=ollama-autocorrect-git
pkgver=r0.0.0
pkgrel=1
pkgdesc="System-wide AI autocorrection for Wayland desktops via local Ollama LLM"
arch=('any')
url="https://github.com/TheAnonymous/Autocorrect"
license=('MIT')
depends=('python' 'wl-clipboard' 'wtype' 'curl' 'libnotify' 'ollama')
optdepends=('python-pystray: tray icon support'
            'python-pillow: tray icon support'
            'dialog: terminal UI support')
makedepends=('git')
provides=('ollama-autocorrect')
conflicts=('ollama-autocorrect')
source=("git+https://github.com/TheAnonymous/Autocorrect.git")
sha256sums=('SKIP')

pkgver() {
    cd "Autocorrect"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "Autocorrect"

    install -d "$pkgdir/usr/lib/autocorrect"
    install -d "$pkgdir/usr/bin"

    for py in autocorrect.py autocorrect_undo.py ollama_manager.py ollama_tui.py ollama-tray.py i18n.py; do
        install -Dm755 "$py" "$pkgdir/usr/lib/autocorrect/$py"
    done

    cat > "$pkgdir/usr/bin/autocorrect" << 'BINSCRIPT'
#!/bin/bash
exec python3 /usr/lib/autocorrect/autocorrect.py "$@"
BINSCRIPT
    chmod 755 "$pkgdir/usr/bin/autocorrect"

    cat > "$pkgdir/usr/bin/autocorrect-undo" << 'BINSCRIPT'
#!/bin/bash
exec python3 /usr/lib/autocorrect/autocorrect_undo.py "$@"
BINSCRIPT
    chmod 755 "$pkgdir/usr/bin/autocorrect-undo"

    cat > "$pkgdir/usr/bin/ollama-manager" << 'BINSCRIPT'
#!/bin/bash
exec python3 /usr/lib/autocorrect/ollama_manager.py "$@"
BINSCRIPT
    chmod 755 "$pkgdir/usr/bin/ollama-manager"

    cat > "$pkgdir/usr/bin/ollama-tui" << 'BINSCRIPT'
#!/bin/bash
exec python3 /usr/lib/autocorrect/ollama_tui.py "$@"
BINSCRIPT
    chmod 755 "$pkgdir/usr/bin/ollama-tui"

    install -Dm755 "ollama-tray.py" "$pkgdir/usr/bin/ollama-tray"
    sed -i '1s|.*|#!/usr/bin/env python3|' "$pkgdir/usr/bin/ollama-tray"

    install -Dm644 ".install/ollama-tray.service" "$pkgdir/usr/lib/systemd/user/ollama-tray.service"
    install -Dm644 ".install/ollama-tray.desktop" "$pkgdir/etc/xdg/autostart/ollama-tray.desktop"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
