# Maintainer: Manuel Schmid <https://github.com/mashb1t>
pkgname=susops-tray
pkgver=1.0.0
pkgrel=1
pkgdesc='System tray app for managing SusOps SSH SOCKS5 proxy and port forwards'
arch=('any')
url='https://github.com/mashb1t/susops-linux'
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk3'
    'libayatana-appindicator'
    'go-yq'
    'autossh'
    'openbsd-netcat'
)
makedepends=('git')
source=(
    "${pkgname}::git+https://github.com/mashb1t/susops-linux.git"
    "susops-cli::git+https://github.com/mashb1t/susops-cli.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "${pkgname}"
    python3 -c "exec(open('version.py').read()); print(VERSION)"
}

prepare() {
    cd "${pkgname}"
    git submodule init
    git config submodule.susops-cli.url "${srcdir}/susops-cli"
    git -c protocol.file.allow=always submodule update
}

package() {
    cd "${pkgname}"

    # App files
    install -Dm644 susops_tray.py "$pkgdir/usr/lib/susops/susops_tray.py"
    install -Dm644 version.py     "$pkgdir/usr/lib/susops/version.py"
    install -Dm755 susops-cli/susops.sh "$pkgdir/usr/lib/susops/susops.sh"
    cp -r icons "$pkgdir/usr/lib/susops/icons"

    # App icon
    install -Dm644 icon.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/org.susops.App.png"
    install -Dm644 icon.png \
        "$pkgdir/usr/lib/susops/icon.png"

    # Desktop entry
    install -Dm644 susops-tray.desktop \
        "$pkgdir/usr/share/applications/susops-tray.desktop"

    # License
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Launcher
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/susops-tray" << 'EOF'
#!/bin/bash
export PYTHONPATH="/usr/lib/susops${PYTHONPATH:+:$PYTHONPATH}"
exec /usr/bin/python3 /usr/lib/susops/susops_tray.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/susops-tray"
}
