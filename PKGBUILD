# Maintainer: Gadget3000 <gadget3000@msn.com>
# Contributor: Eothred <yngve.levinsen@gmail.com>
# Contributor: EvanA <evan@thelinuxman.us>
# Contributor: Christopher Reimer <mail+aur[at]c-reimer[dot]de>

pkgname=spotify-beta
pkgver=1.0.19.106
_anotherpkgver=gb8a7150f
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
source=('spotify.protocol' 'spotify.desktop')
source_x86_64=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}_amd64.deb")
source_i686=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}_i386.deb")
sha256sums=('af54f3b90cac46fa100b3f919a9225d10d847617d24aa9af3d832e7689f482c3'\
	'44ae606a73613540922b06af6adc5c5a5e69c6151788902d26ffb08fe17187c2')
sha256sums_x86_64=('be6b99329bb2fccdc9d77bc949dd463576fdb40db7f56195b4284bd348c470be')
sha256sums_i686=('128b5d04dda8a052802fb9e664a996250569696fac359e94ea35043472f5dbcb')

scale_factor=''

prepare() {
    cd "${srcdir}"
    if [ -n "$scale_factor" ]; then
	sed -i "s/{}/--force-device-scale-factor=${scale_factor} /g" spotify.desktop
    else
        sed -i "s/{}//g" spotify.desktop
    fi
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
}

