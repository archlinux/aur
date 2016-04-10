# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>

pkgname=spotify094
pkgver=0.9.4.183
_anotherpkgver=.g644e24e.428-1
pkgrel=2
pkgdesc="A proprietary music streaming service (pre dark-UI version)"
arch=('x86_64' 'i686')
license=('custom:"Copyright (c) 2006-2010 Spotify Ltd"')
install=spotify.install
url="http://www.spotify.com"
changelog='spotify.changelog'
options=('!strip')
provides=("spotify=${pkgver}")
conflicts=('spotify-beta'
           'spotify-stable'
           'spotify')

source=('spotify.protocol'
        'spotify')
md5sums=('ef25ddc5b6bf8fe1a0d64cbd79e1f7b4'
         '375af807fdd88d17dc16a6a746e57ce5')

source_x86_64=("http://filedump.swooshalicio.us/spotify/deb/spotify-client_0.9.4.183.g644e24e.428-1_amd64.deb")
md5sums_x86_64=('e5d6049689a8ef0f3699986e47478fe2')

source_i686=("http://filedump.swooshalicio.us/spotify/deb/spotify-client_0.9.4.183.g644e24e.428-1_i386.deb")
md5sums_i686=('20113ac3d6760ded6940fef8143fa9a3')

depends=("alsa-lib>=1.0.14"
         "glibc>=2.6"
         "libxss>=1.2.0"
         "qt4>=4.5.0"
         "openssl098"
         "usbutils"
         "nspr>=4.0"
         "nspr<5.0"
         "gconf"
         "nss"
         "glib2"
         "xdg-utils"
         "dbus"
         "systemd"
         "libgcrypt15"
         "gtk2")
optdepends=('desktop-file-utils: Adds URI support to compatible desktop environments'
            'ffmpeg-compat: Adds support for playback of local files')

package() {
  cd "${srcdir}"

	tar -xzf data.tar.gz -C "${pkgdir}"

  install -d "${pkgdir}/usr/share/"
  mv "${pkgdir}/opt/spotify" "${pkgdir}/usr/share/"
  rm -r "${pkgdir}/opt"

  install -d "${pkgdir}/usr/share/spotify/libs/"

  # Bin Script
  install -Dm755 "${srcdir}/spotify" "${pkgdir}/usr/bin/spotify"

  # Libraries
  ln -s /usr/lib/libplc4.so "${pkgdir}/usr/share/spotify/libs/libplc4.so.0d"
  ln -s /usr/lib/libnspr4.so "${pkgdir}/usr/share/spotify/libs/libnspr4.so.0d"
  ln -s /usr/lib/libnss3.so "${pkgdir}/usr/share/spotify/libs/libnss3.so.1d"
  ln -s /usr/lib/libnssutil3.so "${pkgdir}/usr/share/spotify/libs/libnssutil3.so.1d"
  ln -s /usr/lib/libsmime3.so "${pkgdir}/usr/share/spotify/libs/libsmime3.so.1d"
  ln -s /usr/lib/libudev.so "${pkgdir}/usr/share/spotify/libs/libudev.so.0"

  # Copy license
  install -Dm644 "${pkgdir}/usr/share/doc/spotify-client/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"

  # Copy protocol file if KDE is installed
  if [ -f /usr/bin/startkde ]; then
    echo "Installing with KDE support"
    install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kde4/services/spotify.protocol"
  fi
}