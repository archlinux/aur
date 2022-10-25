# Maintainer: Robin H. <robin at blckct dot io>
pkgname=alfaview-beta
pkgver=8.57.0
pkgrel=1
pkgdesc='High quality audio video conferencing for professional online meetings and live classes'
arch=('x86_64')
url='https://alfaview.com/'
license=('unknown')
# not sure about the deps, copy-pasted from debian package (feedback required)
depends=('ttf-roboto' 'libsecret' 'xdg-utils' 'freetype2' 'fontconfig' 'gst-plugins-bad' 'libxfixes' 'alsa-lib' 'libxkbcommon' 'dbus' 'libpulse')
conflicts=('alfaview')
provides=("alfaview=${pkgver}")
options=('!strip')
install="$pkgname.install"
source=("https://production-alfaview-assets.alfaview.com/beta/linux/alfaview_${pkgver}.deb")
noextract=("alfaview_${pkgver}.deb")
sha256sums=('c581e2fa538e344d9cc4472eb8dd9b5a1e641797dc7c236ad86208efdd881aba')


prepare() {
    mkdir -p deb-data
    bsdtar -O -xf "alfaview_${pkgver}.deb" data.tar.xz | bsdtar -C ./deb-data -xJf -
    # Adding beta update chennel to settings to avoid update notification on startup
    mkdir -p ~/.local/share/alfaview/settings
    echo $'[General]\nDeployChannel=beta' > ~/.local/share/alfaview/settings/core_settings_local.ini
}

package() {
    mv deb-data/* "${pkgdir}/"
    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /opt/alfaview/alfaview "${pkgdir}/usr/bin/alfaview"
}
