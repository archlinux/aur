# Maintainer: Gadget3000 <gadget3000@msn.com>
# Contributor: Eothred <yngve.levinsen@gmail.com>
# Contributor: EvanA <evan@thelinuxman.us>

pkgname=spotify-beta
pkgver=1.0.9.133
_anotherpkgver=.gcedaee38
pkgrel=1
pkgdesc="A proprietary peer-to-peer music streaming service"
arch=('x86_64')
license=('custom:"Copyright (c) 2006-2010 Spotify Ltd"')
url="http://www.spotify.com"
changelog='spotify.changelog'
options=('!strip')
conflicts=('spotify')

source=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}${_anotherpkgver}_amd64.deb"
'spotify.protocol'
)
md5sums=('6134f1fde550d3c6c22c50c2627aa088'
'ef25ddc5b6bf8fe1a0d64cbd79e1f7b4')

depends=("alsa-lib>=1.0.14" "glibc>=2.6" "openssl" "gconf" "nss" "systemd" "gtk2" "libxtst" "libx11" "libcurl-compat")
optdepends=('desktop-file-utils: Adds URI support to compatible desktop environments'
'ffmpeg-compat: Adds support for playback of local files'
'libnotify: Adds desktop notifications')

package() {
    cd "${srcdir}"

    tar -xf data.tar.gz -C "${pkgdir}"

    install -d "${pkgdir}/usr/share/"
    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/usr/share/pixmaps
    install "${pkgdir}"/usr/share/spotify/spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop
    install "${pkgdir}"/usr/share/spotify/icons/spotify-linux-512.png "${pkgdir}"/usr/share/pixmaps/spotify-client.png

    rm "${pkgdir}"/usr/bin/spotify
    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/spotify
    echo "LD_PRELOAD=libcurl.so.3 /usr/share/spotify/spotify" >> "${pkgdir}"/usr/bin/spotify
    chmod +x "${pkgdir}"/usr/bin/spotify

    # Copy license

    # Copy protocol file if KDE is installed
    if [ -f /usr/bin/startkde ]; then
        echo "Installing with KDE support"
        install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kde4/services/spotify.protocol"
    fi
}
