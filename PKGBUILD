# Maintainer: theRealPadster <padspambox at gmail dot com>
# Based on the authy and spotify AUR packages
# https://aur.archlinux.org/packages/authy
# https://aur.archlinux.org/packages/spotify
# https://unix.stackexchange.com/questions/560065/how-can-i-manually-download-a-snap-package-for-example-with-wget

pkgname=spotify-edge
pkgver=1.2.9.743
_commit=g85d9593d
pkgrel=1
pkgdesc='A proprietary music streaming service. Edge version.'
arch=('x86_64')
url='https://www.spotify.com'
provides=('spotify')
conflicts=('spotify')
license=('custom')
depends=('alsa-lib>=1.0.14' 'gtk3' 'libxss' 'desktop-file-utils' 'openssl' 'nss' 'at-spi2-atk' 'libcurl-gnutls' 'libsm')
optdepends=('ffmpeg4.4: Adds support for playback of local files'
            'zenity: Adds support for importing local files'
            'libnotify: Desktop notifications')
makedepends=('squashfs-tools')
_snapid='pOBIoZ2LrCB3rDohMxoYGnbN14EHOgD7'
_snaprev='64'
source=(
    'spotify.protocol'
    'LICENSE'
    "https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap"
)
sha512sums=(
    '999abe46766a4101e27477f5c9f69394a4bb5c097e2e048ec2c6cb93dfa1743eb436bde3768af6ba1b90eaac78ea8589d82e621f9cbe7d9ab3f41acee6e8ca20'
    '2e16f7c7b09e9ecefaa11ab38eb7a792c62ae6f33d95ab1ff46d68995316324d8c5287b0d9ce142d1cf15158e61f594e930260abb8155467af8bc25779960615'
    '5e8f4a1901c26e9bb5986e048226d8a15f5bc4c2acf16b20a404f228ef142e4d21c6a88a4a54c8d9e654ba5b15cb1fea1cdc50c21fbe8e3c374e241a44adf12d'
)

prepare() {
    echo 'Extracting snap file...'
    unsquashfs -q -f -d "${srcdir}/${pkgname}" "${_snapid}_${_snaprev}.snap"
}

package() {
    # Install files
    install -d "${pkgdir}/opt/spotify"
    install -d "${pkgdir}/usr/share"
    install -d "${pkgdir}/usr/bin"

    # copy /usr/share/spotify into /opt/spotify
    cp -r "${srcdir}/${pkgname}/usr/share/spotify/." "${pkgdir}/opt/spotify"

    # Enable spotify to open URLs from the webapp
    sed -i 's/^Exec=.*/Exec=spotify --uri=%U/' "${pkgdir}"/opt/spotify/spotify.desktop

    # Fix the icon
    sed -i 's/^Icon=.*/Icon=spotify-client/' "${pkgdir}"/opt/spotify/spotify.desktop

    # Desktop Entry
    install -Dm644 "${pkgdir}"/opt/spotify/spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop

    # Copy icons
    install -Dm644 "${pkgdir}"/opt/spotify/icons/spotify-linux-512.png "${pkgdir}"/usr/share/pixmaps/spotify-client.png

    for size in 22 24 32 48 64 128 256 512; do
        install -Dm644 "${pkgdir}/opt/spotify/icons/spotify-linux-$size.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png"
    done

    # Symlink spotify binary which is located in /opt
    ln -sf /opt/spotify/spotify "${pkgdir}/usr/bin/spotify"

    # Copy protocol file for KDE
    install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kservices5/spotify.protocol"

    # Install license
    # https://www.spotify.com/legal/end-user-agreement
    # TODO: should this be in a folder called spotify or spotify-edge?
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix permissions
    chmod -R go-w "${pkgdir}"
}
