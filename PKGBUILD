# Maintainer: jfx <me at jfx dot ac>

pkgname=spotify-snapstore
pkgver=1.1.99.878.g1e4ccc6e
pkgrel=1
pkgdesc='A proprietary music streaming service'
conflicts=('spotify')
provides=('spotify')
arch=('x86_64')
license=('custom')
url='https://www.spotify.com'
depends=('alsa-lib>=1.0.14' 'gtk3' 'libxss' 'desktop-file-utils' 'openssl' 'nss' 'at-spi2-atk' 'libcurl-gnutls' 'libsm' 'squashfs-tools')
optdepends=('ffmpeg-compat-57: Adds support for playback of local files'
            'zenity: Adds support for importing local files'
            'libnotify: Desktop notifications')
options=('!strip')

# can find the download link from the snapstore API
# curl -H 'Snap-Device-Series: 16' https://api.snapcraft.io/v2/snaps/info/spotify
source=('spotify.protocol'
        'LICENSE'
        "$pkgname-$pkgver.snap::https://api.snapcraft.io/api/v1/snaps/download/pOBIoZ2LrCB3rDohMxoYGnbN14EHOgD7_62.snap"
)
sha512sums=('999abe46766a4101e27477f5c9f69394a4bb5c097e2e048ec2c6cb93dfa1743eb436bde3768af6ba1b90eaac78ea8589d82e621f9cbe7d9ab3f41acee6e8ca20'
            '2e16f7c7b09e9ecefaa11ab38eb7a792c62ae6f33d95ab1ff46d68995316324d8c5287b0d9ce142d1cf15158e61f594e930260abb8155467af8bc25779960615'
            '9b8f63c067632f15f5abf6449d09d28fd56839decfc9801d4526cf5b97b9cb5933ede179bcd0b0f2d8b6d4c7e72f55c7fc13dfb0ae4293ef447ead1d018b9cc6'
)

package() {
    cd "$srcdir"

    squashed_path="$srcdir/$pkgname-$pkgver"
    unsquashfs -f -d "$squashed_path" "$srcdir/$pkgname-$pkgver.snap"

    # Install spotify to /opt/spotify
    mkdir -p "$pkgdir/opt/spotify"
    mv "$squashed_path/usr/share/spotify" "$pkgdir/opt/"

    mkdir -p "$pkgdir/usr/share/doc/spotify-client"
    install -Dm644 "$squashed_path/usr/share/doc/spotify-client/changelog.gz" "$pkgdir/usr/share/doc/spotify-client/changelog.gz"

    # Enable spotify to open URLs from the webapp
    sed -i 's/^Exec=.*/Exec=spotify --uri=%U/' "$pkgdir"/opt/spotify/spotify.desktop
    sed -i "s|Icon=/usr/share/spotify/icons/spotify-linux-128.png|Icon=/usr/share/pixmaps/spotify-client.png|" "$pkgdir"/opt/spotify/spotify.desktop

    install -Dm644 "$pkgdir/opt/spotify/spotify.desktop" "$pkgdir"/usr/share/applications/spotify.desktop
    install -Dm644 "$pkgdir/opt/spotify/icons/spotify-linux-512.png" "$pkgdir"/usr/share/pixmaps/spotify-client.png

    for size in 22 24 32 48 64 128 256 512; do
        install -Dm644 "$pkgdir/opt/spotify/icons/spotify-linux-$size.png" \
            "$pkgdir/usr/share/icons/hicolor/$sizex$size/apps/spotify.png"
    done

    # Symlink spotify binary which is located in /opt
    mkdir -p "$pkgdir/usr/bin"
    ln -sf /opt/spotify/spotify "$pkgdir/usr/bin/spotify"

    # Copy protocol file for KDE
    install -Dm644 "$srcdir/spotify.protocol" "$pkgdir/usr/share/kservices5/spotify.protocol"

    # Install license
    # https://www.spotify.com/legal/end-user-agreement
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Fix permissions
    chmod -R go-w "$pkgdir"
}
