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
    'python-pyqt6'
    'python-watchdog'
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

    # Install Python deps not available in official repos
    pip install --quiet --no-build-isolation \
        --target="$srcdir/lib_deps" \
        qtawesome \
        pyclamd
}

package() {
    cd "QLAM-$pkgver"

    # App files
    install -dm755 "$pkgdir/usr/share/qlam"
    cp -r main.py core ui resources Logos \
        "$pkgdir/usr/share/qlam/"

    # Bundled pip libs (qtawesome, pyclamd)
    cp -r "$srcdir/lib_deps" "$pkgdir/usr/share/qlam/lib"

    # Launcher
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/qlam" << 'EOF'
#!/bin/bash
export PYTHONPATH="/usr/share/qlam/lib${PYTHONPATH:+:$PYTHONPATH}"
exec python3 /usr/share/qlam/main.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/qlam"

    # Desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/qlam.desktop" << 'EOF'
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
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null \
        || install -Dm644 /dev/null \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
