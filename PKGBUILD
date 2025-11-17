# Maintainer: Jonathon Fernyhough <jonathon at_m2x+dev>
# Contributor: Aleksej Komarov <stylemistake@gmail.com>
# Contributor: MKzero <info[at]linux-web-development[dot]de>
# Upstream: Bitwig GmbH <support@bitwig.com>

# Original PKGBUILD taken wholesale from stylemistake's bitwig-studio package
# JF added a prepare() to allow side-by-side installation with release version

pkgname=bitwig-studio-beta
_pkgname=bitwig-studio
_pkgver=6.0
pkgver=${_pkgver}.6
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
#source=("$_pkgname-$pkgver.deb::https://downloads.bitwig.com/${_pkgver}%20Beta%20${pkgver#*beta}/bitwig-studio-${pkgver}.deb")
source=("$_pkgname-$pkgver.deb::https://www.bitwig.com/dl/Bitwig%20Studio/6.0%20Beta%206/installer_linux/")
b2sums=('aff2c63a2e531ed641d18c1c5ff8f78e7b52796da51f9a1d8c92a0c92d57dfefc9749cbf03c7c49dece5265dc3c59b4d0c73ee005d1ab728cd87cc163f70862c')

prepare() {
	msg2 "Unpacking archive contents..."
	bsdtar -xf "${srcdir}/data.tar.zst" -C ${srcdir}/

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
		mv "$icon" "${icon/Studio/StudioBeta}"
	done
}

package() {
	mv ${srcdir}/{opt,usr} ${pkgdir}/

	# Install license
	install -D -m644 ${pkgdir}/opt/${pkgname}/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
