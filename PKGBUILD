# Maintainer: Valerio Pizzi (Pival81) <pival81@yahoo.com>
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk> (for original spotify PKGBUILD)
# Contributor: Eothred <yngve.levinsen@gmail.com> (for original spotify PKGBUILD)

pkgname=spotio
_pkgver=1.0.49.125
_another_pkgver=g72ee7853
_yetanotherpkgrel64=111
_yetanotherpkgrel32=22
pkgver=1.0.2_${_pkgver}.${_another_pkgver}.${_yetanotherpkgrel}
pkgrel=2
pkgdesc="A proof-of-concept Rdio-inspired skin for Spotify. Temp. using Owlinated's repo for player theme fix."
makedepends=('imagemagick')
arch=('x86_64' 'i686')
license=('MIT')
url="http://spotio.devinhalladay.com/"
options=('!strip' '!upx')

provides=('spotify')
conflicts=('spotify' 'spotify-legacy' 'spotify094')

source=('spotify'
'spotify.protocol'
'spotio-icons.zip'
'spotio.desktop'
'spotio.zip::https://github.com/Owlinated/spotio/archive/master.zip')

sha256sums=('989920e9360cadc1a8103b8c04acf0c87cb7911eb9a09dddb0cf4708d6249d34'
	   'af54f3b90cac46fa100b3f919a9225d10d847617d24aa9af3d832e7689f482c3'
	   '3fdc1ebd9e64bae98cfd2bc9fc3199427bd7ec680254cd6361d9b0f4bb121134'
	   'abab92b537b10c861023927db10d71c5cd6bcc0afc7ab7a5ffae7094cc3c6f46'
	   'SKIP')
sha256sums_x86_64=('1d6d1cccfb7f996b835f21c8dbabc16ca4bd214878e06738dba7886640470050')
sha256sums_i686=('96c02fdc77991feb0797089d701744c2de4584322f966a1c070b559df27f9b04')

source_x86_64=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${_pkgver}.${_another_pkgver}-${_yetanotherpkgrel64}_amd64.deb")

source_i686=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${_pkgver}.${_another_pkgver}-${_yetanotherpkgrel32}_i386.deb")

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

	find "${pkgdir}/usr/share/spotify/Apps/" -iname "*.spa" -exec bash -c 'mv "$0" "${0%\.spa}.zip"' {} \;

	ls ${pkgdir}/usr/share/spotify/Apps/*.zip | awk -F'.zip' '{print "unzip -o "$0" -d "$1}' | bash

	rm ${pkgdir}/usr/share/spotify/Apps/*.zip

	cp -R spotio-master/Apps/* $pkgdir/usr/share/spotify/Apps/

	find $pkgdir/usr/share/spotify/Apps/* -maxdepth 0 -type d | awk -F '' '{print "END_DIR=`basename " $0"`; cd " $0 "; zip -q -r ../$END_DIR.spa *; cd ../../../../../ ; rm -r "$0}' | bash

	ln -s "/usr/bin/spotify" "${pkgdir}/usr/bin/spotio" # ok, this is actually mine

	JUNK=( 22 24 32 48 64 128 256 512 )

	for i in "${JUNK[@]}" ; do # replace all the spotify icons with the spotio icons.
		rm "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/spotify.png"

		install -Dm644 "${srcdir}/spotio-icons/${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/spotio.png"

		rm ${pkgdir}/usr/share/spotify/icons/spotify-linux-{16,${i}}.png

		install -Dm644 "${srcdir}/spotio-icons/${i}x${i}.png" "${pkgdir}/usr/share/spotify/icons/spotify-linux-${i}.png"

		install -Dm644 "${srcdir}/spotio-icons/16x16.png" "${pkgdir}/usr/share/spotify/icons/spotify-linux-16.png"

		rm "${pkgdir}/usr/share/pixmaps/spotify-client.png"

		install -Dm644 "${srcdir}/spotio-icons/512x512.png" "${pkgdir}/usr/share/pixmaps/spotify-client.png"
	done

	rm "${pkgdir}/usr/share/spotify/icons/spotify_icon.ico"

	convert "${srcdir}/spotio-icons/48x48.png" "${pkgdir}/usr/share/spotify/icons/spotify_icon.ico"

	install -Dm644 "${srcdir}/spotio.desktop" "${pkgdir}/usr/share/applications/spotio.desktop"
	rm "${pkgdir}/usr/share/applications/spotify.desktop" # replace the spotify .desktop file with the spotio's one.
}
