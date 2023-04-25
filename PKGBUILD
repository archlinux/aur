# Maintainer: Robin H. <robin at blckct dot io>
pkgname=alfaview-beta
pkgver=8.69.1
pkgrel=1
pkgdesc='High quality audio video conferencing for professional online meetings and live classes'
arch=('x86_64')
url='https://alfaview.com/'
license=('unknown')
# not sure about the deps, copy-pasted from debian package (feedback required)
depends=('ttf-roboto' 'libsecret' 'xdg-utils' 'freetype2' 'fontconfig' 'gst-plugins-bad' 'libxfixes' 'alsa-lib' 'libxkbcommon' 'dbus' 'libpulse' 'libtiff5')
conflicts=('alfaview')
provides=("alfaview=${pkgver}")
options=('!strip')
install="$pkgname.install"
source=("https://assets.alfaview.com/beta/linux/deb/alfaview_${pkgver}.deb")
noextract=("alfaview_${pkgver}.deb")
sha256sums=('4fe18645ea9b6114812c4ad2f81be16bb68265403784ccd2916e6312db86e80d')

prepare() {
	mkdir -p deb-data
	bsdtar -O -xf "alfaview_${pkgver}.deb" data.tar.xz | bsdtar -C ./deb-data -xJf -
	# Adding beta update chennel to settings to avoid update notification on startup
	mkdir -p ~/.local/share/alfaview/settings
	echo $'[General]\nDeployChannel=beta' >~/.local/share/alfaview/settings/core_settings_local.ini
}

package() {
	mv deb-data/* "${pkgdir}/"
	mkdir -p "${pkgdir}/usr/bin"
	ln -sf /opt/alfaview/alfaview "${pkgdir}/usr/bin/alfaview"
}
