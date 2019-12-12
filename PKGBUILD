# Maintainer: Jonathon Fernyhough <jonathon at_manjaro dot_org>
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
pkgver=3.1beta4
_pkgver=3.1
pkgrel=1
pkgdesc='Digital audio workstation for music production, remixing and live performance'
arch=('x86_64')
url='https://www.bitwig.com/'
license=('custom')
# Deps from bitwig-studio package
#depends=('jack' 'xdg-utils' 'zenity' 'xcb-util-wm' 'libbsd')
# Deps as suggested by namcap...
depends=('jack' 'gtk2' 'gtk3' 'lib32-gcc-libs' 'libbsd' 'xcb-util' 'xcb-util-wm' 'xdg-utils' 'zenity')
optdepends=('alsa-lib' 'oss' 'ffmpeg: MP3 support')
provides=('bitwig-studio')
options=(!strip)
#source=("https://downloads.bitwig.com/secure/beta/${_pkgver}/bitwig-studio-${pkgver}.deb")
source=("local://bitwig-studio-${pkgver}.deb")
sha256sums=('1ba731f305c7500aafaeea68078531789d7590a62016bc65ee7a417eaf07ab51')

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
	mv applications/${_pkgname}.desktop applications/${pkgname}.desktop
	sed -i "s|${_pkgname}|${pkgname}|g;
	        7s|Studio|Studio Beta|;
	        11s|bitwig-|bitwig-beta-|g" applications/${pkgname}.desktop

	mv mime/packages/${_pkgname}.xml  mime/packages/${pkgname}.xml
	sed -i "s|bitwig-|bitwig-beta-|g;
	        s|Studio |Studio Beta |g" mime/packages/${pkgname}.xml

	cd icons/hicolor/
	for icon in 48x48/apps/*.png scalable/apps/*.svg; do
		mv "$icon" "${icon/./-beta.}"
	done
	for icon in scalable/mimetypes/*.svg; do
		mv "$icon" "${icon/bitwig-/bitwig-beta-}"
	done
}

package() {
	mv ${srcdir}/{opt,usr} ${pkgdir}/

	# Install license
	install -D -m644 ${pkgdir}/opt/${pkgname}/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
