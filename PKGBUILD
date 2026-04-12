# Maintainer: Daniel Garcia <dgarcia@kabr.org>
pkgname=kittenspaceagency-bin
pkgver=2026.4.10.4057
pkgrel=1
pkgdesc="Kitten Space Agency - EXPERIMENTAL"
arch=('x86_64')
url="https://ksa-linux.ahwoo.com"
license=('custom')
depends=('glibc' 'gcc-libs' 'dotnet-runtime-10.0')
options=(!strip)
source=("setup_ksa_v${pkgver}.tar.gz::$url/download?file=setup_ksa_v${pkgver}.tar.gz"
    "kittenspaceagency.png")
sha256sums=('074b583121bc30930923486d26656bb5c1ace85b9a33a7d0f5cd87cccc52fc4a'
    '4e10dedc70614419a5a2354642556d15fe331565d0d94a4fa41ab04dd8b24486')

package() {
    install -dm755 "$pkgdir/opt/kittenspaceagency"

    # Extract tarball
    tar -xf "$srcdir/setup_ksa_v${pkgver}.tar.gz" -C "$pkgdir/opt/kittenspaceagency"

    # Flatten linux-x64
    cp -a "$pkgdir/opt/kittenspaceagency/linux-x64/." "$pkgdir/opt/kittenspaceagency/"
    rm -r "$pkgdir/opt/kittenspaceagency/linux-x64"

    # Fix permissions
    chmod 755 "$pkgdir/opt/kittenspaceagency/KSA"
    chmod 755 "$pkgdir/opt/kittenspaceagency/Brutal.Monitor.Subprocess"

    # Launcher
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/kittenspaceagency" <<'EOF'
#!/bin/bash
cd /opt/kittenspaceagency
exec ./KSA "$@"
EOF

    # Install icon
    install -Dm644 "$srcdir/kittenspaceagency.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/kittenspaceagency.png"

    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/kittenspaceagency.desktop" <<'EOF'
[Desktop Entry]
Name=Kitten Space Agency
Comment=Experimental build of Kitten Space Agency
Exec=env XDG_SESSION_TYPE=x11 kittenspaceagency
Icon=kittenspaceagency
Terminal=false
Type=Application
Categories=Game;
StartupNotify=true
EOF

}
