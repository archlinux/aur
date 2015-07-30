# Maintainer: NGM89 <ngm270189{at}gmail.com>
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Eothred <yngve.levinsen@gmail.com>


pkgname=spotify32bit
_realname=spotify
pkgver=0.9.4
pkgrel=3
pkgdesc="Last 32Bit version of proprietary peer-to-peer music streaming service"
arch=('i686')
license=('custom:"Copyright (c) 2006-2010 Spotify Ltd"')
install=spotify.install
url="http://www.spotify.com"
changelog='spotify.changelog'
options=('!strip')
conflicts=('spotify-beta')

source=("http://carburante.altervista.org/$_realname-0-9-4-183-en-ubu.deb"
'spotify'
'spotify.protocol'
)
md5sums=('20113ac3d6760ded6940fef8143fa9a3'
'd443873ef440a6b59d2e3deef64ab74b'
'ef25ddc5b6bf8fe1a0d64cbd79e1f7b4')

depends=("alsa-lib>=1.0.14" "glibc>=2.6" "libxss>=1.2.0" "qt4>=4.5.0" "openssl098" "nspr>=4.0" "nspr<5.0" "gconf" "nss" "dbus" "systemd" "libgcrypt15" "gtk2")
optdepends=('desktop-file-utils: Adds URI support to compatible desktop environments'
            'ffmpeg-compat: Adds support for playback of local files'
						'libnotify: Adds desktop notifications'
						)

package() {
  cd "${srcdir}"

	tar zxvf data.tar.gz -C "${pkgdir}"

  install -d "${pkgdir}/usr/share/"
  mv "${pkgdir}/opt/spotify" "${pkgdir}/usr/share/"
  rm -r "${pkgdir}/opt"

	# Bin Script
  install -Dm755 "${srcdir}/spotify" "${pkgdir}/usr/bin/spotify"

	# Copy license
  install -Dm644 "${pkgdir}/usr/share/doc/spotify-client/copyright" "${pkgdir}/usr/share/licenses/spotify/copyright"

  	# Copy protocol file if KDE is installed
  if [ -f /usr/bin/startkde ]; then
    echo "Installing with KDE support"
    install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kde4/services/spotify.protocol"
  fi

	#create symlinks for newer libary versions
  mkdir "${pkgdir}/usr/lib/"
  ln -s /usr/lib/libsmime3.so "${pkgdir}/usr/lib/libsmime3.so.1d"
  ln -s /usr/lib/libplc4.so "${pkgdir}/usr/lib/libplc4.so.0d"
  ln -s /usr/lib/libnspr4.so "${pkgdir}/usr/lib/libnspr4.so.0d"
  ln -s /usr/lib/libnss3.so "${pkgdir}/usr/lib/libnss3.so.1d"
  ln -s /usr/lib/libnssutil3.so "${pkgdir}/usr/lib/libnssutil3.so.1d"


}
