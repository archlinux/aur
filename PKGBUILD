# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: TobFromme < TobFromme {hat} pm {dont} me >
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Eothred <yngve.levinsen@gmail.com>

pkgname=spotify-1.1
_pkg=spotify
pkgver=1.1.84.716
_commit=gc5f8b819-2
pkgrel=1
pkgdesc='A proprietary music streaming service. (Legacy version branch v1.1.)'
arch=('x86_64')
license=('custom')
url='https://www.spotify.com'
depends=('alsa-lib>=1.0.14' 'gtk3' 'libxss' 'desktop-file-utils' 'openssl' 'nss' 'at-spi2-atk' 'libcurl-gnutls' 'libsm')
optdepends=('ffmpeg4.4: Adds support for playback of local files'
            'zenity: Adds support for importing local files'
            'libnotify: Desktop notifications')
options=('!strip')
provides=("${_pkg}" "${_pkg}-dev" "${_pkg}-edge" "${_pkg}-legacy")
conflicts=("${_pkg}" "${_pkg}-dev" "${_pkg}-edge" "${_pkg}-legacy")

source=('spotify.protocol'
        'LICENSE'
        "${_pkg}-${pkgver}-${_commit}-x86_64.deb::https://web.archive.org/web/20221223020256if_/http://repository.spotify.com/pool/non-free/s/${_pkg}-client/${_pkg}-client_${pkgver}.${_commit}_amd64.deb") # Not in their repo anymore.

sha512sums=('999abe46766a4101e27477f5c9f69394a4bb5c097e2e048ec2c6cb93dfa1743eb436bde3768af6ba1b90eaac78ea8589d82e621f9cbe7d9ab3f41acee6e8ca20'
            '2e16f7c7b09e9ecefaa11ab38eb7a792c62ae6f33d95ab1ff46d68995316324d8c5287b0d9ce142d1cf15158e61f594e930260abb8155467af8bc25779960615'
            '9ba6c2d155f683b9a38222d58a2a53a2a5f4b422ed1c0d603af87919ba8a68309aea3354278fd1d5d8142a1568d93b7e83b14c041e749b0c39f3bc155a633ef8')

# Import key with:
# curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | gpg --import -
validpgpkeys=('E27409F51D1B66337F2D2F417A3A762FAFD4A51F') # Spotify Public Repository Signing Key <tux@spotify.com>

package() {
    cd "${srcdir}"

    tar -xzf data.tar.gz --no-same-owner -C "${pkgdir}"

    # Enable spotify to open URLs from the webapp
    sed -i 's/^Exec=.*/Exec=spotify --uri=%U/' "${pkgdir}"/usr/share/spotify/spotify.desktop

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
