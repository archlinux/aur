# Maintainer: Isaac Arcia <[EMAIL]>
pkgname=yawns
pkgver=1.2.5
pkgrel=1
pkgdesc="Your Adaptable Widget Notification System"
arch=('any')
url="https://github.com/ikz87/yawns"
license=('GPL-3.0')
depends=(
    'python'
    'python-pyqt5'
    'python-dbus-next'
    'python-pillow'
    'python-cssutils'
    'python-xlib'
    'python-gobject'
    'python-setproctitle'
)
# The 1.2.5 re-release lives under the v1.2.5-2 tag.
_tag="v$pkgver-2"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('417e0609c5b93ca7ff2458a7a5c4ea223859c15f7d69cb0a0ef76bb82b1990b8')

package() {
    # 1. Enter the extracted directory (GitHub tags extract to repo-<tag>)
    cd "$srcdir/$pkgname-${_tag#v}"

    # 2. Create the destination directory
    install -d "$pkgdir/usr/lib/$pkgname"

    # 3. Copy EVERYTHING from the source to the destination
    cp -r * "$pkgdir/usr/lib/$pkgname/"

    # 4. Install assets where the application expects them
    install -d "$pkgdir/usr/share/$pkgname/assets"
    install -m644 assets/vinyl.png "$pkgdir/usr/share/$pkgname/assets/vinyl.png"
    install -m644 assets/yawns-logo.png "$pkgdir/usr/share/$pkgname/assets/yawns-logo.png"

    # 5. Create the wrapper script
    install -d "$pkgdir/usr/bin"
    
    cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash
# Check if config dir exists in user home
if [ ! -d "\$HOME/.config/yawns" ]; then
    mkdir -p "\$HOME/.config/yawns"
    echo "Creating default config..."
    
    # Copy defaults from the installed library
    if [ -f "/usr/lib/yawns/src/config.ini" ]; then
        cp "/usr/lib/yawns/src/config.ini" "\$HOME/.config/yawns/"
    elif [ -f "/usr/lib/yawns/config.ini" ]; then
        cp "/usr/lib/yawns/config.ini" "\$HOME/.config/yawns/"
    fi
    
    if [ -f "/usr/lib/yawns/src/style.qss" ]; then
        cp "/usr/lib/yawns/src/style.qss" "\$HOME/.config/yawns/"
    elif [ -f "/usr/lib/yawns/style.qss" ]; then
        cp "/usr/lib/yawns/style.qss" "\$HOME/.config/yawns/"
    fi
fi

# EXECUTE THE APP
exec python3 /usr/lib/yawns/src/app.py "\$@"
EOF

    chmod +x "$pkgdir/usr/bin/$pkgname"
}
