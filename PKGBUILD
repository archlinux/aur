# Maintainer: tgiachi <tom@orivega.io>
pkgname=arrr-tray-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="System tray client for the Arrr Linux notification aggregator (built from source)"
arch=('x86_64')
url="https://github.com/tgiachi/Arrr"
license=('MIT')
depends=('dbus' 'libnotify' 'libx11' 'libice' 'libsm' 'fontconfig')
makedepends=('dotnet-sdk>=10' 'git')
optdepends=(
    'arrr-git: Arrr notification aggregator daemon'
    'arrr-bin: Arrr notification aggregator daemon (pre-built)'
)
provides=('arrr-tray')
conflicts=('arrr-tray' 'arrr-tray-bin')
install=arrr-tray-git.install
source=(
    "Arrr::git+https://github.com/tgiachi/Arrr.git"
    "arrr-tray.desktop"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/Arrr"
    git describe --long --tags 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/Arrr"

    # Publish self-contained single-file binary
    dotnet publish src/Arrr.Tray/Arrr.Tray.csproj \
        -c Release \
        -r linux-x64 \
        --self-contained true \
        -p:PublishSingleFile=true \
        -p:IncludeNativeLibrariesForSelfExtract=true \
        -o "$srcdir/publish-tray"
}

package() {
    install -Dm755 "$srcdir/publish-tray/arrr-tray" "${pkgdir}/usr/bin/arrr-tray"
    install -Dm644 "$srcdir/arrr-tray.desktop" \
        "${pkgdir}/etc/xdg/autostart/arrr-tray.desktop"
    install -Dm644 "$srcdir/Arrr/src/Arrr.Tray/Assets/tray-icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/arrr-tray.png"
}
