# Maintainer: Gadget3000 <gadget3000@msn.com>
# Contributor: Eothred <yngve.levinsen@gmail.com>
# Contributor: EvanA <evan@thelinuxman.us>

pkgname=spotify-beta
pkgver=1.0.13.112
_anotherpkgver=g539ef41b
pkgrel=2
pkgdesc="A proprietary peer-to-peer music streaming service"
arch=('x86_64' 'i686')
license=('custom:"Copyright (c) 2006-2010 Spotify Ltd"')
url="http://www.spotify.com"
changelog='spotify.changelog'
options=('!strip')
conflicts=('spotify')

source=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}_amd64.deb"
'spotify.protocol'
)
sha256sums=('1f79cae705ae2e92fe51d4e59ada1011be53820f8186c857b98519a4247b845b'
'af54f3b90cac46fa100b3f919a9225d10d847617d24aa9af3d832e7689f482c3')

depends=("alsa-lib>=1.0.14" "glibc>=2.6" "openssl" "gconf" "nss" "systemd" "gtk2" "libxtst" "libx11" "libcurl-compat" "libxss")
optdepends=('desktop-file-utils: Adds URI support to compatible desktop environments'
'ffmpeg-compat: Adds support for playback of local files'
'libnotify: Adds desktop notifications')

if [ "$CARCH" = "i686" ]; then
	source=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_1.0.13.111.g6bd0deca_i386.deb" 
		"spotify.protocol")
	sha256sums=('f8e5fef534c9fe47194574cf322ce758a39bb49915bf46cc55d7024e6f9eadde'
		'af54f3b90cac46fa100b3f919a9225d10d847617d24aa9af3d832e7689f482c3')
fi

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
