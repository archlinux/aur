# This package uses the https://github.com/ThePoorPilot/Unofficial-Spotify repository
# to provide the latest Spotify build available.
# Maintainer: Eduard Tolosa <edu4rdshl[at]protonmail.com>

pkgname=spotify-snap
pkgver=1.1.80.699
_commit=gc3dac750
pkgrel=3
pkgdesc='A proprietary music streaming service.'
arch=('x86_64')
license=('custom')
url='https://www.spotify.com'
depends=('alsa-lib>=1.0.14' 'gtk3' 'libxss' 'desktop-file-utils' 'openssl' 'nss' 'at-spi2-atk' 'libcurl-gnutls' 'libsm')
optdepends=('ffmpeg-compat-57: Adds support for playback of local files'
            'zenity: Adds support for importing local files'
            'libnotify: Desktop notifications')
options=('!strip')
conflicts=('spotify')
provides=('spotify')
source=('spotify.protocol'
	"https://github.com/ThePoorPilot/Unofficial-Spotify/releases/download/${pkgver}.${_commit}/spotify-unofficial_${pkgver}.${_commit}_amd64.deb"
        'LICENSE'
	)
sha512sums=('999abe46766a4101e27477f5c9f69394a4bb5c097e2e048ec2c6cb93dfa1743eb436bde3768af6ba1b90eaac78ea8589d82e621f9cbe7d9ab3f41acee6e8ca20'
            'c943f870a2a25faa44727a20b828910aaa1a923642398a05031143e1b19f274d6e82f210f541851d77a0fa52edda6d26c0f74a062c5db52c68abd52169d8137d'
            '2e16f7c7b09e9ecefaa11ab38eb7a792c62ae6f33d95ab1ff46d68995316324d8c5287b0d9ce142d1cf15158e61f594e930260abb8155467af8bc25779960615')
package() {
    cd "${srcdir}"

    tar -xf data.tar.xz -C "${pkgdir}"

    # Enable spotify to open URLs from the webapp
    sed -i 's/^Exec=.*/Exec=spotify --uri=%U/' "${pkgdir}"/usr/share/spotify/spotify.desktop

    # Use the correct icon path
    sed -i 's/^Icon=.*/Icon=\/usr\/share\/pixmaps\/spotify-client.png/' /opt/spotify/spotify.desktop

    install -Dm644 "${pkgdir}"/usr/share/spotify/spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop
    install -Dm644 "${pkgdir}"/usr/share/spotify/icons/spotify-linux-512.png "${pkgdir}"/usr/share/pixmaps/spotify-client.png

    for size in 22 24 32 48 64 128 256 512; do
        install -Dm644 "${pkgdir}/usr/share/spotify/icons/spotify-linux-$size.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png"
    done

    # Move spotify binary to its proper location
    mkdir -p "${pkgdir}"/opt/spotify
    mv "${pkgdir}/usr/share/spotify" "${pkgdir}/opt/"

    # Symlink spotify binary which is located in /opt
    ln -sf /opt/spotify/spotify "${pkgdir}/usr/bin/spotify"

    # Copy protocol file for KDE
    install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kservices5/spotify.protocol"

    # Install license
    # https://www.spotify.com/legal/end-user-agreement
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix permissions
    chmod -R go-w "${pkgdir}"
}

