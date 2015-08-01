# Maintainer: NGM89 <ngm270189{at}gmail.com>
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Eothred <yngve.levinsen@gmail.com>
# Contributor: Gadget3000 <gadget3000@msn.com>
# Contributor: EvanA <evan@thelinuxman.us>

pkgname=spotify32bit
pkgver=1.0.11.129
_anotherpkgver=.g61510de3
pkgrel=2
pkgdesc="A proprietary peer-to-peer music streaming service"
arch=('i686')
license=('custom:"Copyright (c) 2006-2010 Spotify Ltd"')
url="http://www.spotify.com"
changelog='spotify.changelog'
options=('!strip')
conflicts=('spotify')

source=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}${_anotherpkgver}_i386.deb"
'spotify.protocol'
)
md5sums=('4e467409f2de399e99d13cde84dc2f3d'
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
    echo "LD_PRELOAD=libcurl.so.3 /usr/share/spotify/spotify \$@" >> "${pkgdir}"/usr/bin/spotify
    chmod +x "${pkgdir}"/usr/bin/spotify

    # Copy license

    # Copy protocol file if KDE is installed
    if [ -f /usr/bin/startkde ]; then
        echo "Installing with KDE support"
        install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kde4/services/spotify.protocol"
    fi
}
