# Maintainer: Berk Küçük <berkkucukk@proton.me>

pkgname=qlam
pkgver=1.1.0
pkgrel=1
pkgdesc="A modern antivirus GUI powered by ClamAV"
arch=('x86_64')
url="https://github.com/berk-kucuk/QLAM"
license=('MIT')
depends=(
    'python'
    'python-virtualenv'
    'clamav'
    'polkit'
)
makedepends=('python-pip')
optdepends=(
    'clamav-freshclam: automatic virus database updates'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/berk-kucuk/QLAM/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c236584b209d4e355ded2725bea7c33550574c8b7383fc68188085f2306dd685')

build() {
    cd "QLAM-$pkgver"

    python3 -m venv --system-site-packages "$srcdir/venv"
    "$srcdir/venv/bin/pip" install --quiet --no-build-isolation \
        PyQt6 pyclamd watchdog qtawesome
}

package() {
    cd "QLAM-$pkgver"

    # App files
    install -dm755 "$pkgdir/usr/share/qlam"
    cp -r main.py core ui resources Logos \
        "$pkgdir/usr/share/qlam/"

    # Venv — relocate to final install path
    cp -r "$srcdir/venv" "$pkgdir/usr/share/qlam/venv"

    # Fix venv shebangs and activation scripts to point to final path
    find "$pkgdir/usr/share/qlam/venv/bin" -type f | while read -r f; do
        sed -i "s|$srcdir/venv|/usr/share/qlam/venv|g" "$f" 2>/dev/null || true
    done

    # Launcher
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/qlam" << 'EOF'
#!/bin/bash
exec /usr/share/qlam/venv/bin/python /usr/share/qlam/main.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/qlam"

    # Desktop entry
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/qlam.desktop" << 'EOF'
[Desktop Entry]
Name=Qlam
GenericName=Antivirus
Comment=ClamAV-powered antivirus with a modern interface
Exec=qlam
Icon=qlam
Terminal=false
Type=Application
Categories=System;Security;
Keywords=antivirus;clamav;security;scan;virus;malware;
StartupNotify=true
StartupWMClass=Qlam
EOF

    # Icons
    install -Dm644 Logos/qlam.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/qlam.png"
    install -Dm644 Logos/qlam.png \
        "$pkgdir/usr/share/pixmaps/qlam.png"

    # License
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    if [ -f LICENSE ]; then
        install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
