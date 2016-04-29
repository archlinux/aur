# Maintainer: Daniel Milde <daniel at milde dot cz>
# Contributor: Eothred <yngve.levinsen@gmail.com>
# Contributor: EvanA <evan@thelinuxman.us>
# Contributor: Christopher Reimer <mail+aur[at]c-reimer[dot]de>

pkgname=spotify-beta
pkgver=1.0.28.89
_anotherpkgver=gf959d4ce
pkgrel=3
pkgdesc="A proprietary peer-to-peer music streaming service"
arch=('x86_64' 'i686')
license=('custom:"Copyright (c) 2006-2010 Spotify Ltd"')
url="http://www.spotify.com"
changelog='spotify.changelog'
options=('!strip')
conflicts=('spotify')
depends=("alsa-lib>=1.0.14" "glibc>=2.6" "openssl" "gconf" "nss" "systemd" "gtk2" "libxtst" "libx11" "libcurl-compat" "libxss" "rtmpdump" "zenity")
optdepends=('desktop-file-utils: Adds URI support to compatible desktop environments'
            'ffmpeg-compat: Adds support for playback of local files'
            'libnotify: Adds desktop notifications')
source=('spotify.protocol' 'spotify.desktop')
source_x86_64=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}-37_amd64.deb")
source_i686=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}-4_i386.deb")
sha256sums=('af54f3b90cac46fa100b3f919a9225d10d847617d24aa9af3d832e7689f482c3'
            '44ae606a73613540922b06af6adc5c5a5e69c6151788902d26ffb08fe17187c2')
sha256sums_x86_64=('c563f1c0cd7a632802431191714bd23be05009ce93d70571cc217e606575661b')
sha256sums_i686=('d79ffa8e1af22262ab52287a5d8538b74840d7f2f164776309d9f68a38ae0084')

scale_factor=1.0000001

prepare() {
    cd "${srcdir}"
    sed -i "s/{}/--force-device-scale-factor=${scale_factor} /g" spotify.desktop
}

package() {
    cd "${srcdir}"

    tar -xf data.tar.gz -C "${pkgdir}"

    install -d "${pkgdir}/usr/share/"
    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/usr/share/pixmaps
    install spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop
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

    chmod 755 "${pkgdir}/usr"
    chmod 755 "${pkgdir}/usr/bin"
    chmod 755 "${pkgdir}/usr/share/doc"
    chmod 755 "${pkgdir}/usr/share/spotify"
    chmod 755 "${pkgdir}/usr/share/doc/spotify-client"
}

