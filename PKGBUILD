# Maintainer: theRealPadster <padspambox at gmail dot com>
# Based on the authy and spotify AUR packages
# https://aur.archlinux.org/packages/authy
# https://aur.archlinux.org/packages/spotify
# https://unix.stackexchange.com/questions/560065/how-can-i-manually-download-a-snap-package-for-example-with-wget

pkgname=spotify-edge
pkgver=1.2.20.1210
_commit=g2a8a8a57
pkgrel=2
pkgdesc='A proprietary music streaming service. Edge version.'
arch=('x86_64')
url='https://www.spotify.com'
provides=('spotify')
conflicts=('spotify')
license=('custom')
depends=('alsa-lib>=1.0.14' 'gtk3' 'libxss' 'desktop-file-utils' 'openssl' 'nss' 'at-spi2-atk' 'libcurl-gnutls' 'libsm' 'libayatana-appindicator')
optdepends=('ffmpeg4.4: Adds support for playback of local files'
            'zenity: Adds support for importing local files'
            'libnotify: Desktop notifications')
makedepends=('squashfs-tools')
_snapid='pOBIoZ2LrCB3rDohMxoYGnbN14EHOgD7'
_snaprev='69'
source=(
    'spotify.sh'
    'spotify.protocol'
    'LICENSE'
    "https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap"
)
sha512sums=(
    'da48b628a4ea925dd8521133ebf364b261b11aed252d264dde6605d915cdb631919ffe672c58534bcdb60869e5d87a49a60a8198780b99517123f0031e83fdb1'
    '999abe46766a4101e27477f5c9f69394a4bb5c097e2e048ec2c6cb93dfa1743eb436bde3768af6ba1b90eaac78ea8589d82e621f9cbe7d9ab3f41acee6e8ca20'
    '2e16f7c7b09e9ecefaa11ab38eb7a792c62ae6f33d95ab1ff46d68995316324d8c5287b0d9ce142d1cf15158e61f594e930260abb8155467af8bc25779960615'
    'afa25daeafedb7da1c44c0e6c4c6e8160d5a0935c39acdb5256582603e56152b988142e0bb0ae5027e986f1d1bdb44627936f0f71e5f836568c66878355af590'
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
    install -Dm 644 "${pkgdir}"/opt/spotify/spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop

    # Copy icons
    install -Dm 644 "${pkgdir}"/opt/spotify/icons/spotify-linux-512.png "${pkgdir}"/usr/share/pixmaps/spotify-client.png

    for size in 22 24 32 48 64 128 256 512; do
        install -Dm 644 "${pkgdir}/opt/spotify/icons/spotify-linux-$size.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png"
    done

    # Copy launch script which allows the use of custom flags
    install -Dm 755 spotify.sh "${pkgdir}/usr/bin/spotify"

    # Copy protocol file for KDE
    install -Dm 644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kservices5/spotify.protocol"

    # Install license
    # https://www.spotify.com/legal/end-user-agreement
    # TODO: should this be in a folder called spotify or spotify-edge?
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix permissions
    chmod -R go-w "${pkgdir}"
}
