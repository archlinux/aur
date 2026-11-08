# Maintainer: Anjishnu Sengupta <itsaemail@duck.com>
pkgname=ny-cli
pkgver=7.1.0
pkgrel=1
pkgdesc="Beautiful terminal anime streaming client with artwork display, cloud sync, and watch progress tracking"
arch=('any')
url="https://github.com/AnjishnuSengupta/ny-cli"
license=('MIT')
depends=('nodejs>=20.18.0' 'npm')
optdepends=(
    'mpv: recommended video player with IPC support'
    'vlc: alternative video player'
    'ffmpeg: stream recording and subtitle muxing'
    'webtorrent-cli: torrent streaming and downloading support'
    'chafa: terminal image rendering for artwork display'
)
options=('!debug' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AnjishnuSengupta/ny-cli/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export npm_config_cache="$srcdir/npm-cache"
    npm pack
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    export npm_config_cache="$srcdir/npm-cache"
    local tarball
    tarball=$(ls -1 anjishnusengupta-ny-cli-*.tgz 2>/dev/null | head -n 1)
    npm install -g \
        --prefix "$pkgdir/usr" \
        --cache "$srcdir/npm-cache" \
        --no-audit \
        --no-fund \
        "$tarball"

    # Set sane directory and file permissions
    find "$pkgdir/usr" -type d -exec chmod 755 {} +
    find "$pkgdir/usr" -type f -exec chmod u=rwX,go=rX {} +
    chmod 755 "$pkgdir/usr/bin/ny-cli" 2>/dev/null || true

    # Ensure proper root ownership in package
    chown -R root:root "$pkgdir" 2>/dev/null || true

    # Clean up package.json _where references
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d' 2>/dev/null || true

    # Install license and docs
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
