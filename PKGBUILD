# Maintainer: hoomaanf <hoomaanfelfeli@gmail.com>

pkgname=felfeldm-git
pkgver=2.0.0.r53.g54beeb0
pkgrel=1
pkgdesc="Modern download manager for Linux with queue management, speed limiting and proxy support"
arch=('any')
url="https://github.com/hoomaanf/FelfelDM"
license=('Apache-2.0')

depends=(
    python
    aria2
    python-pyqt6
    python-requests
    python-appdirs
    python-keyring
    python-websocket-client
    python-cryptography
    python-packaging
    python-jaraco.context
    python-jaraco.classes
    python-jaraco.functools
    yt-dlp
    papirus-icon-theme
)
makedepends=('git')

provides=('felfeldm')
conflicts=('felfeldm')

install=felfeldm.install

source=("git+https://github.com/hoomaanf/FelfelDM.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/FelfelDM"

    git describe --long --tags 2>/dev/null \
        | sed 's/^v//' \
        | sed 's/\(.*\)-\([0-9]*\)-g\(.*\)/\1.r\2.g\3/' \
        || printf "0.r%s.g%s" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short HEAD)"
}

package() {

    cd "$srcdir/FelfelDM"

    install -dm755 "$pkgdir/usr/share/felfeldm"

    cp -a \
        core \
        ui \
        utils \
        icons \
        logo \
        FelfelDM-extension \
        "$pkgdir/usr/share/felfeldm/" 2>/dev/null || true

    install -Dm755 main.py \
        "$pkgdir/usr/share/felfeldm/main.py"

    [ -f README.md ] && install -Dm644 README.md \
        "$pkgdir/usr/share/felfeldm/README.md"

    [ -f requirements.txt ] && install -Dm644 requirements.txt \
        "$pkgdir/usr/share/felfeldm/requirements.txt"

    install -Dm755 /dev/stdin \
        "$pkgdir/usr/bin/FelfelDM" <<'EOF'
#!/bin/sh
exec python3 /usr/share/felfeldm/main.py "$@"
EOF

    install -Dm644 logo/icon512.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/felfeldm.png"

    install -Dm644 logo/icon512.png \
        "$pkgdir/usr/share/pixmaps/felfeldm.png"

    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/felfeldm.desktop" <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=FelfelDM
Comment=Modern Download Manager
Exec=FelfelDM
Icon=felfeldm
Terminal=false
Categories=Network;Utility;
MimeType=x-scheme-handler/magnet;
StartupWMClass=FelfelDM
EOF
}
