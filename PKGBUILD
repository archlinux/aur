# Maintainer: Daniel Garcia <dgarcia@kabr.org>
pkgname=kittenspaceagency-bin
pkgver=2026.5.6.4337
pkgrel=1
pkgdesc="Kitten Space Agency - EXPERIMENTAL"
arch=('x86_64')
url="https://ksa-linux.ahwoo.com"
license=('custom')
depends=('glibc' 'gcc-libs' 'dotnet-runtime-10.0')
options=(!strip)
source=("setup_ksa_v${pkgver}.tar.gz::$url/download?file=setup_ksa_v${pkgver}.tar.gz"
    "kittenspaceagency.png")
sha256sums=('3be628423855e4043927de1b47a204bd6e6bf230a272f1d5f1bec2e04a081e35'
            '4e10dedc70614419a5a2354642556d15fe331565d0d94a4fa41ab04dd8b24486')

package() {
    install -dm755 "$pkgdir/opt/kittenspaceagency"

    # Flatten linux-x64
    cp -a "$srcdir/linux-x64/." "$pkgdir/opt/kittenspaceagency/"

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
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/kittenspaceagency.desktop" <<EOF
[Desktop Entry]
Name=Kitten Space Agency
Comment=Experimental build of Kitten Space Agency
Exec=env XDG_SESSION_TYPE=x11 kittenspaceagency
Icon=kittenspaceagency
Terminal=false
Type=Application
Categories=Game;
StartupNotify=true
StartupWMClass=Kitten Space Agency (KSA) v$pkgver
EOF

}
