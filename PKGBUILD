# Maintainer: AndrewImm-OP <bessmertnyja89@gmail.com>
pkgname=gallery-dl-studio
pkgver=9.93.0
pkgrel=1
pkgdesc="Beautiful GUI for gallery-dl - download images and media from 180+ sites"
arch=('x86_64')
url="https://github.com/AndrewImm-OP/gallery-dl-studio"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libnotify' 'alsa-lib' 'libsecret')
optdepends=(
    'gallery-dl: image gallery downloader backend'
    'yt-dlp: video downloader backend'
)
makedepends=('nodejs>=18' 'npm')
options=(!strip !debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('1de794131c1347158d97c3f81bdb17db6df59e7353164f303ca980b2aa9a7393'
            'SKIP'
            'SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    # Use a project-local npm cache and disable network during pacman
    # post-install (electron postinstall sometimes wants to download
    # binaries; we keep it offline-friendly by using cached deps).
    npm install --no-audit --no-fund
}

build() {
    cd "$pkgname-$pkgver"
    # Build the renderer bundle and the electron main/preload.
    npx vite build

    # Package the unpacked Linux app via electron-builder. We only need
    # `dir` target — actual install layout is provided by this PKGBUILD,
    # not by a .deb/.AppImage.
    npx electron-builder --linux dir --x64
}

package() {
    cd "$pkgname-$pkgver"

    # 1. Application files -> /opt/gallery-dl-studio
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r release/linux-unpacked/. "$pkgdir/opt/$pkgname/"

    # The chrome-sandbox helper must be SUID root for non-Chrome users
    # who don't have user namespaces enabled.
    if [ -f "$pkgdir/opt/$pkgname/chrome-sandbox" ]; then
        chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"
    fi

    # 2. Launcher in /usr/bin
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # 3. Desktop entry
    install -Dm644 "$srcdir/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    # 4. Icons (multiple sizes for hicolor theme)
    for size in 16 32 48 64 128 256 512; do
        install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    done
    # The single-source 512px PNG is enough; gtk-update-icon-cache will use it.
    install -Dm644 "resources/icon.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

    # 5. License (best-effort)
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
