# Maintainer: Daniel Garcia <dgarcia@kabr.org>
pkgname=kittenspaceagency-bin
pkgver=2026.10.13.5602
buildnum="${pkgver##*.}"
pkgrel=1
pkgdesc="Kitten Space Agency - EXPERIMENTAL"
arch=('x86_64')
url="https://files.ksa-archive.net"
license=('custom')
depends=('glibc' 'gcc-libs' 'dotnet-runtime-10.0')
options=(!strip)
source=("ksa_linux_v${pkgver}.tar.gz::$url/builds/${buildnum}/ksa_linux_v${pkgver}.tar.gz"
        "kittenspaceagency.png")
sha256sums=('0514dbb74cae2664a4bc5c9c4e749e5c750cf9e5b83153f2d65fcd6bc810009a'
            '4e10dedc70614419a5a2354642556d15fe331565d0d94a4fa41ab04dd8b24486')

package() {
    install -dm755 "$pkgdir/opt/kittenspaceagency"

    # Extract game files
    tar -xf "$srcdir/ksa_linux_v${pkgver}.tar.gz" -C "$pkgdir/opt/kittenspaceagency"

    # Fix permissions
    chmod 755 "$pkgdir/opt/kittenspaceagency/KSA"
    chmod 755 "$pkgdir/opt/kittenspaceagency/Brutal.Monitor.Subprocess"

    # Launcher
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/kittenspaceagency" <<'EOF'
#!/bin/bash

# Ensure ~/Documents exists
if [[ ! -d "$HOME/Documents" ]]; then
    mkdir -p "$HOME/Documents"
fi

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
