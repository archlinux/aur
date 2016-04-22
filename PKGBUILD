# Maintainer: Daniel Milde <daniel at milde dot cz>
# Contributor: Eothred <yngve.levinsen@gmail.com>
# Contributor: EvanA <evan@thelinuxman.us>
# Contributor: Christopher Reimer <mail+aur[at]c-reimer[dot]de>

pkgname=spotify-beta
pkgver=1.0.27.71
_anotherpkgver=g0a26e3b2
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
source_x86_64=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}-9_amd64.deb")
source_i686=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_1.0.27.73.g602ced10-2_i386.deb")
sha256sums=('af54f3b90cac46fa100b3f919a9225d10d847617d24aa9af3d832e7689f482c3'
            '44ae606a73613540922b06af6adc5c5a5e69c6151788902d26ffb08fe17187c2')
sha256sums_x86_64=('82dc602ed17bbb9d0f2b161c69226f8a291f85d544fe4abffa347860374340e7')
sha256sums_i686=('b7113e2aa305cd2389d8861c6212de05ed5a9cfaa2a85e8021b355a848634f34')

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

