# Maintainer: Kimiblock Moe

# Taken from aur/spotify

# Maintainer: Christian Heusel <christian@heusel.eu>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: TobFromme < TobFromme {hat} pm {dont} me >
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Eothred <yngve.levinsen@gmail.com>

pkgname=spotify-portable
pkgver='1.2.63.394'
epoch=1
_commit=g126b0d89
pkgrel=1
pkgdesc='Music streaming service. Sandboxed by portable with Wayland support.'
arch=('x86_64')
license=('custom')
url='https://www.spotify.com'
depends=('alsa-lib>=1.0.14' 'gtk3' 'libxss' 'desktop-file-utils' 'openssl' 'nss' 'at-spi2-atk' 'libcurl-gnutls' 'libsm' 'libayatana-appindicator')
optdepends=('ffmpeg4.4: Adds support for playback of local files'
            'libnotify: Desktop notifications')
options=('!strip')

source=("${pkgname}-${pkgver}-${_commit}-x86_64.deb::http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_commit}_amd64.deb"
        "spotify.sh"
        "LICENSE"
        "portable-config")
sha512sums=('571533058e96a1e6519d851413ca5528b159f195fb9f8f483799bde087ad24b75b770f529273b3167a81f4bfa1d842523a8c3d56b68d4a29fb51e83583cbd9a2'
            '990ef8d561d596cccc780f1e365e71bc94f561fd05c236828aa0cba1fbb151bc622358c866794303bc5d9daf01299b2fcf9375f1b8d23ca110928f7cdb8bfa78'
            '2e16f7c7b09e9ecefaa11ab38eb7a792c62ae6f33d95ab1ff46d68995316324d8c5287b0d9ce142d1cf15158e61f594e930260abb8155467af8bc25779960615'
            '313ef74414af7acc6d8d586589a6d0ea2dddda6bd363050c1ca89130623309a38269cc8b4eb15a8fdfd164e61634fc52222f4867ab1aa1e7742523035651b2c4')

#prepare() {
#
#}

package() {
    tar -xzf data.tar.gz --no-same-owner -C "${pkgdir}"

    # Enable spotify to open URLs from the webapp
    sed -i 's/^Exec=.*/Exec=spotify --uri=%u/' "${pkgdir}/usr/share/spotify/spotify.desktop"

    install -Dm 644 "${pkgdir}/usr/share/spotify/spotify.desktop" "${pkgdir}/usr/share/applications/com.spotify.player.desktop"
    install -Dm 644 "${pkgdir}/usr/share/spotify/icons/spotify-linux-512.png" "${pkgdir}/usr/share/pixmaps/spotify-client.png"

    for size in 22 24 32 48 64 128 256 512; do
        install -Dm 644 "${pkgdir}/usr/share/spotify/icons/spotify-linux-${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png"
    done

    # Move spotify binary to its proper location
    mkdir -p "${pkgdir}/opt/spotify"
    mv "${pkgdir}/usr/share/spotify" "${pkgdir}/opt/"

    # Copy launch script which allows the use of custom flags
    install -Dm 755 spotify.sh "${pkgdir}/usr/bin/spotify"

    # Install license
    # https://www.spotify.com/legal/end-user-agreement
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix permissions
    chmod -R go-w "${pkgdir}"
    install -Dm755 "${srcdir}/portable-config" "${pkgdir}/usr/lib/portable/info/com.spotify.player/config"
    echo '''[Desktop Entry]
Type=Application
Name=Spotify Music
GenericName=Stub for MPRIS
Icon=spotify
TryExec=spotify
Exec=spotify --uri=%u
Terminal=false
NoDisplay=true
Categories=Audio;Music;Player;AudioVideo;''' >"${pkgdir}/usr/share/applications/spotify.desktop"
}

