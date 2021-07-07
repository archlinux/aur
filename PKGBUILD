# Maintainer: Jonathon Fernyhough <jonathon at_m2x+dev>
# Contributor: Aleksej Komarov <stylemistake@gmail.com>
# Contributor: MKzero <info[at]linux-web-development[dot]de>
# Upstream: Bitwig GmbH <support@bitwig.com>

# Original PKGBUILD taken wholesale from stylemistake's bitwig-studio package
# JF added a prepare() to allow side-by-side installation with release version

# As of 2.5beta4, Bitwig have moved the beta packages and you'll need to log in
# to download the source deb package. I asked about it but they're keeping it
# that way. :(

pkgname=bitwig-studio-beta
_pkgname=bitwig-studio
_pkgver=4.0
pkgver=${_pkgver}beta7
pkgrel=1
pkgdesc='Digital audio workstation for music production, remixing and live performance'
arch=('x86_64')
url='https://www.bitwig.com/'
license=('custom')
# Deps from bitwig-studio package
#depends=('jack' 'xdg-utils' 'zenity' 'xcb-util-wm' 'libbsd')
# Deps as suggested by namcap...
depends=('gtk3' 'lib32-libx11' 'lib32-libxkbcommon' 'libxkbcommon-x11' 'xcb-util' 'xcb-util-wm')
optdepends=('alsa-lib' 'jack' 'oss' 'ffmpeg: MP3 support')
provides=('bitwig-studio')
options=(!strip)
source=("$_pkgname-$pkgver.deb::https://www.bitwig.com/dl/?id=447&os=installer_linux")
b2sums=('f291b9c12f3fc1515f9aa1146fe4553b2341ec77f7b9f24a4b9be49d3a62603b18366464747df9eb8bd7263efd7e3c79dce208ad9a05cc479d88b2da61a8ecb9')

prepare() {
	msg2 "Unpacking archive contents..."
	bsdtar -xf ${srcdir}/data.tar.xz -C ${srcdir}/

	msg2 "Moving things around so we can install side-by-side with bitwig-studio..."
	cd ${srcdir}/opt/
	mv ${_pkgname} ${pkgname}

	cd ${srcdir}/usr/
	rm bin/${_pkgname}
	ln -s /opt/${pkgname}/${_pkgname} bin/${pkgname}

	cd share/
	mv applications/com.bitwig.BitwigStudio.desktop applications/com.bitwig.BitwigStudioBeta.desktop
	sed -i "s|${_pkgname}|${pkgname}|g;
	        s|Bitwig Studio|Bitwig Studio Beta|g;
	        s|BitwigStudio|BitwigStudioBeta|g;
	        12s|bitwig-|bitwig-beta-|g;" applications/com.bitwig.BitwigStudioBeta.desktop

	mv metainfo/com.bitwig.BitwigStudio.appdata.xml metainfo/com.bitwig.BitwigStudioBeta.appdata.xml
	sed -i "5s|BitwigStudio|BitwigStudioBeta|;
	        8s|Bitwig Studio|Bitwig Studio Beta|;
	        s|application/bitwig-|application/bitwig-beta-|g" metainfo/com.bitwig.BitwigStudioBeta.appdata.xml

	mv mime/packages/com.bitwig.BitwigStudio.xml  mime/packages/com.bitwig.BitwigStudioBeta.xml
	sed -i "s|bitwig-|bitwig-beta-|g;
	        s|BitwigStudio|BitwigStudioBeta|g;
	        s|Studio |Studio Beta |g" mime/packages/com.bitwig.BitwigStudioBeta.xml

	cd icons/hicolor/
	for icon in 48x48/apps/*.png 128x128/apps/*png scalable/apps/*.svg; do
		mv "$icon" "${icon/Studio/StudioBeta}"
	done
	for icon in scalable/mimetypes/*.svg; do
		mv "$icon" "${icon/Studio.application-bitwig/StudioBeta.application-bitwig-beta}"
	done
}

package() {
	mv ${srcdir}/{opt,usr} ${pkgdir}/

	# Install license
	install -D -m644 ${pkgdir}/opt/${pkgname}/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
