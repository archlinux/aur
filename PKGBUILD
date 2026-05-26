# Maintainer: 88plug <https://github.com/88plug>
pkgname=intel-amt-linux
pkgver=0.1.0
pkgrel=2
pkgdesc="Linux GUI+CLI for Intel AMT/vPro: KVM, SOL, IDER, power control. IPMI/iLO/MeshCommander alt."
arch=('x86_64')
url="https://github.com/88plug/intel-amt-linux"
license=('MIT')
depends=('nodejs' 'npm' 'msitools' 'nss' 'libxtst' 'libxss' 'gtk3' 'alsa-lib')
optdepends=(
    'docker: LMS container for same-machine AMT access via /dev/mei0'
    'libsecret: GNOME keyring credential vault'
    'kwallet: KDE keyring credential vault'
    'libappindicator-gtk3: system tray icon support'
)
options=('!strip' '!debug')
install="${pkgname}.install"
source=("git+https://github.com/88plug/intel-amt-linux.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    npm install --no-audit 2>/dev/null
}

package() {
    cd "$srcdir/$pkgname"

    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r . "$pkgdir/opt/$pkgname/"

    # Remove native module build artifacts — prebuilt binaries handle platform support
    rm -rf "$pkgdir/opt/$pkgname/src/imrsdk/node_modules/deasync/build"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Launcher
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'LAUNCHER'
#!/bin/bash
APP=/opt/intel-amt-linux
if [ ! -d "$APP/upstream/app/script" ]; then
    echo "intel-amt-linux: first run — downloading Intel Manageability Commander..."
    cd "$APP" && npm run setup
fi
exec "$APP/scripts/run.sh" "$@"
LAUNCHER
    chmod +x "$pkgdir/usr/bin/$pkgname"

    # Desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Intel AMT Linux
GenericName=AMT/vPro Management
Comment=Manage Intel vPro/AMT machines out-of-band - power, KVM, SOL, IDER, IPMI alternative
Exec=intel-amt-linux
Icon=intel-amt-linux
Terminal=false
Type=Application
Categories=System;Network;RemoteAccess;
Keywords=AMT;vPro;Intel;KVM;SOL;IDER;IPMI;iLO;BMC;out-of-band;manageability;remote;MeshCommander;
DESKTOP
}
