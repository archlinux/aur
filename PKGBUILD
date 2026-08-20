pkgname=hpr
pkgver=0.9.7
pkgrel=1
pkgdesc="Offline zero-account activity tracker"
arch=('x86_64')
url="https://github.com/plexescor/HPR"
license=('GPL')

depends=('glibc' 'dbus' 'curl')
install=hpr.install

source=("HPRv${pkgver}-Linux.tar.xz::https://github.com/plexescor/HPR/releases/download/v${pkgver}/HPRv${pkgver}-Linux.tar.xz")
sha256sums=('SKIP')

package() {
    # Locate the directory containing the HPR binary inside the extracted tarball
    local _src
    _src=$(find "$srcdir" -maxdepth 2 -type f -name 'HPR' -exec dirname {} \; | head -n1)

    install -Dm755 "$_src/HPR" \
        "$pkgdir/usr/bin/hpr"

    # libslint_cpp.so placed next to the binary to satisfy RPATH=$ORIGIN (mirrors install.sh behavior)
    install -Dm755 "$_src/libslint_cpp.so" \
        "$pkgdir/usr/bin/libslint_cpp.so"

    install -Dm644 "$_src/assets/logo_256png.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/hpr.png"

    # Default config files
    install -Dm644 "$_src/aliases.csv" \
        "$pkgdir/usr/share/hpr/aliases.csv"

    install -Dm644 "$_src/tabAliases.csv" \
        "$pkgdir/usr/share/hpr/tabAliases.csv"

    install -Dm644 "$_src/projectAliases.csv" \
        "$pkgdir/usr/share/hpr/projectAliases.csv"

    install -Dm644 "$_src/config.csv" \
        "$pkgdir/usr/share/hpr/config.csv"

    install -Dm755 "$_src/installWindowCallsExtension.sh" \
        "$pkgdir/usr/share/hpr/installWindowCallsExtension.sh"

    # UI + assets
    cp -r "$_src/ui" \
        "$pkgdir/usr/share/hpr/ui"

    cp -r "$_src/assets" \
        "$pkgdir/usr/share/hpr/assets"

    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/hpr.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=HPR
Comment=Offline zero-account activity tracker
Exec=hpr
Icon=hpr
Terminal=false
Categories=Utility;
StartupNotify=true
EOF
}
