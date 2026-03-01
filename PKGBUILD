# Maintainer: Isaac Arcia <iikz87ii@gmail.com>
pkgname=yawns
pkgver=1.2.1
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
# Note: This expects the release asset created by the packaging script
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('e099c2f694be0a69e7b456c0b3072eb5d4f161b6153a3d4fa8376582e7ff99b8')

package() {
    # 1. Enter the extracted directory
    cd "$srcdir/$pkgname-v$pkgver"

    # 2. Create the destination directory
    install -d "$pkgdir/usr/lib/$pkgname"

    # 3. Copy EVERYTHING from the source to the destination
    # This ensures src/, assets/, config.ini, etc. are all there
    cp -r * "$pkgdir/usr/lib/$pkgname/"

    # 4. Create the wrapper script
    install -d "$pkgdir/usr/bin"
    
    cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash
# Check if config dir exists in user home
if [ ! -d "\$HOME/.config/yawns" ]; then
    mkdir -p "\$HOME/.config/yawns"
    echo "Creating default config..."
    
    # Copy defaults from the installed library
    # Note: adjusting path to match where they actually are in the repo
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
