# Just installs spotify-client_1.1.42.622.gbd112320-37_amd64.deb
# as it's the last version with working titlebar in xfce. Used
# commit 3de9ffc2dc16fc068a26b5678a990a0e7b82f053 from Spotify
# AUR package as base.
#
# Maintainer: Markus Hartung <mail@hartmark.se>
#

_pkgname=spotify
pkgname=spotify-1.1.42-deb
pkgver=1.1.42.622
pkgrel=1
pkgdesc='A proprietary music streaming service version 1.1.42.622'
arch=('x86_64')
license=('custom')
url='https://www.spotify.com'
depends=('alsa-lib>=1.0.14' 'gtk2' 'libsystemd' 'libxss' 'desktop-file-utils' 'openssl' 'nss' 'at-spi2-atk')
depends_x86_64=('libcurl-gnutls')
optdepends=('ffmpeg-compat-57: Adds support for playback of local files'
            'zenity: Adds support for importing local files'
            'libnotify: Desktop notifications')
options=('!strip')

provides=("$_pkgname")
conflicts=('spotify' 'spotify-dev')
source=('spotify.protocol'
        'LICENSE')
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://mirror.cs.uchicago.edu/spotify/pool/non-free/s/spotify-client/spotify-client_1.1.42.622.gbd112320-37_amd64.deb")
md5sums=('ef25ddc5b6bf8fe1a0d64cbd79e1f7b4'
         '4f42403ad17aa70eaa94f0e675db7241')
md5sums_x86_64=('9c9cbd30bac795b8ca71643de9d2d719')

package() {
    cd "${srcdir}"

    tar -xzf data.tar.gz -C "${pkgdir}"

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
