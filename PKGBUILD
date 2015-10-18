# Maintainer: Gadget3000 <gadget3000@msn.com>
# Contributor: Eothred <yngve.levinsen@gmail.com>
# Contributor: EvanA <evan@thelinuxman.us>
# Contributor: Christopher Reimer <mail+aur[at]c-reimer[dot]de>

pkgname=spotify-beta
pkgver=1.0.16.104
_anotherpkgver=g3b776c9e
pkgrel=2
pkgdesc="A proprietary peer-to-peer music streaming service"
arch=('x86_64' 'i686')
license=('custom:"Copyright (c) 2006-2010 Spotify Ltd"')
url="http://www.spotify.com"
changelog='spotify.changelog'
options=('!strip')
conflicts=('spotify')
depends=("alsa-lib>=1.0.14" "glibc>=2.6" "openssl" "gconf" "nss" "systemd" "gtk2" "libxtst" "libx11" "libcurl-compat" "libxss")
optdepends=('desktop-file-utils: Adds URI support to compatible desktop environments'
            'ffmpeg-compat: Adds support for playback of local files'
            'libnotify: Adds desktop notifications')
source=('spotify.protocol')
source_x86_64=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}_amd64.deb")
source_i686=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}_i386.deb")
sha256sums=('af54f3b90cac46fa100b3f919a9225d10d847617d24aa9af3d832e7689f482c3')
sha256sums_x86_64=('2b3e7a7cccadaa4567450e9d3c801a2f72ec9a5ad9295241701874310f6bd96a')
sha256sums_i686=('b61ba5b2a42db6e888f002094d3bae7493997e18f2f7821208bcf90b6b129aff')

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
