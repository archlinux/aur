

pkgname=linux-guardian
pkgver=0.r3.g8c4d7f2
pkgrel=1
pkgdesc="A cross-distribution Linux system optimization and maintenance tool built with Python and PyQt6"
arch=('any')
url="https://github.com/hoomaanf/linux_guardian"
license=('GPL3')

depends=(
    python
    python-pyqt6
    python-psutil
    python-requests
    python-importlib-metadata
    python-platformdirs
    git
)
makedepends=('git')

provides=('linux-guardian')
conflicts=('linux-guardian')

install=linux-guardian.install

source=("git+https://github.com/hoomaanf/linux_guardian.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/linux_guardian"
    
    
    local _tag=$(git describe --tags --abbrev=0 2>/dev/null)
    local _rev=$(git rev-list --count HEAD 2>/dev/null)
    local _hash=$(git rev-parse --short HEAD 2>/dev/null)
    
    if [ -n "$_tag" ] && [ -n "$_rev" ] && [ -n "$_hash" ]; then
        
        _tag=$(echo "$_tag" | sed 's/^v//')
        echo "${_tag}.r${_rev}.g${_hash}"
    else
        
        echo "0.r${_rev}.g${_hash}"
    fi
}

package() {
    cd "$srcdir/linux_guardian"

    install -dm755 "$pkgdir/usr/share/linux-guardian"

    cp -a \
        app \
        "$pkgdir/usr/share/linux-guardian/" 2>/dev/null || true

    install -Dm755 main.py \
        "$pkgdir/usr/share/linux-guardian/main.py"

    [ -f README.md ] && install -Dm644 README.md \
        "$pkgdir/usr/share/linux-guardian/README.md"

    [ -f requirements.txt ] && install -Dm644 requirements.txt \
        "$pkgdir/usr/share/linux-guardian/requirements.txt"

    install -Dm755 /dev/stdin \
        "$pkgdir/usr/bin/linux-guardian" <<'EOF'
#!/bin/sh
exec python3 /usr/share/linux-guardian/main.py "$@"
EOF

    
    if [ -f "app/icon/logo.png" ]; then
        install -Dm644 app/icon/logo.png \
            "$pkgdir/usr/share/icons/hicolor/256x256/apps/linux-guardian.png"
        
        install -Dm644 app/icon/logo.png \
            "$pkgdir/usr/share/pixmaps/linux-guardian.png"
    fi

    
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/linux-guardian.desktop" <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=Linux Guardian
Comment=System Security and Optimization Tool
Exec=linux-guardian
Icon=linux-guardian
Terminal=false
Categories=System;Utility;
StartupWMClass=LinuxGuardian
EOF
}
