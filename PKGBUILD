# Maintainer: Valerio Pizzi (Pival81) <pival81@yahoo.com>
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk> (for original spotify PKGBUILD)
# Contributor: Eothred <yngve.levinsen@gmail.com> (for original spotify PKGBUILD)

pkgname=spotio
pkgver=v1.0.2
_pkgver=1.0.36.120
_another_pkgver=.g536a862f
pkgrel=1
pkgdesc="A proof-of-concept Rdio-inspired skin for Spotify."
arch=('x86_64' 'i686')
license=('MIT')
url="http://spotio.devinhalladay.com/"
options=('!strip' '!upx')

source=('spotify'
'spotify.protocol'
'spotio.zip::https://github.com/devinhalladay/spotio/archive/master.zip')
md5sums=('cfef2f72647980c639201c6ab39e8534'
         'ef25ddc5b6bf8fe1a0d64cbd79e1f7b4'
	 'SKIP')

source_x86_64=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${_pkgver}${_another_pkgver}-20_amd64.deb")
md5sums_x86_64=('8c27d59e63eca56f36688cca9a7da4a5')

source_i686=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${_pkgver}${_another_pkgver}-2_i386.deb")
md5sums_i686=('1181510a78b329a5f85bba68879d3810')

depends=("alsa-lib>=1.0.14" "gconf" "gtk2" "glib2" "nss" "libsystemd" "libxtst" "libx11" "libxss" "libcurl-compat" "desktop-file-utils" "rtmpdump")
optdepends=('ffmpeg0.10: Adds support for playback of local files'
'zenity: Adds support for importing local files'
)

package() {

  # Normal Spotify installation

	cd "${srcdir}"

	tar -xzf data.tar.gz -C "${pkgdir}"

	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/pixmaps
	install "${pkgdir}"/usr/share/spotify/spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop
	install "${pkgdir}"/usr/share/spotify/icons/spotify-linux-512.png "${pkgdir}"/usr/share/pixmaps/spotify-client.png

	for size in 22 24 32 48 64 128 256 512; do
		install -D "${pkgdir}/usr/share/spotify/icons/spotify-linux-$size.png" \
			"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png"
	done

	chmod -R go-w "${pkgdir}"/usr

	# Bin Script
	rm "${pkgdir}"/usr/bin/spotify
	install -Dm755 "${srcdir}/spotify" "${pkgdir}/usr/bin/spotify"

	# Copy protocol file if KDE is installed
	if [ -d /usr/share/kservices5 ]; then
		echo "Installing with KDE support"
		install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kservices5/spotify.protocol"
	fi

  # Spotio installation (from now on the commands are taken from setup-linux.sh)

	find $pkgdir/usr/share/spotify/Apps/ -iname "*.spa" -exec bash -c 'mv "$0" "${0%\.spa}.zip"' {} \;

	ls $pkgdir/usr/share/spotify/Apps/*.zip | awk -F'.zip' '{print "unzip -o "$0" -d "$1}' | bash

	rm $pkgdir/usr/share/spotify/Apps/*.zip

	cp -R spotio-master/Apps/* $pkgdir/usr/share/spotify/Apps/

	find $pkgdir/usr/share/spotify/Apps/* -maxdepth 0 -type d | awk -F '' '{print "END_DIR=`basename " $0"`; cd " $0 "; zip -q -r ../$END_DIR.spa *; cd ../../../../../ ; rm -r "$0}' | bash

	ln -s /usr/bin/spotify $pkgdir/usr/bin/spotio # ok, this is actually mine

}

