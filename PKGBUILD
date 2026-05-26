# Maintainer: 88plug <https://github.com/88plug>
pkgname=intel-amt-linux
pkgver=0.1.0
pkgrel=1
pkgdesc="Linux GUI + CLI for Intel AMT/vPro out-of-band management — power, KVM, SOL, IDER, WiFi. MeshCommander alternative."
arch=('x86_64')
url="https://github.com/88plug/intel-amt-linux"
license=('MIT')
provides=('amt-manager' 'intel-amt-gui' 'vpro-manager')
depends=('nodejs' 'npm' 'msitools' 'nss' 'libxtst' 'libxss' 'gtk3' 'alsa-lib')
optdepends=(
    'docker: LMS container for same-machine AMT access via /dev/mei0'
    'libsecret: OS keyring credential vault (GNOME/libsecret)'
    'kwallet: OS keyring credential vault (KDE)'
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
    rm -rf "$pkgdir/opt/$pkgname/src/imrsdk/node_modules/deasync/build"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

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

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Intel AMT Linux
GenericName=AMT/vPro Management
Comment=Manage Intel vPro / AMT machines out-of-band from Linux — power, KVM, SOL, IDER
Exec=intel-amt-linux
Icon=intel-amt-linux
Terminal=false
Type=Application
Categories=System;Network;RemoteAccess;
Keywords=AMT;vPro;Intel;KVM;SOL;IDER;IPMI;iLO;out-of-band;manageability;remote;
DESKTOP
}
