# Maintainer: jfx <me at jfx dot ac>

pkgname=spotify-snapstore
pkgver=1.2.9.743.g85d9593d
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
        "$pkgname-$pkgver.snap::https://api.snapcraft.io/api/v1/snaps/download/pOBIoZ2LrCB3rDohMxoYGnbN14EHOgD7_64.snap"
)
sha512sums=('999abe46766a4101e27477f5c9f69394a4bb5c097e2e048ec2c6cb93dfa1743eb436bde3768af6ba1b90eaac78ea8589d82e621f9cbe7d9ab3f41acee6e8ca20'
            '2e16f7c7b09e9ecefaa11ab38eb7a792c62ae6f33d95ab1ff46d68995316324d8c5287b0d9ce142d1cf15158e61f594e930260abb8155467af8bc25779960615'
            '5e8f4a1901c26e9bb5986e048226d8a15f5bc4c2acf16b20a404f228ef142e4d21c6a88a4a54c8d9e654ba5b15cb1fea1cdc50c21fbe8e3c374e241a44adf12d'
)

package() {
    cd "$srcdir"

    squashed_path="$srcdir/$pkgname-$pkgver"
    unsquashfs -f -d "$squashed_path" "$srcdir/$pkgname-$pkgver.snap"

    # Install spotify to /opt/spotify
    mkdir -p "$pkgdir/opt/spotify"
    mv "$squashed_path/usr/share/spotify" "$pkgdir/opt/"

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
