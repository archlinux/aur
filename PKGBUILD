# Maintainer: 88plug <claude@resolver.io>
pkgname=intel-amt-linux
pkgver=0.1.0
pkgrel=1
pkgdesc="Native Linux GUI + CLI for Intel AMT / vPro out-of-band management (unofficial Intel Manageability Commander launcher)"
arch=('x86_64')
url="https://github.com/88plug/intel-amt-linux"
license=('MIT')
depends=('nodejs' 'npm' 'msitools' 'nss' 'libxtst' 'libxss' 'gtk3' 'alsa-lib')
optdepends=(
    'docker: LMS container for same-machine AMT access via /dev/mei0'
    'libsecret: OS keyring support for credential vault'
    'kwallet: KDE keyring support for credential vault'
)
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

    # Remove build artifacts not needed at runtime
    rm -rf "$pkgdir/opt/$pkgname/src/imrsdk/node_modules/deasync/build"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'LAUNCHER'
#!/bin/bash
APP=/opt/intel-amt-linux
# First-run: download and extract Intel IMC (requires internet + ~200MB disk)
if [ ! -d "$APP/upstream/app/script" ]; then
    echo "intel-amt-linux: first run — downloading Intel Manageability Commander..."
    cd "$APP" && npm run setup
fi
exec bash "$APP/scripts/run.sh" "$@"
LAUNCHER
    chmod +x "$pkgdir/usr/bin/$pkgname"

    # Desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Intel AMT Linux
GenericName=AMT Management GUI
Comment=Manage Intel vPro / AMT machines out-of-band from Linux
Exec=intel-amt-linux
Icon=intel-amt-linux
Terminal=false
Type=Application
Categories=System;Network;RemoteAccess;
Keywords=AMT;vPro;Intel;IPMI;KVM;SOL;IDER;out-of-band;
DESKTOP
}
