# Maintainer: Isaac Arcia <iikz87ii@gmail.com>
pkgname=yawns
pkgver=1.2.4
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
# changed this back to just using the source code instead of 
# a redundant tar
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d45d0f7bc6489530630b7a11799a6620b75d27357d44907fcef73c8b9e07639f')

package() {
    # 1. Enter the extracted directory (GitHub tags extract to repo-version)
    cd "$srcdir/$pkgname-$pkgver"

    # 2. Create the destination directory
    install -d "$pkgdir/usr/lib/$pkgname"

    # 3. Copy EVERYTHING from the source to the destination
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
